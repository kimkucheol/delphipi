{**
 DelphiPI (Delphi Package Installer)
 Author  : ibrahim dursun (t-hex) thex [at] thexpot ((dot)) net
 License : GNU General Public License 2.0
**}
unit FormAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAbout = class(TForm)
    Bevel1: TBevel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Image2: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblAuthorsWebsite: TLabel;
    lblProjectWebsite: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnDonate: TButton;
    procedure Button1Click(Sender: TObject);
    procedure lblAuthorsWebsiteClick(Sender: TObject);
    procedure lblProjectWebsiteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDonateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation
uses ShellApi, gnugettext;
const
  donationAddress =
    'https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=ibrahim'+
    '%2edursun%40gmail%2ecom&item_name=delphipi&no_shipping=0&no_note=1'+
    '&tax=0&currency_code=USD&lc=TR&bn=PP%2dDonationsBF&charset=UTF%2d8';
{$R *.dfm}

procedure TfrmAbout.btnDonateClick(Sender: TObject);
begin
 ShellExecute(0,'open',PAnsiChar(donationAddress), NIL, NIL, SW_SHOWNORMAL);
end;

procedure TfrmAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);
end;

procedure TfrmAbout.lblAuthorsWebsiteClick(Sender: TObject);
begin
  ShellExecute(0,'open',PAnsiChar(lblAuthorsWebsite.Caption), NIL, NIL, SW_SHOWNORMAL);
end;

procedure TfrmAbout.lblProjectWebsiteClick(Sender: TObject);
begin
  ShellExecute(0,'open',PAnsiChar(lblProjectWebsite.Caption), NIL, NIL, SW_SHOWNORMAL);
end;

end.
