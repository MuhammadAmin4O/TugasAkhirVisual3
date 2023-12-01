object Form12: TForm12
  Left = 359
  Top = 198
  Width = 1044
  Height = 540
  Caption = 'Form Detail Return'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object l1: TLabel
    Left = 80
    Top = 80
    Width = 64
    Height = 18
    Caption = 'Return ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l3: TLabel
    Left = 80
    Top = 120
    Width = 83
    Height = 18
    Caption = 'Penjualan ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l4: TLabel
    Left = 80
    Top = 160
    Width = 67
    Height = 18
    Caption = 'Barang ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l6: TLabel
    Left = 80
    Top = 200
    Width = 55
    Height = 18
    Caption = 'Quantity'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l5: TLabel
    Left = 80
    Top = 240
    Width = 65
    Height = 18
    Caption = 'Harga Beli'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l7: TLabel
    Left = 80
    Top = 280
    Width = 33
    Height = 18
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l2: TLabel
    Left = 80
    Top = 320
    Width = 56
    Height = 18
    Caption = 'Deskripsi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 248
    Top = 200
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 248
    Top = 240
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 248
    Top = 280
    Width = 177
    Height = 21
    TabOrder = 2
  end
  object b1: TButton
    Left = 80
    Top = 400
    Width = 89
    Height = 49
    Caption = 'Baru'
    TabOrder = 3
    OnClick = b1Click
  end
  object b2: TButton
    Left = 184
    Top = 400
    Width = 89
    Height = 49
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = b2Click
  end
  object b3: TButton
    Left = 288
    Top = 400
    Width = 89
    Height = 49
    Caption = 'Edit'
    TabOrder = 5
    OnClick = b3Click
  end
  object b4: TButton
    Left = 392
    Top = 400
    Width = 89
    Height = 49
    Caption = 'Hapus'
    TabOrder = 6
    OnClick = b4Click
  end
  object b5: TButton
    Left = 496
    Top = 400
    Width = 89
    Height = 49
    Caption = 'Batal'
    TabOrder = 7
    OnClick = b5Click
  end
  object dg1: TDBGrid
    Left = 480
    Top = 56
    Width = 449
    Height = 185
    DataSource = ds1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dg1CellClick
  end
  object c1: TComboBox
    Left = 248
    Top = 80
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 9
  end
  object c2: TComboBox
    Left = 248
    Top = 120
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 10
  end
  object c3: TComboBox
    Left = 248
    Top = 160
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 11
  end
  object Edit4: TEdit
    Left = 248
    Top = 320
    Width = 177
    Height = 21
    TabOrder = 12
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penj_hp'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Tugas Akhir Visual 3\libmysql.dll'
    Left = 480
    Top = 264
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from detail_return')
    Params = <>
    Left = 520
    Top = 264
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 560
    Top = 264
  end
  object zqry2: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from t_return'
      '')
    Params = <>
    Left = 600
    Top = 264
  end
  object zqry3: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from penjualan')
    Params = <>
    Left = 640
    Top = 264
  end
  object zqry4: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from barang')
    Params = <>
    Left = 680
    Top = 264
  end
end
