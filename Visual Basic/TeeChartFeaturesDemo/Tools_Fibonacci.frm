VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tools_Fibonacci 
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
   Begin VB.CheckBox Check1 
      Caption         =   "&Level Labels"
      Height          =   285
      Left            =   5760
      TabIndex        =   11
      Top             =   1620
      Value           =   1  'Checked
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&TrendLine"
      Height          =   330
      Left            =   2565
      TabIndex        =   10
      Top             =   1440
      Width           =   1725
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tools_Fibonacci.frx":0000
      Left            =   3510
      List            =   "Tools_Fibonacci.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   1800
      Width           =   1815
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   300
      Left            =   1920
      Max             =   0
      Min             =   1000
      TabIndex        =   6
      Top             =   1860
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   1455
      TabIndex        =   5
      Text            =   "10"
      Top             =   1845
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   1920
      Max             =   0
      Min             =   1000
      TabIndex        =   3
      Top             =   1455
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1455
      TabIndex        =   2
      Text            =   "0"
      Top             =   1440
      Width           =   435
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4620
      Left            =   0
      TabIndex        =   0
      Top             =   2295
      Width           =   11505
      Base64          =   $"Tools_Fibonacci.frx":002E
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1275
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "Tools_Fibonacci.frx":1C9C
      Top             =   0
      Width           =   11520
   End
   Begin VB.Label Label3 
      Caption         =   "Arcs Style"
      Height          =   240
      Left            =   2610
      TabIndex        =   8
      Top             =   1845
      Width           =   870
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "End Point Index"
      Height          =   195
      Left            =   90
      TabIndex        =   7
      Top             =   1875
      Width           =   1125
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Start Point Index"
      Height          =   195
      Left            =   90
      TabIndex        =   4
      Top             =   1470
      Width           =   1170
   End
End
Attribute VB_Name = "Tools_Fibonacci"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(0).asFibonacci.ShowLabels = Check1.Value
  AdjusBottomAxis
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
  Case 0:
  TChart1.Tools.Items(0).asFibonacci.DrawStyle = fsArc
  Case 1:
  TChart1.Tools.Items(0).asFibonacci.DrawStyle = fsFan
  Case 2:
  TChart1.Tools.Items(0).asFibonacci.DrawStyle = fsRetracement
  End Select
  AdjusBottomAxis
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).asFibonacci.TrendPen.ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (40)
    With .Tools.Items(0).asFibonacci
        .StartX = TChart1.Series(0).asCandle.DateValues.Value(0)
        .StartY = TChart1.Series(0).asCandle.CloseValues.Value(0)
        .EndX = TChart1.Series(0).asCandle.DateValues.Value(10)
        .EndY = TChart1.Series(0).asCandle.CloseValues.Value(10)
        Combo1.ListIndex = 0
    End With
  End With
  
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub AdjusBottomAxis()
  If ((TChart1.Tools.Items(0).asFibonacci.DrawStyle = fsFan) Or _
     ((TChart1.Tools.Items(0).asFibonacci.DrawStyle = fsRetracement) And _
     (TChart1.Tools.Items(0).asFibonacci.EndX = TChart1.Axis.Bottom.Maximum))) Then
    TChart1.Axis.Bottom.MaximumOffset = 25
  Else
    TChart1.Axis.Bottom.MaximumOffset = 0
  End If
End Sub

Private Sub Text2_Change()
  TChart1.Tools.Items(0).asFibonacci.StartX = TChart1.Series(0).asCandle.DateValues.Value(VScroll1.Value)
  TChart1.Tools.Items(0).asFibonacci.StartY = TChart1.Series(0).asCandle.CloseValues.Value(VScroll1.Value)
  AdjusBottomAxis
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

Private Sub Text3_Change()
  TChart1.Tools.Items(0).asFibonacci.EndX = TChart1.Series(0).asCandle.DateValues.Value(VScroll2.Value)
  TChart1.Tools.Items(0).asFibonacci.EndY = TChart1.Series(0).asCandle.CloseValues.Value(VScroll2.Value)
  AdjusBottomAxis
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = LTrim$(Str$(VScroll2.Value))
End Sub

