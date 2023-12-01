unit Tabel_Penjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, frxClass, frxDBSet;

type
  TForm6 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    zqry2: TZQuery;
    c1: TComboBox;
    c2: TComboBox;
    zqry3: TZQuery;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    b6: TButton;
     procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure b6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  id : string;

implementation

{$R *.dfm}

{ TForm6 }

procedure TForm6.editbersih;
begin
Edit1.Clear;
c1.text:= '';
c2.text:= '';
Edit2.Clear;
Edit3.Clear;
Edit4.Clear;
end;

procedure TForm6.editenable;
begin
edit1.Enabled:= True;
c1.Enabled:= True;
c2.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
end;

procedure TForm6.posisiawal;
begin
editbersih;

edit1.Enabled:= false;
c1.Enabled:= false;
c2.Enabled:= false;
edit2.Enabled:= false;
edit3.Enabled:= false;
edit4.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm6.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm6.b2Click(Sender: TObject);
begin
if (Edit1.Text= '')or (c1.Text ='')or(c2.Text= '')or (Edit2.Text= '')or (Edit3.Text ='') or (Edit4.Text= '') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('no_transaksi',Edit2.Text,[])) then
begin
ShowMessage('DATA PENJUALAN SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into penjualan values (null,"'+Edit1.Text+'","'+c1.Text+'","'+c2.Text+'","'+Edit2.Text+'","'+Edit3.Text+'","'+Edit4.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from penjualan');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm6.b3Click(Sender: TObject);
begin
if (Edit1.Text= '')or (c1.Text ='')or(c2.Text= '')or (Edit2.Text= '')or (Edit3.Text ='') or (Edit4.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edit1.Text = zqry1.Fields[1].AsString) and (c1.Text = zqry1.Fields[2].AsString) and (c2.Text = zqry1.Fields[3].AsString) and (Edit2.Text = zqry1.Fields[4].AsString) and (Edit3.Text = zqry1.Fields[5].AsString) and (Edit4.Text = zqry1.Fields[6].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('idpenjualan').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update penjualan set tanggal= "'+Edit1.Text+'",pembeli_id="'+c1.Text+'",user_id="'+c2.Text+'",no_transaksi="'+Edit2.Text+'",total_harga="'+Edit3.Text+'",pembayaran="'+Edit4.Text+'" where idpenjualan="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from penjualan');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm6.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('idpenjualan').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from penjualan where idpenjualan="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from penjualan');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm6.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.dg1CellClick(Column: TColumn);
begin
editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
Edit1.Text:= zqry1.FieldList[1].AsString;
c1.Text:= zqry1.FieldList[2].AsString;
c2.Text:= zqry1.FieldList[3].AsString;
Edit2.Text:= zqry1.FieldList[4].AsString;
Edit3.Text:= zqry1.FieldList[5].AsString;
Edit4.Text:= zqry1.FieldList[6].AsString;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
zqry2.First;
while not zqry2.Eof do
begin
  c1.items.add(zqry2.fieldbyname('idpembeli').asstring);
  zqry2.Next;
end;
zqry3.First;
while not zqry3.Eof do
begin
  c2.items.add(zqry3.fieldbyname('iduser').asstring);
  zqry3.Next;
end;
end;

procedure TForm6.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
