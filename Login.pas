unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls, frxpngimage, ExtCtrls;

type
  TForm13 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    procedure b1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Menu_Utama, Daftar;

{$R *.dfm}

procedure TForm13.b1Click(Sender: TObject);
begin
with zqry1 do begin
SQL.Clear;
SQL.Add('select * from user where username='+QuotedStr(edit1.Text));
open;
end;

if zqry1.RecordCount=0
then
Application.MessageBox('Maaf user name tidak ditemukan','INFORMASI',MB_OK or MB_ICONINFORMATION)
else
begin
if zqry1.FieldByName('password').AsString<>Edit2.Text
then
Application.MessageBox('Pastikan password yang anda masukkan benar','ERROR',MB_OK or MB_ICONERROR)
else
begin
Application.MessageBox('LOGIN BERHASIL','INFORMASI',MB_OK or MB_ICONINFORMATION);
Form7.Showmodal;
end;
end;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
edit1.Text:= '';
edit2.Text:= '';
end;

procedure TForm13.b2Click(Sender: TObject);
begin
close;
end;

procedure TForm13.b3Click(Sender: TObject);
begin
  hide;
form14.showmodal;
end;

end.
