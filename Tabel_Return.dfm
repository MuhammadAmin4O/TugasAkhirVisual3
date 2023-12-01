object Form9: TForm9
  Left = 244
  Top = 164
  Width = 1044
  Height = 541
  Caption = 'Form Return'
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
    Top = 136
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
  object l2: TLabel
    Left = 80
    Top = 96
    Width = 100
    Height = 18
    Caption = 'Tanggal Return'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l3: TLabel
    Left = 80
    Top = 176
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
  object l4: TLabel
    Left = 80
    Top = 216
    Width = 51
    Height = 18
    Caption = 'User ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l6: TLabel
    Left = 80
    Top = 256
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
    Top = 296
    Width = 68
    Height = 18
    Caption = 'Harga Jual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l7: TLabel
    Left = 80
    Top = 336
    Width = 62
    Height = 18
    Caption = 'Total Jual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l8: TLabel
    Left = 80
    Top = 376
    Width = 41
    Height = 18
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 248
    Top = 96
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 248
    Top = 256
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 248
    Top = 296
    Width = 177
    Height = 21
    TabOrder = 2
  end
  object b1: TButton
    Left = 512
    Top = 352
    Width = 89
    Height = 49
    Caption = 'Baru'
    TabOrder = 3
    OnClick = b1Click
  end
  object b2: TButton
    Left = 616
    Top = 352
    Width = 89
    Height = 49
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = b2Click
  end
  object b3: TButton
    Left = 720
    Top = 352
    Width = 89
    Height = 49
    Caption = 'Edit'
    TabOrder = 5
    OnClick = b3Click
  end
  object b4: TButton
    Left = 824
    Top = 352
    Width = 89
    Height = 49
    Caption = 'Hapus'
    TabOrder = 6
    OnClick = b4Click
  end
  object b5: TButton
    Left = 928
    Top = 352
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
    Top = 136
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 9
  end
  object c2: TComboBox
    Left = 248
    Top = 176
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'c2'
  end
  object c3: TComboBox
    Left = 248
    Top = 216
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = 'c3'
  end
  object Edit4: TEdit
    Left = 248
    Top = 336
    Width = 177
    Height = 21
    TabOrder = 12
  end
  object c4: TComboBox
    Left = 248
    Top = 376
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 13
    Items.Strings = (
      'berhasil'
      'tidak')
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
      'select * from t_return')
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
      'select * from penjualan')
    Params = <>
    Left = 600
    Top = 264
  end
  object zqry3: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from barang')
    Params = <>
    Left = 640
    Top = 264
  end
  object zqry4: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from user')
    Params = <>
    Left = 680
    Top = 264
  end
end
