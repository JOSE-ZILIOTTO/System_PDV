object frmabrircaixa: Tfrmabrircaixa
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmabrircaixa'
  ClientHeight = 713
  ClientWidth = 1240
  Color = clGoldenrod
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    1240
    713)
  TextHeight = 15
  object pnlprincipal: TPanel
    Left = 312
    Top = 152
    Width = 609
    Height = 409
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object pnltop: TPanel
      Left = 0
      Top = 0
      Width = 609
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Abertura de Caixa'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGoldenrod
      Font.Height = -53
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlsubtitulo: TPanel
      Left = 0
      Top = 73
      Width = 609
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Informe os valores dipon'#237'veis para iniciar a Abertura'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5589317
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnlclient: TPanel
      Left = 0
      Top = 121
      Width = 609
      Height = 288
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      Padding.Left = 170
      Padding.Top = 78
      Padding.Right = 170
      Padding.Bottom = 78
      ParentBackground = False
      TabOrder = 2
      object pnlmeio: TPanel
        Left = 170
        Top = 78
        Width = 269
        Height = 132
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 269
          Height = 73
          Align = alTop
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 269
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Dispon'#237'vel no Caixa'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5589317
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel4: TPanel
            Left = 0
            Top = 33
            Width = 269
            Height = 40
            Align = alClient
            BevelOuter = bvNone
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object Shape1: TShape
              Left = 0
              Top = 0
              Width = 269
              Height = 40
              Align = alClient
              Pen.Style = psClear
              Shape = stRoundRect
              ExplicitLeft = 120
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object edtvalorsuprimento: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 263
              Height = 34
              Align = alClient
              Alignment = taCenter
              BevelOuter = bvNone
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5589317
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TextHint = '0,00'
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 73
          Width = 269
          Height = 59
          Align = alClient
          BevelOuter = bvNone
          Color = clSilver
          Padding.Left = 3
          Padding.Top = 3
          Padding.Right = 3
          Padding.Bottom = 3
          ParentBackground = False
          TabOrder = 1
          object Shape2: TShape
            Left = 3
            Top = 3
            Width = 263
            Height = 53
            Align = alClient
            Brush.Color = clGoldenrod
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 112
            ExplicitTop = 24
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object SpeedButton1: TSpeedButton
            Left = 3
            Top = 3
            Width = 263
            Height = 53
            Align = alClient
            Caption = 'Abrir Caixa'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -33
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton1Click
            ExplicitLeft = 136
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
    end
  end
end
