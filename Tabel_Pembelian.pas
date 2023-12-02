unit Tabel_Pembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls, frxClass,
  frxDBSet, ComCtrls;

type
  TForm5 = class(TForm)
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
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    b6: TButton;
    dtp1: TDateTimePicker;
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
  Form5: TForm5;
  id : string;

implementation

{$R *.dfm}

{ TForm5 }

procedure TForm5.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
Edit4.Clear;
c1.text:= '';
end;

procedure TForm5.editenable;
begin
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
c1.Enabled:= True;
dtp1.enabled:=true;
end;

procedure TForm5.posisiawal;
begin
editbersih;

edit1.Enabled:= false;
edit2.Enabled:= false;
edit3.Enabled:= false;
edit4.Enabled:= false;
c1.Enabled:= false;
dtp1.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm5.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm5.b2Click(Sender: TObject);
begin
if (Edit1.Text ='')or (Edit2.Text= '')or (Edit3.Text ='') or (c1.Text= '')or (Edit4.Text ='') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('no_transaksi',Edit1.Text,[])) then
begin
ShowMessage('DATA PEMBELIAN SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into pembelian values (null,"'+FormatDateTime('yyyy-mm-dd',dtp1.Date)+'","'+Edit1.Text+'","'+Edit2.Text+'","'+Edit3.Text+'","'+c1.Text+'","'+Edit4.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from pembelian');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm5.b3Click(Sender: TObject);
begin
if (Edit1.Text ='')or (Edit2.Text= '')or (Edit3.Text ='') or   (c1.Text ='') or (Edit4.Text= '') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (dtp1.date = zqry1.Fields[1].AsDateTime) and (Edit1.Text = zqry1.Fields[2].AsString) and (Edit2.Text = zqry1.Fields[3].AsString) and (Edit3.Text = zqry1.Fields[4].AsString) and (c1.Text = zqry1.Fields[5].AsString) and (Edit4.Text = zqry1.Fields[6].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('idpembelian').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update pembelian set tanggal= "'+FormatDateTime('yyyy-mm-dd',dtp1.Date)+'",no_transaksi="'+Edit1.Text+'",harga="'+Edit2.Text+'",jumlah_bayar="'+Edit3.Text+'",user_id="'+c1.Text+'",pembayaran="'+Edit4.Text+'" where idpembelian="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from pembelian');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm5.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('idpembelian').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from pembelian where idpembelian="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from pembelian');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm5.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
posisiawal;

end;

procedure TForm5.dg1CellClick(Column: TColumn);
begin
editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
dtp1.Date:= form5.zqry1.FieldList[1].AsDateTime;
Edit1.Text:= zqry1.FieldList[2].AsString;
Edit2.Text:= zqry1.FieldList[3].AsString;
Edit3.Text:= zqry1.FieldList[4].AsString;
c1.Text:= zqry1.FieldList[5].AsString;
Edit4.Text:= zqry1.FieldList[6].AsString;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
zqry2.First;
while not zqry2.Eof do
begin
  c1.items.add(zqry2.fieldbyname('iduser').asstring);
  zqry2.Next;
end;
end;

procedure TForm5.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
