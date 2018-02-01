VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5145
   ClientLeft      =   2775
   ClientTop       =   2865
   ClientWidth     =   7740
   LinkTopic       =   "Form1"
   ScaleHeight     =   5145
   ScaleWidth      =   7740
   StartUpPosition =   2  'CenterScreen
   Begin TeeChart.TChart TChart1 
      Height          =   4515
      Left            =   60
      OleObjectBlob   =   "Form RealTime.frx":0000
      TabIndex        =   0
      Top             =   60
      Width           =   7635
   End
   Begin VB.CheckBox Check2 
      Caption         =   "View &3D"
      Height          =   255
      Left            =   1920
      TabIndex        =   3
      Top             =   4740
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   3960
      Top             =   4680
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Animate !!"
      Height          =   315
      Left            =   120
      TabIndex        =   2
      Top             =   4680
      Value           =   1  'Checked
      Width           =   1155
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   375
      Left            =   6360
      TabIndex        =   1
      Top             =   4680
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub AnimateSeries(Index As Integer)
Dim NewValue As Double
 
 With TChart1.Series(Index)
   ' if there are more than 50 points in the Series,
   ' delete the first point
   If .Count > 50 Then .Delete (0)
   
   ' add a new random point to the end of the Series
   NewValue = .YValues.Last + 1000 * Rnd(1) - 500
   .AddXY .XValues.Last + 1, NewValue, "", clTeeColor
   
 End With
End Sub

Private Sub Check1_Click()
' start / stop animation timer...
 Timer1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
 ' show chart in 2D or 3D ...
 TChart1.Aspect.View3D = Check2.Value
End Sub

Private Sub Command1_Click()
  End
End Sub

Private Sub Form_Load()
 ' set Bottom axis to show one label at each 5 units...
 TChart1.Axis.Bottom.Increment = 5
 
 ' add one sample value to each Series
 TChart1.Series(0).Add 1000, "", clTeeColor
 TChart1.Series(1).Add 1000, "", clTeeColor
 TChart1.Series(2).Add 1000, "", clTeeColor
 TChart1.Series(3).Add 1000, "", clTeeColor
 
 ' turn off gradient fill for 16 color video modes...
 TChart1.Panel.Gradient.Visible = TChart1.Canvas.IsScreenHighColor
End Sub

Private Sub Timer1_Timer()
 ' animate each chart Series at every timer...
 AnimateSeries (0)
 AnimateSeries (1)
 AnimateSeries (2)
 AnimateSeries (3)
End Sub


