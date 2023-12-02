object Form7: TForm7
  Left = 302
  Top = 192
  Width = 1044
  Height = 540
  Caption = 'Menu Utama'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 64
    Top = 96
    object Menu1: TMenuItem
      Caption = 'Menu'
      object User1: TMenuItem
        Caption = 'User'
        OnClick = User1Click
      end
      object Pembeli1: TMenuItem
        Caption = 'Pembeli'
        OnClick = Pembeli1Click
      end
      object Barang1: TMenuItem
        Caption = 'Barang'
        OnClick = Barang1Click
      end
      object Penjualan1: TMenuItem
        Caption = 'Penjualan'
        OnClick = Penjualan1Click
      end
      object Pembelian1: TMenuItem
        Caption = 'Pembelian'
        OnClick = Pembelian1Click
      end
      object Return1: TMenuItem
        Caption = 'Return'
        OnClick = Return1Click
      end
      object DetailPembelian1: TMenuItem
        Caption = 'Detail Pembelian'
        OnClick = DetailPembelian1Click
      end
      object DetailPenjualan1: TMenuItem
        Caption = 'Detai Penjualan'
        OnClick = DetailPenjualan1Click
      end
      object DetaiReturn1: TMenuItem
        Caption = 'Detai Return'
        OnClick = DetaiReturn1Click
      end
      object Stok1: TMenuItem
        Caption = 'Stok'
        OnClick = Stok1Click
      end
      object Supplier1: TMenuItem
        Caption = 'Supplier'
        OnClick = Supplier1Click
      end
    end
    object LOGOUT1: TMenuItem
      Caption = 'LOG OUT'
      OnClick = LOGOUT1Click
    end
    object EXIT1: TMenuItem
      Caption = 'EXIT'
      OnClick = EXIT1Click
    end
  end
end
