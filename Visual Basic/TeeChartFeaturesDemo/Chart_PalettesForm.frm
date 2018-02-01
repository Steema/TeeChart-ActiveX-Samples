VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Chart_PalettesForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5055
      Left            =   0
      TabIndex        =   0
      Top             =   1860
      Width           =   11505
      Base64          =   $"Chart_PalettesForm.frx":0000
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Chart_PalettesForm.frx":065C
      Left            =   2385
      List            =   "Chart_PalettesForm.frx":067E
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1470
      Width           =   2175
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Chart_PalettesForm.frx":06D5
      Left            =   45
      List            =   "Chart_PalettesForm.frx":06E5
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1470
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Chart_PalettesForm.frx":0710
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Default Palettes :"
      Height          =   195
      Left            =   2385
      TabIndex        =   5
      Top             =   1245
      Width           =   1215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Custom Palettes :"
      Height          =   195
      Left            =   45
      TabIndex        =   4
      Top             =   1245
      Width           =   1230
   End
End
Attribute VB_Name = "Chart_PalettesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim RedPalette() As OLE_COLOR
Dim BluePalette() As OLE_COLOR
Dim GreenPalette() As OLE_COLOR

Private Sub Combo1_Click()
  ' Set a custom color palette
  Select Case Combo1.ListIndex
    Case 0:  TChart1.ApplyPalette cpDefault
    Case 1:  TChart1.ApplyCustomPalette RedPalette
    Case 2:  TChart1.ApplyCustomPalette BluePalette
    Case 3:  TChart1.ApplyCustomPalette GreenPalette
  End Select
  TChart1.Repaint
End Sub

Private Sub Combo2_Click()
  ' Set a pre-defined color palette
  TChart1.ApplyPalette Combo2.ListIndex
End Sub

Private Sub Form_Load()
Dim i As Integer
  With TChart1
    .Series(0).FillSampleValues (15)
    .Series(0).ColorEachPoint = True
  End With
  
  ' Add pre-defined ColorPalettes to combobox:
  With Combo2
    .Clear
    .AddItem "cpClassic"
    .AddItem "cpDefault"
    .AddItem "cpExcel"
    .AddItem "cpModern"
    .AddItem "cpPastel"
    .AddItem "cpRainbow"
    .AddItem "cpSolid"
    .AddItem "cpTeeChart"
    .AddItem "cpVictorian"
    .AddItem "cpWeb"
    .AddItem "cpWindowsXP"
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
  Combo1.ListIndex = 0
  Combo2.ListIndex = 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
  ' Reset back the default global TeeChart color palette
  ' to not alter the rest of demos.
  TChart1.ApplyPalette cpDefault
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
