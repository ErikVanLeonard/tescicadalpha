object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TesciCad (R)'
  ClientHeight = 729
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1256
    Top = 24
    Width = 58
    Height = 13
    Caption = 'Cordenadas'
  end
  object Label2: TLabel
    Left = 1240
    Top = 43
    Width = 24
    Height = 13
    Caption = 'Eje x'
  end
  object Label3: TLabel
    Left = 1305
    Top = 43
    Width = 24
    Height = 13
    Caption = 'Eje Y'
  end
  object Image1: TImage
    Left = 8
    Top = 24
    Width = 1209
    Height = 657
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
  end
  object GroupBox1: TGroupBox
    Left = 1225
    Top = 367
    Width = 127
    Height = 90
    Caption = 'Rotar'
    TabOrder = 4
  end
  object Grid1: TStringGrid
    Left = 1223
    Top = 62
    Width = 129
    Height = 120
    ColCount = 2
    RowCount = 2
    TabOrder = 0
  end
  object Grid2: TStringGrid
    Left = 1223
    Top = 188
    Width = 130
    Height = 120
    ColCount = 2
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 1240
    Top = 336
    Width = 91
    Height = 25
    Caption = 'Mover Imagen'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1240
    Top = 392
    Width = 91
    Height = 25
    Caption = 'Aplicar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 1240
    Top = 423
    Width = 91
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 1240
    Top = 480
    Width = 91
    Height = 25
    Caption = 'Reflexi'#243'n'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 1240
    Top = 528
    Width = 89
    Height = 25
    Caption = '3D'
    TabOrder = 7
    OnClick = Button4Click
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 65528
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object GuardarImagen1: TMenuItem
        Caption = 'Guardar Imagen'
        OnClick = GuardarImagen1Click
      end
      object GuardarProyecto1: TMenuItem
        Caption = 'Guardar Proyecto'
        OnClick = GuardarProyecto1Click
      end
      object Abririmagen1: TMenuItem
        Caption = 'Abrir imagen'
        OnClick = Abririmagen1Click
      end
      object Salirdelprograma1: TMenuItem
        Caption = 'Salir del programa'
        OnClick = Salirdelprograma1Click
      end
    end
    object Manipulaci1: TMenuItem
      Caption = 'Imagen'
      object LimpiarEspaciodeTrabajo1: TMenuItem
        Caption = 'Limpiar Espacio de Trabajo'
        OnClick = LimpiarEspaciodeTrabajo1Click
      end
    end
    object Forma1: TMenuItem
      Caption = 'Forma'
      object Lineadedospuntos1: TMenuItem
        Caption = 'Linea de dos puntos'
        ShortCut = 16460
        OnClick = Lineadedospuntos1Click
      end
      object Polilinea1: TMenuItem
        Caption = 'Polilinea'
        ShortCut = 16464
        OnClick = Polilinea1Click
      end
      object Bezier1: TMenuItem
        Caption = 'Bezier'
        ShortCut = 16450
        OnClick = Bezier1Click
      end
      object Arco1: TMenuItem
        Caption = 'Arco'
        ShortCut = 16449
        OnClick = Arco1Click
      end
      object Circulo1: TMenuItem
        Caption = 'Circulo'
        ShortCut = 16451
        OnClick = Circulo1Click
      end
      object riangulo1: TMenuItem
        Caption = 'Triangulo'
        ShortCut = 16468
        OnClick = riangulo1Click
      end
      object Elipse1: TMenuItem
        Caption = 'Elipse'
        ShortCut = 16453
        OnClick = Elipse1Click
      end
    end
    object Color1: TMenuItem
      Caption = 'Color'
      object Colordecontorno1: TMenuItem
        Caption = 'Color de contorno'
        OnClick = Colordecontorno1Click
      end
      object Colorderelleno1: TMenuItem
        Caption = 'Color de relleno'
        OnClick = Colorderelleno1Click
      end
    end
    object Ver1: TMenuItem
      Caption = 'Ver'
      object Cuadricula1: TMenuItem
        Caption = 'Cuadricula'
        OnClick = Cuadricula1Click
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 608
    Top = 65528
  end
  object ColorDialog2: TColorDialog
    Left = 648
    Top = 65528
  end
end
