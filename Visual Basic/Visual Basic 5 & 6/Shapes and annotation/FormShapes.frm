VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro Shapes Example"
   ClientHeight    =   4905
   ClientLeft      =   3000
   ClientTop       =   3870
   ClientWidth     =   7380
   LinkTopic       =   "Form1"
   ScaleHeight     =   4905
   ScaleWidth      =   7380
   Begin TeeChart.TChart TChart1 
      Height          =   4095
      Left            =   120
      OleObjectBlob   =   "FormShapes.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   7035
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1920
      Top             =   4380
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show &Axis"
      Height          =   315
      Left            =   120
      TabIndex        =   2
      Top             =   4440
      Value           =   1  'Checked
      Width           =   1395
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   435
      Left            =   5820
      TabIndex        =   1
      Top             =   4440
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
' show / hide axis...
  TChart1.Axis.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
  End
End Sub

Private Sub Form_Load()
' fill the line series with random values
' this series is just a nice background effect...
  With TChart1.Series(0)
    .Clear
    For t = 1 To 150
      .AddXY t, 75 + 25 * Rnd(100), "", vbRed
    Next
  End With
' enable animation timer...
  Timer1.Enabled = True
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
With TChart1.Series(SeriesIndex)
  If .SeriesType = scShape Then
     MsgBox "Salary of " + .asShape.Text(1) + vbCrLf + " is $" + Str$(Int(100000 * Rnd(100000)))
  End If
End With
End Sub

Private Sub Timer1_Timer()
With TChart1.Series(0)
  SomePoint = Int(.Count * Rnd(1))
  SomeValue = .YValues.Value(SomePoint) + 10 * Rnd(1)
  .YValues.Value(SomePoint) = SomeValue
End With
TChart1.Repaint
End Sub


