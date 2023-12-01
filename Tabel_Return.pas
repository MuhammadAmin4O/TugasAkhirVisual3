unit Tabel_Return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm9 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l6: TLabel;
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
    c3: TComboBox;
    Edit4: TEdit;
    l5: TLabel;
    l7: TLabel;
    l8: TLabel;
    c4: TComboBox;
    zqry3: TZQuery;
    zqry4: TZQuery;
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
  Form9: TForm9;
  id : string;

implementation

{$R *.dfm}

{ TForm9 }

procedure TForm9.editbersih;
begin
Edit1.Clear;
c1.text:= '';
c2.text:= '';
c3.text:= '';
Edit2.Clear;
Edit3.Clear;
Edit4.Clear;
c4.text:= '';
end;

procedure TForm9.editenable;
begin
Edit1.Enabled:= True;
c1.Enabled:= True;
c2.Enabled:= True;
c3.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
c4.Enabled:= True;
end;

procedure TForm9.posisiawal;
begin
editbersih;

edit1.Enabled:= false;
c1.Enabled:= false;
c2.Enabled:= false;
c3.Enabled:= false;
edit2.Enabled:= false;
edit3.Enabled:= false;
edit4.Enabled:= false;
c4.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm9.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm9.b2Click(Sender: TObject);
begin
if (Edit1.Text= '')or (c1.Text ='')or(c2.Text= '')or (c3.Text= '')or (Edit2.Text ='') or (Edit3.Text= '')or (Edit4.Text ='') or (c4.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('penjualan_id',c1.Text,[])) then
begin
ShowMessage('DATA RETURN SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into t_return values (null,"'+Edit1.Text+'","'+c1.Text+'","'+c2.Text+'","'+c3.Text+'","'+Edit2.Text+'","'+Edit3.Text+'","'+Edit4.Text+'","'+c4.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from t_return');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm9.b3Click(Sender: TObject);
begin
if (Edit1.Text= '')or (c1.Text ='')or(c2.Text= '')or (c3.Text= '')or (Edit2.Text ='') or (Edit3.Text= '')or (Edit4.Text ='') or (c4.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edit1.Text = zqry1.Fields[1].AsString) and (c1.Text = zqry1.Fields[2].AsString) and (c2.Text = zqry1.Fields[3].AsString) and (c3.Text = zqry1.Fields[4].AsString) and (Edit2.Text = zqry1.Fields[5].AsString) and (Edit3.Text = zqry1.Fields[6].AsString) and (Edit4.Text = zqry1.Fields[7].AsString)and (c2.Text = zqry1.Fields[8].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('idreturn').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update t_return set tanggal_return= "'+Edit1.Text+'",penjualan_id="'+c1.Text+'",barang_id="'+c2.Text+'",user_id="'+c3.Text+'",qty="'+Edit2.Text+'",harga_jual="'+Edit3.Text+'",total_jual="'+Edit4.Text+'",status="'+c4.Text+'" where idreturn="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from t_return');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm9.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('idreturn').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from t_return where idreturn="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from t_return');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm9.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.dg1CellClick(Column: TColumn);
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
c3.Text:= zqry1.FieldList[4].AsString;
Edit2.Text:= zqry1.FieldList[5].AsString;
Edit3.Text:= zqry1.FieldList[6].AsString;
Edit4.Text:= zqry1.FieldList[7].AsString;
c4.Text:= zqry1.FieldList[8].AsString;
end;

procedure TForm9.FormCreate(Sender: TObject);
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
zqry4.First;
while not zqry4.Eof do
begin
  c3.items.add(zqry4.fieldbyname('iduser').asstring);
  zqry4.Next;
end;
end;

end.
