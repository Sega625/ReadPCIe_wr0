object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Memory'
  ClientHeight = 681
  ClientWidth = 1664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label20: TLabel
    Left = 142
    Top = 11
    Width = 7
    Height = 17
    Caption = '$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 12
    Top = 117
    Width = 7
    Height = 17
    Caption = '$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PortLab: TLabel
    Left = 1340
    Top = 8
    Width = 32
    Height = 17
    Caption = #1055#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ReadBtn: TButton
    Left = 142
    Top = 37
    Width = 106
    Height = 25
    Caption = 'Read'
    TabOrder = 0
    OnClick = ReadBtnClick
  end
  object RAddrEdit: TEdit
    Left = 155
    Top = 8
    Width = 95
    Height = 23
    TabOrder = 1
    Text = '00000CFC'
    OnKeyPress = EditKeyPress
  end
  object MemLV: TListView
    Left = 366
    Top = 8
    Width = 527
    Height = 665
    BevelInner = bvNone
    BevelKind = bkTile
    BorderStyle = bsNone
    Columns = <
      item
        Caption = #8470
        Width = 30
      end
      item
        Alignment = taCenter
        Caption = #1040#1076#1088#1077#1089
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = '1-'#1081' '#1073#1072#1081#1090
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = '2-'#1081' '#1073#1072#1081#1090
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = '3-'#1081' '#1073#1072#1081#1090
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = '4-'#1081' '#1073#1072#1081#1090
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = #1057#1090#1088#1086#1082#1072
      end>
    ColumnClick = False
    Ctl3D = False
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 2
    ViewStyle = vsReport
  end
  object WriteBtn: TButton
    Left = 13
    Top = 143
    Width = 106
    Height = 25
    Caption = 'Write'
    TabOrder = 3
    OnClick = WriteBtnClick
  end
  object WAddrEdit: TEdit
    Left = 23
    Top = 114
    Width = 95
    Height = 23
    TabOrder = 4
    Text = '00000CF8'
    OnKeyPress = EditKeyPress
  end
  object All0Btn: TButton
    Left = 213
    Top = 114
    Width = 38
    Height = 25
    Caption = 'All 0'
    TabOrder = 5
    OnClick = All0BtnClick
  end
  object All1Btn: TButton
    Left = 257
    Top = 114
    Width = 38
    Height = 25
    Caption = 'All 1'
    TabOrder = 6
    OnClick = All1BtnClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 219
    Width = 345
    Height = 454
    Caption = ' '#1057#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1088#1077#1075#1080#1089#1090#1088#1086#1074' '
    TabOrder = 7
    object RegReadBtn: TButton
      Left = 15
      Top = 420
      Width = 106
      Height = 25
      Caption = 'Read'
      TabOrder = 0
      OnClick = RegReadBtnClick
    end
    object RegLV: TListView
      Left = 15
      Top = 30
      Width = 311
      Height = 384
      BevelInner = bvNone
      BevelKind = bkTile
      BorderStyle = bsNone
      Columns = <
        item
          Caption = #8470
        end
        item
          Alignment = taCenter
          Caption = '1-'#1081' '#1073#1072#1081#1090
        end
        item
          Alignment = taCenter
          Caption = '2-'#1081' '#1073#1072#1081#1090
        end
        item
          Alignment = taCenter
          Caption = '3-'#1081' '#1073#1072#1081#1090
        end
        item
          Alignment = taCenter
          Caption = '4-'#1081' '#1073#1072#1081#1090
        end>
      ColumnClick = False
      Ctl3D = False
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 1
      ViewStyle = vsReport
    end
  end
  object sRegLV: TListView
    Left = 909
    Top = 8
    Width = 388
    Height = 662
    BevelInner = bvNone
    BevelKind = bkTile
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Offset'
      end
      item
        Alignment = taCenter
        Caption = 'Name'
      end
      item
        Alignment = taCenter
        Caption = 'Value'
      end>
    ColumnClick = False
    Ctl3D = False
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 8
    ViewStyle = vsReport
  end
  object Button1: TButton
    Left = 1315
    Top = 637
    Width = 75
    Height = 24
    Caption = 'Button1'
    TabOrder = 9
    OnClick = Button1Click
  end
  object LPTPortsCB: TComboBox
    Left = 1312
    Top = 28
    Width = 94
    Height = 24
    BevelInner = bvLowered
    BevelKind = bkFlat
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 10
    OnChange = LPTPortsCBChange
  end
  object Memo1: TMemo
    Left = 1312
    Top = 58
    Width = 344
    Height = 573
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object Button2: TButton
    Left = 1563
    Top = 637
    Width = 75
    Height = 24
    Caption = 'Button1'
    TabOrder = 12
    OnClick = Button2Click
  end
end
