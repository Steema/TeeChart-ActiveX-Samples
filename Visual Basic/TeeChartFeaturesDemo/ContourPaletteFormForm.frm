VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ContourPaletteFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2355
   ClientTop       =   3780
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5775
      Left            =   0
      TabIndex        =   0
      Top             =   1140
      Width           =   11505
      Base64          =   $"ContourPaletteFormForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "ContourPaletteFormForm.frx":0376
      Left            =   1140
      List            =   "ContourPaletteFormForm.frx":0389
      TabIndex        =   2
      Text            =   "Gradient 3 colors"
      Top             =   690
      Width           =   1755
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ContourPaletteFormForm.frx":03DF
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Colors:"
      Height          =   195
      Left            =   480
      TabIndex        =   3
      Top             =   750
      Width           =   480
   End
End
Attribute VB_Name = "ContourPaletteFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  SetSeriesColors
End Sub

Private Sub SetSeriesColors()
  With TChart1.Series(0)
    Select Case Combo1.ListIndex
      Case 0 ' single color
        .asContour.UseColorRange = False
        .asContour.UsePalette = False
        .Color = vbYellow
      Case 1 ' gradient 2 colors
        .asContour.UseColorRange = True
        .asContour.UsePalette = False
        .asContour.StartColor = vbBlue
        .asContour.EndColor = vbRed
        .asContour.MidColor = clNone
      Case 2 ' gradient 3 colors
        .asContour.UseColorRange = True
        .asContour.UsePalette = False
        .asContour.StartColor = vbBlue
        .asContour.EndColor = vbRed
        .asContour.MidColor = vbYellow
      Case 3 ' palette "pale"
        .asContour.UseColorRange = False
        .asContour.UsePalette = True
        .asContour.PaletteStyle = psPale
      Case 4 ' palette "strong"
        .asContour.UseColorRange = False
        .asContour.UsePalette = True
        .asContour.PaletteStyle = psStrong
    End Select
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues (25)
  Combo1.ListIndex = 2
  Combo1_Click
End Sub

Private Sub Text1_Click()
  TChart1.ShowEditor
End Sub
