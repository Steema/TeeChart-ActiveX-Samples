VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form CircularGauge_Series 
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
   Begin VB.VScrollBar VScrollInner 
      Height          =   270
      Left            =   9705
      Max             =   1
      Min             =   100
      TabIndex        =   16
      Top             =   1320
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox TextInner 
      Height          =   285
      Left            =   9240
      TabIndex        =   15
      Text            =   "90"
      Top             =   1305
      Width           =   435
   End
   Begin VB.VScrollBar VScrollMiddle 
      Height          =   270
      Left            =   7995
      Max             =   1
      Min             =   100
      TabIndex        =   13
      Top             =   1320
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox TextMiddle 
      Height          =   285
      Left            =   7530
      TabIndex        =   12
      Text            =   "150"
      Top             =   1305
      Width           =   435
   End
   Begin VB.VScrollBar VScrollOuter 
      Height          =   270
      Left            =   6240
      Max             =   1
      Min             =   100
      TabIndex        =   9
      Top             =   1320
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox TextOuter 
      Height          =   285
      Left            =   5775
      TabIndex        =   8
      Text            =   "-90"
      Top             =   1305
      Width           =   435
   End
   Begin VB.VScrollBar VScrollWidth 
      Height          =   270
      Left            =   4680
      Max             =   1
      Min             =   100
      TabIndex        =   6
      Top             =   1320
      Value           =   1
      Width           =   255
   End
   Begin VB.TextBox Text_Width 
      Height          =   285
      Left            =   4200
      TabIndex        =   5
      Text            =   "180"
      Top             =   1305
      Width           =   435
   End
   Begin VB.CheckBox cbAnimate 
      Caption         =   "&Animate"
      Height          =   285
      Left            =   1395
      TabIndex        =   3
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1230
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   375
      Left            =   180
      TabIndex        =   2
      Top             =   1260
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"CircularGauge_Series.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   347
      Object.Left            =   0
      Object.Top             =   114
      Object.Visible         =   -1  'True
      Object.Width           =   767
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   0
      Languaged       =   0
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Left            =   360
         Top             =   180
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CircularGauge_Series.frx":0DCE
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "&Inner % :"
      Height          =   195
      Left            =   8460
      TabIndex        =   17
      Top             =   1350
      Width           =   660
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "&Middle % :"
      Height          =   195
      Left            =   6750
      TabIndex        =   14
      Top             =   1350
      Width           =   765
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "&Period :"
      Height          =   195
      Left            =   19935
      TabIndex        =   11
      Top             =   8955
      Width           =   540
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "&Outer % :"
      Height          =   195
      Left            =   5040
      TabIndex        =   10
      Top             =   1350
      Width           =   645
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Width % :"
      Height          =   195
      Left            =   3465
      TabIndex        =   7
      Top             =   1350
      Width           =   675
   End
   Begin VB.Label Label1 
      Caption         =   "Frame :"
      Height          =   240
      Left            =   2700
      TabIndex        =   4
      Top             =   1350
      Width           =   645
   End
End
Attribute VB_Name = "CircularGauge_Series"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim id As Integer  ' id = 0 = outer
Dim up As Boolean
Dim Value As Double
Dim isChanging As Boolean
Dim FrameElementPercents0, FrameElementPercents1, FrameElementPercents2 As Integer
Private Sub Form_Load()
  With TChart1
    .AddSeries scCircularGauge
    FrameElementPercents0 = 25
    FrameElementPercents1 = 60
    FrameElementPercents2 = 15
    up = True
    isChanging = False
    Value = 0
    .Series(0).asCircularGauge.Frame.Visible = True
    .Series(0).asCircularGauge.Frame.Width = 5
    VScrollOuter.Value = FrameElementPercents2
    VScrollMiddle.Value = FrameElementPercents1
    VScrollInner.Value = FrameElementPercents0
    VScrollWidth.Value = TChart1.Series(0).asCircularGauge.Frame.Width
    End With
  Timer1.Interval = 10
  Timer1.Enabled = True
End Sub

Private Sub Check1_Click()
  Timer1.Enabled = cbAnimate.Value
End Sub

Private Sub cbAnimate_Click()
  Timer1.Enabled = cbAnimate.Value
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub
Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
Private Sub RationaliseValues(ByVal X As Double, ByVal Y As Double, ByVal z As Double)
Dim tmpTotal, percentCoef As Double

  tmpTotal = (X + Y) + z
  If (tmpTotal <> 100) Then
    percentCoef = 100 / tmpTotal
    X = X * percentCoef
    Y = Y * percentCoef
    z = z * percentCoef
  End If
End Sub

Private Sub TextOuter_Change()
Dim val As Integer
Dim appOuter, appMiddle, appInner As Double
  If (Not isChanging) Then
    isChanging = True
     If (id = 0) Then
        val = Round(VScrollOuter.Value)
        FrameElementPercents2 = val
    ElseIf (id = 1) Then
        val = Round(VScrollMiddle.Value)
        FrameElementPercents1 = val
    ElseIf (id = 2) Then
        val = Round(VScrollInner.Value)
        FrameElementPercents0 = val
    End If
    appOuter = FrameElementPercents2
    appMiddle = FrameElementPercents1
    appInner = FrameElementPercents0
    
    RationaliseValues appInner, appMiddle, appOuter
    VScrollOuter.Value = appOuter
    VScrollMiddle.Value = appMiddle
    VScrollInner.Value = appInner
    isChanging = False
  End If

  TChart1.Repaint
End Sub

Private Sub Text_Width_Change()
  TChart1.Series(0).asCircularGauge.Frame.Width = Rnd(VScrollWidth.Value)
  TChart1.Series(0).RefreshSeries
End Sub

Private Sub Timer1_Timer()
  If (up) Then
    Value = Value + 1
  Else
    Value = Value - 1
  End If
  
  If (Value > 99) Then
    up = False
  Else
    If (Value < 1) Then
       up = True
    End If
  End If
  TChart1.Series(0).asCircularGauge.Value = Value
End Sub


Private Sub VScrollWidth_Change()
  VScrollWidth_Scroll
End Sub

Private Sub VScrollWidth_Scroll()
  Text_Width.Text = LTrim$(Str$(VScrollWidth.Value))
End Sub
Private Sub VScrollOuter_Change()
  VScrollOuter_Scroll
End Sub

Private Sub VScrollOuter_Scroll()
  TextOuter.Text = LTrim$(Str$(VScrollOuter.Value))
  id = 0
  TextOuter_Change
End Sub
Private Sub VScrollMiddle_Change()
  VScrollMiddle_Scroll
End Sub

Private Sub VScrollMiddle_Scroll()
  TextMiddle.Text = LTrim$(Str$(VScrollMiddle.Value))
  id = 1
  TextOuter_Change
End Sub

Private Sub VScrollInner_Change()
  VScrollInner_Scroll
End Sub

Private Sub VScrollInner_Scroll()
  TextInner.Text = LTrim$(Str$(VScrollInner.Value))
  id = 2
  TextOuter_Change
End Sub



