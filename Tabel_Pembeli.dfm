object Form4: TForm4
  Left = 446
  Top = 179
  Width = 1044
  Height = 540
  Caption = 'Form Pembeli'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object l1: TLabel
    Left = 80
    Top = 56
    Width = 93
    Height = 18
    Caption = 'Nama Pembeli'
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
    Width = 45
    Height = 18
    Caption = 'Alamat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l3: TLabel
    Left = 80
    Top = 136
    Width = 75
    Height = 18
    Caption = 'No Telepon'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l4: TLabel
    Left = 80
    Top = 176
    Width = 30
    Height = 18
    Caption = 'Kota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l5: TLabel
    Left = 80
    Top = 216
    Width = 56
    Height = 18
    Caption = 'KodePos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 248
    Top = 56
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 248
    Top = 96
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 248
    Top = 136
    Width = 177
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 248
    Top = 176
    Width = 177
    Height = 21
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 248
    Top = 216
    Width = 177
    Height = 21
    TabOrder = 4
  end
  object b1: TButton
    Left = 88
    Top = 328
    Width = 89
    Height = 49
    Caption = 'Baru'
    TabOrder = 5
    OnClick = b1Click
  end
  object b2: TButton
    Left = 192
    Top = 328
    Width = 89
    Height = 49
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = b2Click
  end
  object b3: TButton
    Left = 296
    Top = 328
    Width = 89
    Height = 49
    Caption = 'Edit'
    TabOrder = 7
    OnClick = b3Click
  end
  object b4: TButton
    Left = 400
    Top = 328
    Width = 89
    Height = 49
    Caption = 'Hapus'
    TabOrder = 8
    OnClick = b4Click
  end
  object b5: TButton
    Left = 504
    Top = 328
    Width = 89
    Height = 49
    Caption = 'Batal'
    TabOrder = 9
    OnClick = b5Click
  end
  object dg1: TDBGrid
    Left = 480
    Top = 56
    Width = 449
    Height = 185
    DataSource = ds1
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dg1CellClick
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
      'select * from pembeli')
    Params = <>
    Left = 520
    Top = 264
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 560
    Top = 264
  end
end
