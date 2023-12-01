unit Tabel_Detailpenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm11 = class(TForm)
    l1: TLabel;
    l3: TLabel;
    l6: TLabel;
    l5: TLabel;
    l7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    c1: TComboBox;
    c2: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    zqry2: TZQuery;
    zqry3: TZQuery;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  id : string;

implementation

{$R *.dfm}

{ TForm11 }

procedure TForm11.editbersih;
begin
c1.text:= '';
c2.text:= '';
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
end;

procedure TForm11.editenable;
begin
c1.Enabled:= True;
c2.Enabled:= True;
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
end;

procedure TForm11.posisiawal;
begin
editbersih;

c1.Enabled:= false;
c2.Enabled:= false;
edit1.Enabled:= false;
edit2.Enabled:= false;
edit3.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm11.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm11.b2Click(Sender: TObject);
begin
if (c1.Text ='')or(c2.Text= '')or (Edit1.Text ='') or (Edit2.Text= '')or (Edit3.Text ='') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('penjualan_id',c1.Text,[])) then
begin
ShowMessage('DATA DETAIL PENJUALANSUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into detail_penjualan values (null,"'+c1.Text+'","'+c2.Text+'","'+Edit1.Text+'","'+Edit2.Text+'","'+Edit3.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from detail_penjualan');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm11.b3Click(Sender: TObject);
begin
if (c1.Text ='')or(c2.Text= '')or (Edit1.Text ='') or (Edit2.Text= '')or (Edit3.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (c1.Text = zqry1.Fields[1].AsString) and (c2.Text = zqry1.Fields[2].AsString) and (Edit1.Text = zqry1.Fields[3].AsString) and (Edit2.Text = zqry1.Fields[4].AsString) and (Edit3.Text = zqry1.Fields[5].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('iddetail').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update detail_penjualan set penjualan_id="'+c1.Text+'",barang_id="'+c2.Text+'",qty="'+Edit1.Text+'",harga_jual="'+Edit2.Text+'",total_jual="'+Edit3.Text+'" where iddetail="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from detail_penjualan');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm11.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('iddetail').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from detailpenjualan where iddetail="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from detailpenjualan');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm11.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm11.dg1CellClick(Column: TColumn);
begin
editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
c1.Text:= zqry1.FieldList[1].AsString;
c2.Text:= zqry1.FieldList[2].AsString;
Edit1.Text:= zqry1.FieldList[3].AsString;
Edit2.Text:= zqry1.FieldList[4].AsString;
Edit3.Text:= zqry1.FieldList[5].AsString;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
zqry2.First;
while not zqry2.Eof do
begin
  c1.items.add(zqry2.fieldbyname('idpenjualan').asstring);
  zqry2.Next;
end;
zqry3.First;
while not zqry3.Eof do
begin
  c2.items.add(zqry3.fieldbyname('idbarang').asstring);
  zqry3.Next;
end;
end;

end.
