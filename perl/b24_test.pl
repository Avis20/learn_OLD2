#!/usr/local/bin/perl

use lib::abs        qw| ../../lib |;
use uni::perl       qw| :dumper |;

use CRM_HEX::Schema::MainDB;
use CRM_HEX::Model::Bitrix24;
use CRM_HEX::Plugin::Utils;

my $subs = {
    manual          => \&manual,
    # set_contract    => \&set_contract,
    buy             => sub { set_contract('buy') },
    prolong         => sub { set_contract('prolong') },
    trial           => \&trial,
    accept          => \&submit_payment,
    clear           => \&clear,
};

my $cmd = $ARGV[0];
die 'no command!' unless $cmd && $subs->{$cmd};

my $config = External::Config2->new( project => 'fonmix_crm' );
my $schema = CRM_HEX::Schema::MainDB->connect();
die "Can't connect to DataBase" unless $schema->storage->dbh->ping;

my ( $calc_request, $contract, $user, $package, $person, $filials, $api_key );
unless ( $cmd eq 'clear' ) { 
    $calc_request    = $schema->resultset('Service::CalcRequest')->search({
        contract_id     => '5f22e32e-0000-0000-0000-0000bdfde265',
        'me.ts_create'       => \"> NOW() - INTERVAL '24 HOURS'", },
        { prefetch      => [qw/contract user service_package/] },
    )->first;
    die 'No calc request!' unless $calc_request;
    $contract = $calc_request->contract;
    $user     = $calc_request->user;
    $package  = $calc_request->service_package;
    $person   = $calc_request->json_person->{output};
    $filials  = $calc_request->json_calc->{filials};
    $api_key  = $contract->json_data->{system_params}{api_key};
}

my $b24 = CRM_HEX::Model::Bitrix24->new( %{$config->{Bitrix24}},
    api_key => $api_key // '1/nhkz0ir4car58i92',
    debug   => 1,
    locations => [qw/crm_lead_delete crm_lead_list crm_deal_delete crm_contact_list crm_contact_delete/],
);

# submit_payment();
# set_contract();
# trial();
$subs->{$cmd}->();

# Ручная заявка
sub manual {
    my ( $resp, $error_code, $error_data ) = $b24->create_manual_task({
        lead_id => $contract->json_data->{system_params}{lead_id},
        user    => {
            map { $_ => $user->$_ } qw/first_name last_name phone email/,
        },
        ogrn    => $calc_request->json_person->{input}{ogrn},
        filials => $filials,
        'package'     => {
            ( map { $_ => $package->$_ } qw/alias name/ ),
            period => $calc_request->period,
        },
    });

    warn $resp->{task_data}{id};
    warn dumper $resp->{task_data};

    warn dumper [$resp, $error_code, $error_data];
}

sub set_contract {

    my $action = shift;

    my $cities = { map { $_->id => $_ } $schema->resultset('Thesaurus::City')->search({ id => [ map { $_->{city_id} } @{$calc_request->json_calc->{filials}} ]})->all };

    my $categories = { map { $_->id => $_ } $schema->resultset('Filial::Category')->search({ id => [ map { $_->{category_id} } @{$calc_request->json_calc->{filials}} ]})->all };

    foreach my $filial ( @$filials ) {
        $filial->{city_name} = $cities->{$filial->{city_id}}->name;
        $filial->{category_id} = $categories->{$filial->{category_id}}->json_data->{projects}{acrm}{external_id};
    }

    # Покупка
    my ( $resp, $error_code, $error_data ) = $b24->set_contract({
        action  => $action, 
        lead_id => $contract->json_data->{system_params}{lead_id},
        user    => {
            map { $_ => $user->$_ } qw/first_name last_name phone email/,
        },
        contract => {
            ( map { $_ => $contract->$_ } qw/id number count_filials/ ),
            date_start => $contract->date_start->ymd,
            ( $contract->date_end ? ( date_end   => $contract->date_end->ymd ) : () ),
            date       => $contract->ts_create->ymd,
            total_cost => $calc_request->json_calc->{service_package}{total_sum},
            pay_type   => 1,
            pay_status => 11,
            app_type   => 2,
            'package'     => {
                ( map { $_ => $package->$_ } qw/alias name/ ),
                period => $calc_request->period,
            },
        },
        person  => {
            ( map { $person->{$_} ? ( $_ => $person->{$_} ) : () } qw/name inn kpp ogrn legal_name head_position head_name legal_address/ ),
        },
        filials => $calc_request->json_calc->{filials},
    });

    warn dumper [$resp, $error_code, $error_data];
}

