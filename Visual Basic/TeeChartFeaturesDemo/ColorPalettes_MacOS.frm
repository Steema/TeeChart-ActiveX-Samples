VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorPalettes_MacOS 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   1350
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1170
      Width           =   1605
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11460
      Base64          =   $"ColorPalettes_MacOS.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ColorPalettes_MacOS.frx":123E
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Custom Palettes:"
      Height          =   195
      Left            =   90
      TabIndex        =   3
      Top             =   1230
      Width           =   1185
   End
End
Attribute VB_Name = "ColorPalettes_MacOS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim RedPalette() As OLE_COLOR
Dim BluePalette() As OLE_COLOR
Dim GreenPalette() As OLE_COLOR

Private Sub Combo1_Change()
  With TChart1.Series(0).asSurface
    Select Case Combo1.ListIndex
      Case 0: .AddCustomPalette RedPalette
      Case 1: .AddCustomPalette BluePalette
      Case 2: .AddCustomPalette GreenPalette
      Case 3: .AddCustomPalette cpTeeChart
      Case 4: .AddCustomPalette cpExcel
      Case 5: .AddCustomPalette cpVictorian
      Case 6: .AddCustomPalette cpPastel
      Case 7: .AddCustomPalette cpSolid
      Case 8: .AddCustomPalette cpClassic
      Case 9: .AddCustomPalette cpWeb
      Case 10: .AddCustomPalette cpModern
      Case 11: .AddCustomPalette cpRainbow
      Case 12: .AddCustomPalette cpWindowsXP
      Case 13: .AddCustomPalette cpMacOS
      Case 14: .AddCustomPalette cpWinVista
      Case 15: .AddCustomPalette cpGrayScale
      Case 16: .AddCustomPalette cpOpera
      Case 17: .AddCustomPalette cpWarm
      Case 18: .AddCustomPalette cpCool
     End Select
  End With
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  With Combo1
    .AddItem "RedPalette"
    .AddItem "BluePalette"
    .AddItem "GreenPalette"
    .AddItem "TeeChart"
    .AddItem "Excel"
    .AddItem "Victorian"
    .AddItem "Pastel"
    .AddItem "Solid"
    .AddItem "Classic"
    .AddItem "Web"
    .AddItem "Modern"
    .AddItem "Rainbow"
    .AddItem "WindowsXP"
    .AddItem "MacOS"
    .AddItem "WinVista"
    .AddItem "GrayScale"
    .AddItem "Opera"
    .AddItem "Warm"
    .AddItem "Cool"
  End With
  
  ' Create three custom color palettes (arrays of TColor)
  ReDim RedPalette(15)
  ReDim BluePalette(15)
  ReDim GreenPalette(15)
  
  For t = 0 To 14
    RedPalette(t) = RGB(128 + Round(t * (128# / 15#)), 0, 0)
    BluePalette(t) = RGB(0, 0, 128 + Round(t * (128# / 15#)))
    GreenPalette(t) = RGB(0, 128 + Round(t * (128# / 15#)), 0)
  Next t

  With TChart1.Series(0).asSurface
    .UseColorRange = False
    .UsePalette = True
    .PaletteStyle = psCustom
  End With
  
  Combo1.ListIndex = 13
    
  TChart1.ApplyCustomPalette cpMacOS
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
