VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MapSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2895
   ClientTop       =   1725
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   0
      Top             =   1260
      Width           =   11505
      Base64          =   $"MapSeriesFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Axes"
      Height          =   195
      Left            =   2400
      TabIndex        =   5
      Top             =   810
      Value           =   1  'Checked
      Width           =   915
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Marks"
      Height          =   195
      Left            =   3540
      TabIndex        =   4
      Top             =   810
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Palette"
      Height          =   195
      Left            =   4740
      TabIndex        =   3
      Top             =   810
      Value           =   1  'Checked
      Width           =   1035
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   660
      TabIndex        =   2
      Top             =   810
      Width           =   1155
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MapSeriesFormForm.frx":0154
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MapSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Axis.Visible = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).Marks.Visible = Check2.Value
End Sub

Private Sub Check3_Click()
  With TChart1.Series(0).asMap
    If Check3.Value = 1 Then
        .ClearPalette
      .UsePalette = True
      .UseColorRange = False
    Else
        .ClearPalette
      .UsePalette = False
      .UseColorRange = True
    End If
  End With
End Sub

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub AddShape(X, Y As Variant, Color As OLE_COLOR, Label As String)
Dim tmpIndex
  With TChart1.Series(0).asMap
    tmpIndex = .Shapes.Add
    For i = 0 To UBound(X)
    .Shapes.Polygon(tmpIndex).AddXY X(i), Y(i)
    Next i
    .Shapes.Polygon(tmpIndex).Color = Color
    .Shapes.Polygon(tmpIndex).Text = Label
    .Shapes.Polygon(tmpIndex).z = Rnd * 1000 / 1000
  End With
End Sub

Private Sub Form_Load()
 TChart1.AddSeries scMap
 TChart1.Series(0).asMap.PaletteStyle = psRainbow
 TChart1.Series(0).asMap.UsePalette = True
 TChart1.Series(0).asMap.UseColorRange = False
 TChart1.Series(0).Marks.Visible = True
 
 aX = Array(1, 3, 4, 4, 5, 5, 6, 6, 4, 3, 2, 1, 2, 2)
 aY = Array(7, 5, 5, 7, 8, 9, 10, 11, 11, 12, 12, 11, 10, 8)
 BX = Array(5, 7, 8, 8, 7, 6, 5, 4, 4)
 By = Array(4, 4, 5, 6, 7, 7, 8, 7, 5)
 CX = Array(9, 10, 11, 11, 12, 9, 8, 7, 6, 6, 5, 5, 6, 7, 8, 8)
 CY = Array(5, 6, 6, 7, 8, 11, 11, 12, 11, 10, 9, 8, 7, 7, 6, 5)
 DX = Array(12, 14, 15, 14, 13, 12, 11, 11)
 DY = Array(5, 5, 6, 7, 7, 8, 7, 6)
 EX = Array(4, 6, 7, 7, 6, 6, 5, 4, 3, 3, 2)
 EY = Array(11, 11, 12, 13, 14, 15, 16, 16, 15, 14, 13)
 FX = Array(7, 8, 9, 11, 10, 8, 7, 6, 5, 5, 6, 6)
 FY = Array(13, 14, 14, 16, 17, 17, 18, 18, 17, 16, 15, 14)
 GX = Array(10, 12, 12, 14, 13, 11, 9, 8, 7, 7, 8, 9)
 GY = Array(10, 12, 13, 15, 16, 16, 14, 14, 13, 12, 11, 11)
 HX = Array(17, 19, 18, 18, 17, 15, 14, 13, 15, 16)
 HY = Array(11, 13, 14, 16, 17, 15, 15, 14, 12, 12)
 IX = Array(15, 16, 17, 16, 15, 14, 14, 13, 12, 11, 10, 11, 12, 13, 14)
 IY = Array(6, 6, 7, 8, 8, 9, 10, 11, 12, 11, 10, 9, 8, 7, 7)
 JX = Array(15, 16, 16, 17, 17, 16, 15, 13, 12, 12, 14, 14)
 JY = Array(8, 8, 9, 10, 11, 12, 12, 14, 13, 12, 10, 9)
 KX = Array(17, 19, 20, 20, 19, 17, 16, 16, 17, 16)
 KY = Array(5, 5, 6, 8, 8, 10, 9, 8, 7, 6)
 LX = Array(19, 20, 21, 21, 19, 17, 17)
 LY = Array(8, 8, 9, 11, 13, 11, 10)
 

 AddShape aX, aY, clTeeColor, "A"
 AddShape BX, By, clTeeColor, "B"
 AddShape CX, CY, clTeeColor, "C"
 AddShape DX, DY, clTeeColor, "D"
 AddShape EX, EY, clTeeColor, "E"
 AddShape FX, FY, clTeeColor, "F"
 AddShape GX, GY, clTeeColor, "G"
 AddShape HX, HY, clTeeColor, "H"
 AddShape IX, IY, clTeeColor, "I"
 AddShape JX, JY, clTeeColor, "J"
 AddShape KX, KY, clTeeColor, "K"
 AddShape LX, LY, clTeeColor, "L"

TChart1.Series(0).asMap.PaletteStyle = psRainbow

End Sub