sub trial {
    my ( $contract_id ) = @_;
 # Покупка
    my $trial = $schema->resultset('Trial::Item')->search({ contract_id => $contract->id })->first;

    die 'No trial' unless $trial;

    my ( $resp, $error_code, $error_data ) = $b24->crm_lead_add({
        fields => {
            TITLE           => "Илья Миронов",
            NAME            => "Илья",
            LAST_NAME       => "Миронов",
            ADDRESS_CITY    => "Новокуйбышевск",
            PHONE           => [ { VALUE => "+9871234567" } ],
            EMAIL           => [ { VALUE => "i.mironov\@fonmix.ru" }, ],
            UF_CRM_CLIENT_OBJ_CATEGORY => [ "114" ],
            UF_CRM_SITE_FORM_ID     => "trial",
            UF_CRM_SITE_PAGE_URL    => "landing-aws-dev.fonmix.ru/",
            SOURCE_ID               => "WEB"
        },
        params => {
            REGISTER_SONET_EVENT => "Y"
        }
    });

    warn dumper [$resp, $error_code, $error_data];

    my $lead_id = $resp->{result};
    my $json_data = $contract->json_data;
    $json_data->{system_params}{lead_id} = $lead_id;
    my $trial_json_data = $trial->json_data;
    my $url = sprintf("https://b24.dev.fonmix.ru/local/restfm/callback/?key=nhkz0ir4car58i92&method_name=crm.lead.update&lid_id=%d", $lead_id);
    $trial_json_data->{callback} = $url; 
    $trial_json_data->{system_params}{lead_id} = $lead_id;
    $trial->update({
        json_data => $trial_json_data,
    });

    $contract->update({
        json_data => $json_data,
    });

    warn $url;

    CRM_HEX::Plugin::Utils->trial_callback( $url, 'email_verified', $trial->task_id );
    CRM_HEX::Plugin::Utils->trial_callback( $url, 'activation_success', $trial->task_id );
    CRM_HEX::Plugin::Utils->trial_callback( $url, 'user_logged_in', $trial->task_id );
}

# Подтверждение оплаты
sub submit_payment {
    my ( $resp, $error_code, $error_data ) = $b24->update_contract({
        lead_id => $contract->json_data->{system_params}{lead_id},
        contract => {
            ( map { $_ => $contract->$_ } qw/id number/ ),
            data    => $contract->ts_create->ymd,
            pay_status => 13,
            'package'     => {
                alias      => $package->alias,
                date_start => '2020-08-05',
                date_end   => '2020-08-15',
            },
        },
    });

    warn dumper [$resp, $error_code, $error_data];
}

sub clear {
    my ( $template ) = @_;
    warn 'Clear leads';
    my ( $resp, $error_code, $error_data ) = $b24->crm_lead_list({
        filter => {
            TITLE => "Илья Миронов",
        },
        select => ['ID'],
    });

    foreach my $lead ( @{ $resp->{result} || [] } ) {
        $b24->crm_lead_delete({ id => $lead->{ID} });
    }

    warn 'Clear deals';
    ( $resp, $error_code, $error_data ) = $b24->crm_deal_list({
        filter => {
            TITLE => "Илья Миронов",
        },
        select => ['ID'],
    });
    foreach my $deal ( @{ $resp->{result} || [] } ) {
        $b24->crm_deal_delete({ ID => $deal->{ID} });
    }

    warn 'Clear contacts';
    ( $resp, $error_code, $error_data ) = $b24->crm_contact_list({
        filter => {
            EMAIL => 'i.mironov@fonmix.ru',
        },
        select => ['ID','NAME','LAST_NAME'],
    });
    
    foreach my $deal ( @{ $resp->{result} || [] } ) {
        $b24->crm_contact_delete({ ID => $deal->{ID} });
    }
}