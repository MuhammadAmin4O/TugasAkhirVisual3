unit Menu_Pembeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, frxpngimage, ExtCtrls;

type
  TForm15 = class(TForm)
    mm1: TMainMenu;
    Menu1: TMenuItem;
    Penjualan1: TMenuItem;
    DetailPenjualan1: TMenuItem;
    LOGOUT1: TMenuItem;
    Exit1: TMenuItem;
    img1: TImage;
    procedure LOGOUT1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Penjualan1Click(Sender: TObject);
    procedure DetailPenjualan1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses Login, Menu_Utama, Tabel_Penjualan, Tabel_Detailpenjualan;

{$R *.dfm}

procedure TForm15.LOGOUT1Click(Sender: TObject);
begin
close;
form13.show;
end;

procedure TForm15.Exit1Click(Sender: TObject);
begin
if MessageDlg('APAKAH INGIN MENUTUP APLIKASI INI ?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
Application.Terminate;
end else
begin
hide;
form7.Show;
end;
end;

procedure TForm15.Penjualan1Click(Sender: TObject);
begin
form6.ShowModal;
end;

procedure TForm15.DetailPenjualan1Click(Sender: TObject);
begin
form11.ShowModal;
end;

end.
