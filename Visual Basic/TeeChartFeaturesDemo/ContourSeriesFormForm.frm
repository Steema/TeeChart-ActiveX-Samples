VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ContourSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3450
   ClientTop       =   2145
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"ContourSeriesFormForm.frx":0000
   End
   Begin VB.CheckBox Check5 
      Caption         =   "Surface"
      Height          =   195
      Left            =   5940
      TabIndex        =   6
      Top             =   1230
      Width           =   915
   End
   Begin VB.CheckBox Check4 
      Caption         =   "Levels at Y"
      Height          =   195
      Left            =   4440
      TabIndex        =   5
      Top             =   1230
      Width           =   1215
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Color each level"
      Height          =   195
      Left            =   2520
      TabIndex        =   4
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show walls"
      Height          =   195
      Left            =   1080
      TabIndex        =   3
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1155
   End
   Begin VB.CheckBox Check1 
      Caption         =   "2D"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1230
      Width           =   675
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ContourSeriesFormForm.frx":0668
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ContourSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Aspect.View3D = False
  Else
    TChart1.Aspect.View3D = True
  End If
End Sub

Private Sub Check2_Click()
  TChart1.Walls.Visible = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Series(1).ColorEachPoint = Check3.Value
End Sub

Private Sub Check4_Click()
  TChart1.Series(1).asContour.YPositionLevel = Check4.Value
End Sub

Private Sub Check5_Click()
  TChart1.Series(0).Active = Check5.Value
End Sub

Private Function RandomXYZ(ByVal X As Integer, ByVal z As Integer) As Double
Dim tmp
  tmp = Cos(ToAngle(z))
  RandomXYZ = (500 * (Sin(ToAngle(X)) + tmp * tmp))
End Function
Private Function ToAngle(Value As Integer) As Double
  ToAngle = ((Value + 10) * 18) * 3.142 / 180
End Function
Private Sub Form_Load()
  With TChart1.Series(1)
    .Clear   ' We add values from 0 to 1000.  21x21 cells = 441
    For X = -10 To 10
      For z = -10 To 10
        .asContour.AddXYZ X, RandomXYZ(X, z), z, "", clTeeColor
      Next z
    Next X
    ' Then we specify how many "contour levels" we want
    .asContour.NumLevels = 10
    ' We specify the Y levels position to the "middle"
    .asContour.YPosition = (.YValues.Maximum + .YValues.Minimum) / 2
    .Name = "ContourSeries"
    ' We can set some Chart properties to improve aspect
    TChart1.Aspect.Chart3DPercent = 100
    ' We can add a Surface Series to copy the Contour
    TChart1.Series(0).DataSource = TChart1.Series(1).Name
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
