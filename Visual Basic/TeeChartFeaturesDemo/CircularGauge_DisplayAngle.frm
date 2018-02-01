VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CircularGauge_DisplayAngle 
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
   Begin VB.Timer Timer1 
      Left            =   450
      Top             =   2025
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   8835
      TabIndex        =   12
      Text            =   "90"
      Top             =   1305
      Width           =   435
   End
   Begin VB.VScrollBar UDRotationAngle 
      Height          =   300
      Left            =   9300
      Max             =   -360
      Min             =   360
      TabIndex        =   11
      Top             =   1320
      Value           =   90
      Width           =   255
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   6585
      TabIndex        =   9
      Text            =   "178"
      Top             =   1305
      Width           =   435
   End
   Begin VB.VScrollBar UDTotalAngle 
      Height          =   300
      Left            =   7050
      Max             =   -360
      Min             =   360
      TabIndex        =   8
      Top             =   1320
      Value           =   -178
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4560
      TabIndex        =   6
      Text            =   "-100"
      Top             =   1305
      Width           =   480
   End
   Begin VB.VScrollBar UDDisplayRotationAngle 
      Height          =   300
      Left            =   5070
      Max             =   -360
      Min             =   360
      TabIndex        =   5
      Top             =   1320
      Value           =   -100
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   1680
      TabIndex        =   3
      Text            =   "200"
      Top             =   1290
      Width           =   525
   End
   Begin VB.VScrollBar UDDisplayTotalAngle 
      Height          =   300
      Left            =   2280
      Max             =   -360
      Min             =   360
      TabIndex        =   2
      Top             =   1305
      Value           =   200
      Width           =   255
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"CircularGauge_DisplayAngle.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1200
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CircularGauge_DisplayAngle.frx":2592
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "&Rotation Angle"
      Height          =   195
      Left            =   7650
      TabIndex        =   13
      Top             =   1365
      Width           =   1050
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "&Total Angle:"
      Height          =   195
      Left            =   5625
      TabIndex        =   10
      Top             =   1365
      Width           =   855
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Di&splay Rotation Angle:"
      Height          =   195
      Left            =   2835
      TabIndex        =   7
      Top             =   1365
      Width           =   1650
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Display Total Angle:"
      Height          =   195
      Left            =   180
      TabIndex        =   4
      Top             =   1350
      Width           =   1410
   End
End
Attribute VB_Name = "CircularGauge_DisplayAngle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim up As Boolean

Private Sub Form_Load()
  up = True
  With TChart1
    UDDisplayTotalAngle.Value = 200
    UDDisplayRotationAngle.Value = -100
    UDTotalAngle.Value = 178
    UDRotationAngle.Value = 90

    With .Series(0).asCircularGauge
      .DisplayTotalAngle = 200
      .DisplayRotationAngle = -100
      .TotalAngle = 178
      .RotationAngle = 90
      .Value = 1
      .Axis.Labels.Font.Size = 12
      .Axis.AxisPen.Visible = False
      .Axis.Labels.Font.Color = vbGrayText
      .Axis.Labels.Angle = 90
      .Face.Color = RGB(255, 255, 192)
      .Face.Gradient.Visible = False
      .Frame.Width = 5
      .Hand.Distance = 20
    End With

    Timer1.Enabled = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(0).asCircularGauge.DisplayRotationAngle = UDDisplayRotationAngle.Value
End Sub

Private Sub Text3_Change()
  TChart1.Series(0).asCircularGauge.DisplayTotalAngle = UDDisplayTotalAngle.Value
End Sub

Private Sub Text4_Change()
  TChart1.Series(0).asCircularGauge.TotalAngle = UDTotalAngle.Value
End Sub

Private Sub Text5_Change()
  TChart1.Series(0).asCircularGauge.RotationAngle = UDRotationAngle.Value
End Sub

Private Sub Timer1_Timer()
  If ((Rnd(TChart1.Series(0).asCircularGauge.Value) = 100) Or (Rnd(TChart1.Series(0).asCircularGauge.Value) = 0#)) Then
     up = Not up
  End If
  
  If (up) Then
     TChart1.Series(0).asCircularGauge.Value = TChart1.Series(0).asCircularGauge.Value + 1
  Else
     TChart1.Series(0).asCircularGauge.Value = TChart1.Series(0).asCircularGauge.Value - 1
  End If
End Sub


Private Sub UDDisplayRotationAngle_Change()
  UDDisplayRotationAngle_Scroll
End Sub

Private Sub UDDisplayRotationAngle_Scroll()
  Text2.Text = LTrim$(Str$(UDDisplayRotationAngle.Value))
End Sub

Private Sub UDDisplayTotalAngle_Change()
UDDisplayTotalAngle_Scroll
End Sub

Private Sub UDDisplayTotalAngle_Scroll()
  Text3.Text = LTrim$(Str$(UDDisplayTotalAngle.Value))
End Sub

Private Sub UDRotationAngle_Change()
  UDRotationAngle_Scroll
End Sub

Private Sub UDRotationAngle_Scroll()
  Text5.Text = LTrim$(Str$(UDRotationAngle.Value))
End Sub

Private Sub UDTotalAngle_Change()
UDTotalAngle_Scroll
End Sub

Private Sub UDTotalAngle_Scroll()
  Text4.Text = LTrim$(Str$(UDTotalAngle.Value))
End Sub
