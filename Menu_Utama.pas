unit Menu_Utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm7 = class(TForm)
    b1: TBitBtn;
    b2: TBitBtn;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Tabel_Barang, Tabel_Pembelian, Tabel_User;

{$R *.dfm}

procedure TForm7.b1Click(Sender: TObject);
begin
form1.show;
end;

procedure TForm7.b2Click(Sender: TObject);
begin
Form5.show;
end;

end.
