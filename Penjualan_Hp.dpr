program Penjualan_Hp;

uses
  Forms,
  Tabel_User in 'Tabel_User.pas' {Form1},
  Tabel_Barang in 'Tabel_Barang.pas' {Form2},
  Tabel_Supplier in 'Tabel_Supplier.pas' {Form3},
  Tabel_Pembeli in 'Tabel_Pembeli.pas' {Form4},
  Tabel_Pembelian in 'Tabel_Pembelian.pas' {Form5},
  Tabel_Penjualan in 'Tabel_Penjualan.pas' {Form6},
  Menu_Utama in 'Menu_Utama.pas' {Form7},
  Tabel_Stok in 'Tabel_Stok.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
