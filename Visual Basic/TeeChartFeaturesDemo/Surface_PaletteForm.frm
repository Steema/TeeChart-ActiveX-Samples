VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Surface_PaletteForm 
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
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"Surface_PaletteForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Surface_PaletteForm.frx":07DA
      Left            =   1305
      List            =   "Surface_PaletteForm.frx":07ED
      TabIndex        =   3
      Text            =   "Combo1"
      Top             =   1035
      Width           =   1365
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Surface_PaletteForm.frx":081D
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Palette Style :"
      Height          =   240
      Left            =   135
      TabIndex        =   2
      Top             =   1080
      Width           =   1050
   End
End
Attribute VB_Name = "Surface_PaletteForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
    Select Case Combo1.ListIndex
        Case 0: TChart1.Series(0).asSurface.PaletteStyle = psPale
        Case 1: TChart1.Series(0).asSurface.PaletteStyle = psStrong
        Case 2: TChart1.Series(0).asSurface.PaletteStyle = psGrayScale
        Case 3: TChart1.Series(0).asSurface.PaletteStyle = psInvGray
        Case 4: TChart1.Series(0).asSurface.PaletteStyle = psRainbow
                TChart1.Series(0).asSurface.PaletteSteps = 25
    End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 4
  With TChart1
    .Series(0).FillSampleValues (30)
    .Series(0).asSurface.PaletteStyle = psRainbow 'Combo1.Item(1).ListIndex  'psPale 'psRainbow
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub


