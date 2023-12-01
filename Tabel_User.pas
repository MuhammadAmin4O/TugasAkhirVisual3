unit Tabel_User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    c1: TComboBox;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure b1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id : string;

implementation

{$R *.dfm}

procedure TForm1.editbersih;
begin
Edit1.Text:='';
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.Text:='';
c1.Text:='';
end;

procedure TForm1.editenable;
begin
Edit1.Enabled:=True;
Edit2.Enabled:=True;
Edit3.Enabled:=True;
Edit4.Enabled:=True;
Edit5.Enabled:=True;
Edit6.Enabled:=True;
c1.Enabled:=True;
end;

procedure TForm1.posisiawal;
begin
editbersih;

Edit1.Enabled:=False;
Edit2.Enabled:=False;
Edit3.Enabled:=False;
Edit4.Enabled:=False;
Edit5.Enabled:=False;
Edit6.Enabled:=False;
c1.Enabled:=False;

b1.Enabled:=True;
b2.Enabled:=False;
b3.Enabled:=False;
b4.Enabled:=False;
b5.Enabled:=False;
end;

procedure TForm1.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.b2Click(Sender: TObject);
begin
if (Edit1.Text= '')or (Edit2.Text ='')or(c1.Text= '')or (Edit3.Text= '')or (Edit4.Text ='') or (Edit5.Text= '')or (Edit6.Text ='') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('username',Edit1.Text,[])) and (zqry1.Locate('password',Edit2.Text,[])) then
begin
ShowMessage('DATA USER SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into user values (null,"'+Edit1.Text+'","'+Edit2.Text+'","'+c1.Text+'","'+Edit3.Text+'","'+Edit4.Text+'","'+Edit5.Text+'","'+Edit6.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from user');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm1.b3Click(Sender: TObject);
begin
if (Edit1.Text= '')or (Edit2.Text ='')or(c1.Text= '')or (Edit3.Text= '')or (Edit4.Text ='') or (Edit5.Text= '')or (Edit6.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edit1.Text = zqry1.Fields[1].AsString) and (Edit2.Text = zqry1.Fields[2].AsString) and (c1.Text = zqry1.Fields[3].AsString) and (Edit3.Text = zqry1.Fields[4].AsString) and (Edit4.Text = zqry1.Fields[5].AsString) and (Edit5.Text = zqry1.Fields[6].AsString) and (Edit6.Text = zqry1.Fields[7].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('iduser').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update user set username= "'+Edit1.Text+'",password="'+Edit2.Text+'",status="'+c1.Text+'",nama="'+Edit3.Text+'",alamat="'+Edit4.Text+'",tgl_bergabung="'+Edit5.Text+'",no_hp="'+Edit6.Text+'" where iduser="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from user');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm1.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('iduser').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from user where iduser="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from user');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm1.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.dg1CellClick(Column: TColumn);
begin
editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
Edit1.Text:= zqry1.FieldList[1].AsString;
Edit2.Text:= zqry1.FieldList[2].AsString;
c1.Text:= zqry1.FieldList[3].AsString;
Edit3.Text:= zqry1.FieldList[4].AsString;
Edit4.Text:= zqry1.FieldList[5].AsString;
Edit5.Text:= zqry1.FieldList[6].AsString;
Edit6.Text:= zqry1.FieldList[7].AsString;
end;

end.
