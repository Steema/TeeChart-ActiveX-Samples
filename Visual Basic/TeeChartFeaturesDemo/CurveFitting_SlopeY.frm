VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CurveFitting_SlopeY 
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
   Begin VB.CommandButton Command1 
      Caption         =   "&New Values"
      Height          =   375
      Left            =   90
      TabIndex        =   2
      Top             =   630
      Width           =   1185
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5880
      Left            =   0
      TabIndex        =   0
      Top             =   1035
      Width           =   11505
      Base64          =   $"CurveFitting_SlopeY.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   570
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CurveFitting_SlopeY.frx":147A
      Top             =   0
      Width           =   11505
   End
End
Attribute VB_Name = "CurveFitting_SlopeY"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Series(0).Clear
  TChart1.Series(0).AddXY Rnd * 1 - 0.5, Rnd * 1, "", clTeeColor
  TChart1.Series(0).AddXY Rnd * 1 - 0.5, Rnd * 1, "", clTeeColor

  TChart1.Series(1).CheckDataSource

  ' show slope and Y-intercept ...
  ShowSlopeAndY
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(1).FunctionType.asCurveFit.PolyDegree = 2
    .Series(0).Active = False
    .Series(1).Pen.Width = 3

    .Axis.Left.SetMinMax 0, 1
    .Axis.Bottom.SetMinMax -0.5, 0.5
  End With
  Command1_Click
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub ShowSlopeAndY()
Dim slope, yIntercept As Double
    
    slope = TChart1.Series(1).FunctionType.asCurveFit.AnswerVector(2)
    yIntercept = -TChart1.Series(1).FunctionType.asCurveFit.AnswerVector(2) * _
      TChart1.Series(0).XValues.Minimum + TChart1.Series(1).FunctionType.asCurveFit.AnswerVector(1) + _
      TChart1.Series(0).YValues.Minimum

    TChart1.Header.Clear
    TChart1.Header.Text.Add "Slope = " & slope
    TChart1.Header.Text.Add "Y-Intercept = " & yIntercept
End Sub
