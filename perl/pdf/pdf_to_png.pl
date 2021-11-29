#! /usr/bin/perl

# Name:                 pdf_to_png.pl
# Authors:              Steve Cookson & James M. Lynes, Jr.
# Created:              January 30, 2015
# Modified By:          James M. Lynes, Jr.
# Last Modified:        February 11, 2015
# Change Log:           1/30/2015 - Program Created
#                       1/30/2015 - added events for filepicker changed & textctrl changed
#                                 - added default filename and crop parameters
#                                 - added spacers to sizers
#                                 - Modified some captions
#                                 - Modified default path
#                                 - Changed Cancel button to Exit(Quit) button
#                       1/31/2015 - Added "system" function call to execute convert CLI program
#                                 - Changed exit(0) to $self->Close to terminate script
#                       2/11/2015 - Changed to safer/list version of the "system" function
#                                 -   as recommended by Johan
# Description:          Script to convert a pdf file to a png file      
#

package main;
use strict;
use warnings;
my $app = App->new();
$app->MainLoop;

package App;
use strict;
use warnings;
use base 'Wx::App';
sub OnInit {
    my $frame = Frame->new();
    $frame->Show(1);
}

package Frame;
use strict;
use warnings;
use Wx qw(:everything);
use base qw(Wx::Frame);
use Data::Dumper;

sub new {
    my ($class, $parent) = @_;

    my $frame = $class->SUPER::new($parent, -1, "PDF to PNG File Converter", wxDefaultPosition, wxDefaultSize);

    #Create controls
    # Fields
    my $pdfLabel=Wx::StaticText->new($frame, wxID_ANY,"Select a PDF file to Convert", wxDefaultPosition, wxDefaultSize);

    my $pdfFilePicker=Wx::FilePickerCtrl->new($frame, wxID_ANY, "", "Select the PDF File","*.pdf",
                          wxDefaultPosition, [400,-1], wxDIRP_DIR_MUST_EXIST|
                          wxDIRP_CHANGE_DIR|wxDIRP_USE_TEXTCTRL);
    $pdfFilePicker->SetPath("~/");
    $frame->{inpath} = "default.pdf";

    my $cropLabel=Wx::StaticText->new($frame, wxID_ANY,"Enter Image cropping Parameters", wxDefaultPosition, wxDefaultSize);
    my $cropStringText=Wx::TextCtrl->new($frame, wxID_ANY,"250x175+10+10", wxDefaultPosition, [200,-1]);
    $frame->{cropstring} = $cropStringText->GetValue;

    # Buttons
    my $okButton = Wx::Button->new($frame, wxID_OK, "", wxDefaultPosition, wxDefaultSize);
    my $exitButton = Wx::Button->new($frame, wxID_EXIT, "", wxDefaultPosition, wxDefaultSize);

    # Create sizers.
    my $verticalSizerFrame = Wx::BoxSizer->new(wxVERTICAL);
    $frame->SetSizer($verticalSizerFrame);
    my $verticalSizerControls = Wx::BoxSizer->new(wxVERTICAL);
    my $horizontalSizerButtons = Wx::BoxSizer->new(wxHORIZONTAL);

    # Lay 'em out.
    $verticalSizerFrame->Add($verticalSizerControls,0,0,0);
    $verticalSizerFrame->Add($horizontalSizerButtons,0,0,0);

    $verticalSizerControls->AddSpacer(15);              # Spacer
    $verticalSizerControls->Add($pdfLabel,0,0,0);
    $verticalSizerControls->Add($pdfFilePicker,0,0,0);
    $verticalSizerControls->AddSpacer(15);              # Spacer 
    $verticalSizerControls->Add($cropLabel,0,0,0);
    $verticalSizerControls->Add($cropStringText,0,0,0);
    $verticalSizerControls->AddSpacer(15);              # Spacer

    $horizontalSizerButtons->Add($okButton,0,0,0);
    $horizontalSizerButtons->Add($exitButton,0,0,0);

    # Event handlers
    Wx::Event::EVT_BUTTON($frame, $okButton, sub {
                          my ($self, $event) = @_;
                          #print "\nOK Button\n";
                          #Convert the pdf file to png using
                          # "convert" command line command via "system" function call
                          my @convertcommand = ( "convert",
                                                 $self->{inpath},
                                                 "-crop",
                                                 $self->{cropstring},
                                                 $self->{inpath} . ".png" );
                          #print "\n\n@convertcommand\n\n";
                          system @convertcommand;       # Execute convert command
                          });

    Wx::Event::EVT_BUTTON($frame, $exitButton, sub {
                          my ($self, $event) = @_; 
                          #print "\nEXIT Button\n";
                          #exit (0);                    # Causing Sgementation Fault(core dumped)
                          $self->Close;                 # This seems to work ok
                          });

    Wx::Event::EVT_FILEPICKER_CHANGED($frame, $pdfFilePicker, sub {
                          my ($self, $event) = @_;
                          $self->{inpath} = $pdfFilePicker->GetPath;
                          });

    Wx::Event::EVT_TEXT($frame, $cropStringText, sub {
                          my ($self, $event) = @_;
                          $self->{cropstring} = $cropStringText->GetValue;
                          });

    $verticalSizerFrame->Layout();

    return $frame;

}
1;

