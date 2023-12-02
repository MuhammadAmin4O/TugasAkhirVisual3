unit Menu_Utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus;

type
  TForm7 = class(TForm)
    mm1: TMainMenu;
    Menu1: TMenuItem;
    User1: TMenuItem;
    Pembeli1: TMenuItem;
    Barang1: TMenuItem;
    Penjualan1: TMenuItem;
    Pembelian1: TMenuItem;
    Return1: TMenuItem;
    DetailPembelian1: TMenuItem;
    DetailPenjualan1: TMenuItem;
    DetaiReturn1: TMenuItem;
    Stok1: TMenuItem;
    Supplier1: TMenuItem;
    LOGOUT1: TMenuItem;
    EXIT1: TMenuItem;
    procedure User1Click(Sender: TObject);
    procedure Pembeli1Click(Sender: TObject);
    procedure Barang1Click(Sender: TObject);
    procedure Penjualan1Click(Sender: TObject);
    procedure Pembelian1Click(Sender: TObject);
    procedure Return1Click(Sender: TObject);
    procedure DetailPembelian1Click(Sender: TObject);
    procedure DetailPenjualan1Click(Sender: TObject);
    procedure DetaiReturn1Click(Sender: TObject);
    procedure Stok1Click(Sender: TObject);
    procedure Supplier1Click(Sender: TObject);
    procedure EXIT1Click(Sender: TObject);
    procedure LOGOUT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Tabel_Barang, Tabel_Pembelian, Tabel_User, Tabel_Pembeli,
  Tabel_Penjualan, Tabel_Return, Tabel_Detailpembelian,
  Tabel_Detailpenjualan, Tabel_Detailreturn, Tabel_Stok, Tabel_Supplier,
  Login;

{$R *.dfm}

procedure TForm7.User1Click(Sender: TObject);
begin
form1.ShowModal;
end;

procedure TForm7.Pembeli1Click(Sender: TObject);
begin
form4.ShowModal;
end;

procedure TForm7.Barang1Click(Sender: TObject);
begin
form2.ShowModal;
end;

procedure TForm7.Penjualan1Click(Sender: TObject);
begin
form6.ShowModal;
end;

procedure TForm7.Pembelian1Click(Sender: TObject);
begin
form5.ShowModal;
end;

procedure TForm7.Return1Click(Sender: TObject);
begin
form9.ShowModal;
end;

procedure TForm7.DetailPembelian1Click(Sender: TObject);
begin
form10.ShowModal;
end;

procedure TForm7.DetailPenjualan1Click(Sender: TObject);
begin
form11.ShowModal;
end;

procedure TForm7.DetaiReturn1Click(Sender: TObject);
begin
form12.ShowModal;
end;

procedure TForm7.Stok1Click(Sender: TObject);
begin
form8.ShowModal;
end;

procedure TForm7.Supplier1Click(Sender: TObject);
begin
form3.ShowModal;
end;

procedure TForm7.EXIT1Click(Sender: TObject);
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


procedure TForm7.LOGOUT1Click(Sender: TObject);
begin
close;
form13.show;
end;

end.
