VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CurveFitting_NormCoef 
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
      Height          =   4530
      Left            =   0
      TabIndex        =   0
      Top             =   2385
      Width           =   11505
      Base64          =   $"CurveFitting_NormCoef.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   2370
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "CurveFitting_NormCoef.frx":1450
      Top             =   0
      Width           =   11505
   End
End
Attribute VB_Name = "CurveFitting_NormCoef"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  With TChart1
    .Series(0).AddXY 0, 4, "", clTeeColor
    .Series(0).AddXY 3, 5, "", clTeeColor
     
    .Axis.Bottom.SetMinMax .Series(0).XValues.Minimum - 0.5, .Series(0).XValues.Maximum + 0.5
    .Axis.Left.SetMinMax .Series(0).YValues.Minimum - 0.5, .Series(0).YValues.Maximum + 0.5

    .Series(1).FunctionType.asCurveFit.PolyDegree = 2
    .Series(1).Pen.Width = 3
    .Series(0).Active = False

    ' show the polynomy...
    ShowFunction
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub ShowFunction()
Dim tmp As String
Dim a0, a1 As Double
  
  With TChart1.Series(1).FunctionType.asCurveFit
    a1 = .AnswerVector(2)
    a0 = -.AnswerVector(2) * TChart1.Series(0).XValues.Minimum + .AnswerVector(1) + TChart1.Series(0).YValues.Minimum
  End With

  tmp = "y = " & a1 & "*x + " & a0
  TChart1.Header.Caption = tmp
End Sub

