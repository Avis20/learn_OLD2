#!/usr/local/bin/perl

use strict;
#use warnings;

#use LWP::Debug qw(+);
use LWP::UserAgent;
use HTTP::Cookies;
#use Encode qw/decode/;
use Encode qw/encode decode/;
use Data::Dumper;

my @success_proxies = ();
my @good_proxies = ();
my @proxy_list = qw(105.235.197.190:8080
59.91.122.1:54086
193.150.107.150:47898
93.125.110.112:33045
178.183.13.169:41006
185.62.188.84:8080
36.67.116.165:8080
37.212.175.35:8080
212.72.133.212:57771
168.227.48.147:60768
194.44.247.118:35989
81.192.193.160:50594
181.224.160.198:50291
189.76.83.2:8888
95.78.113.84:37728
78.156.39.170:45780
117.54.10.93:51333
89.178.234.177:8080
187.28.231.1:39635
124.124.99.210:3128
85.93.54.201:44620
62.133.4.100:44833
181.64.178.37:57136
186.71.67.66:8080
217.182.74.214:54321
109.68.187.21:3128
31.28.0.204:8080
92.51.46.1:8080
62.76.123.224:8080
85.236.183.120:8080
109.201.97.235:39125
109.195.177.144:61507
109.237.1.219:8080
128.127.98.59:4550
158.58.130.185:50016
109.60.140.47:41258
109.75.140.158:59916
109.252.237.230:34417
109.195.210.117:32231
134.90.181.7:54353
109.188.80.79:40559
109.194.175.165:61872
46.235.71.241:8080
109.72.70.58:55853
109.60.137.186:80
109.195.23.223:46162
158.58.132.12:56962
109.161.48.228:53281
109.94.178.112:54587
146.120.227.3:8080
134.19.147.72:44812
158.58.133.187:34128
109.195.69.29:40268
109.238.82.10:48285
);

my $url = 'http://officedepot.com';
my @set_cookie;

for (my $count = 0; $count <= $#proxy_list; $count++) {
 	print $proxy_list[$count] . " ";
 	my $ua = LWP::UserAgent->new;
 	$ua->proxy( 'http', "http://" . $proxy_list[$count] );

 	#my $cookie_jar = HTTP::Cookies->new();
 	
        #print $cookie_jar->as_string;
        $ua->default_header("Connection" => "keep-alive");
        $ua->default_header("Accept" => "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
        $ua->default_header("Accept-Language" => "en-US,en;q=0.8");
        $ua->default_header("Accept-Charset" => "ISO-8859-1,utf-8;q=0.7,*;q=0.3");
        #$ua->default_header("Cookie" => "GEO_STATE=CA; GEO_CITY=SANDIEGO; GEO_POSTAL=92101; op1587http___www_officedep_6gum=a01702d03o28a4q08l31u6665; op1587http___www_officedep_6liid=a01702d03o28a4q08l31u6665; opBannerClicked=no; cmTPSet=Y; invited_visitor_814=1; JSESSIONID=0000wXEGIhs0xhXnosbX0TbWt2W:13ddprb4e; jsession_unique_id=1349378501411; CU_BRAND=OD; IBSD_LOCALE=en_US; CID_CART_COOKIE=fYr_vup8jRtef4ydMz7e3J3; ODCSASF=y; usy46gabsosd=ODCSA__-4_1349378502494_3670; atgPlatoStop=1; fs_nocache_guid=A9A78BE662FD4938D1AA82882EECA966; IS3_GSV=DPL-0_TES-1349378503_PCT-1349378503_GeoIP-*_GeoCo-_GeoRg-_GeoCt-_GeoNs-_GeoDm-; IS3_History=1349376269-1-62_1--1+5--1+7--1__1-5-7_; CoreAt=90031492=1|2|0|0|0|0|0|0|0|0|0|1|1|1349374209||&");
        $ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6");
        #BrontesaurusUserAgent
        #$ua->agent($BrontesaurusUserAgent2);
        #$ua->cookie_jar($cookie_jar);
        $ua->timeout(100);
 	my $response = $ua->get($url);
 	print $response->status_line . "\n";
        if ($response->is_success) {
                open (SUCCESSFILE, '>>success.txt'); 	        
                print SUCCESSFILE $proxy_list[$count] . "\n";
                close (SUCCESSFILE);
        } elsif($response->status_line =~ /403/) {
                open (GOODFILE, '>>good.txt'); 	        
                print GOODFILE $proxy_list[$count] . "\n";
                close (GOODFILE);
        } else {
                open (BADFILE, '>>bad.txt'); 	        
                print BADFILE $proxy_list[$count] . "\n";
                close (BADFILE);
        }	
 	
 }


