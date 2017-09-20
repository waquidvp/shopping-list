object ShoppingListForm: TShoppingListForm
  Left = 543
  Top = 223
  Caption = 'My Shopping List'
  ClientHeight = 604
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 577
    Top = 80
    Width = 42
    Height = 13
    Caption = 'Quantity'
    Color = clBtnFace
    ParentColor = False
  end
  object Label2: TLabel
    Left = 440
    Top = 80
    Width = 37
    Height = 13
    Caption = 'Product'
    Color = clBtnFace
    ParentColor = False
  end
  object ShoppingListBox: TListBox
    Left = 48
    Top = 104
    Width = 285
    Height = 370
    ItemHeight = 13
    TabOrder = 0
  end
  object ItemProductEdit: TEdit
    Left = 392
    Top = 104
    Width = 144
    Height = 21
    TabOrder = 1
  end
  object AddBtn: TButton
    Left = 392
    Top = 152
    Width = 96
    Height = 25
    Caption = 'Add to List'
    TabOrder = 2
    OnClick = AddBtnClick
  end
  object RemoveBtn: TButton
    Left = 520
    Top = 152
    Width = 104
    Height = 25
    Caption = 'Remove from List'
    TabOrder = 3
    OnClick = RemoveBtnClick
  end
  object ItemQuantityEdit: TEdit
    Left = 576
    Top = 104
    Width = 48
    Height = 21
    TabOrder = 4
  end
  object DeleteBtn: TButton
    Left = 480
    Top = 296
    Width = 112
    Height = 25
    Caption = 'Delete by index'
    TabOrder = 5
    OnClick = DeleteBtnClick
  end
  object IndexEdit: TEdit
    Left = 416
    Top = 298
    Width = 45
    Height = 21
    TabOrder = 6
    Text = '1'
  end
  object FindBtn: TButton
    Left = 472
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 7
    OnClick = FindBtnClick
  end
end
