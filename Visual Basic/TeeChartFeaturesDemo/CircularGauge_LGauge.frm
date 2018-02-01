VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CircularGauge_LGauge 
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
   Begin VB.CheckBox cbHorizontal 
      Caption         =   "&Horizontal"
      Height          =   240
      Left            =   1935
      TabIndex        =   11
      Top             =   1305
      Width           =   1680
   End
   Begin VB.CheckBox cbSameValue 
      Caption         =   "&Same Value"
      Height          =   240
      Left            =   135
      TabIndex        =   10
      Top             =   1305
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Height          =   555
      Left            =   4095
      TabIndex        =   2
      Top             =   1125
      Width           =   5325
      Begin VB.CheckBox cbAutoPosition 
         Caption         =   "&Auto position"
         Height          =   285
         Left            =   180
         TabIndex        =   7
         Top             =   180
         Value           =   1  'Checked
         Width           =   1500
      End
      Begin VB.TextBox ETop 
         Height          =   285
         Left            =   2490
         TabIndex        =   6
         Text            =   "280"
         Top             =   180
         Width           =   435
      End
      Begin VB.VScrollBar VScroll1 
         Height          =   300
         Left            =   2955
         Max             =   1
         Min             =   10000
         TabIndex        =   5
         Top             =   150
         Value           =   280
         Width           =   255
      End
      Begin VB.TextBox ELeft 
         Height          =   285
         Left            =   4065
         TabIndex        =   4
         Text            =   "356"
         Top             =   180
         Width           =   435
      End
      Begin VB.VScrollBar VScroll2 
         Height          =   300
         Left            =   4530
         Max             =   1
         Min             =   10000
         TabIndex        =   3
         Top             =   150
         Value           =   356
         Width           =   255
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "&Top:"
         Height          =   195
         Left            =   1890
         TabIndex        =   9
         Top             =   210
         Width           =   330
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "&Left:"
         Height          =   195
         Left            =   3465
         TabIndex        =   8
         Top             =   210
         Width           =   315
      End
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"CircularGauge_LGauge.frx":0000
      Begin VB.Timer Timer2 
         Left            =   3735
         Top             =   1350
      End
      Begin VB.Timer Timer1 
         Left            =   2835
         Top             =   1350
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   45
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CircularGauge_LGauge.frx":0EF6
      Top             =   0
      Width           =   11505
   End
End
Attribute VB_Name = "CircularGauge_LGauge"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Increment As Double

Private Sub cbAutoPosition_Click()
  TChart1.Series(0).asCircularGauge.AutoPositionLinearGauge = cbAutoPosition.Value
  
  ELeft.Enabled = Not cbAutoPosition.Value
  VScroll1.Enabled = Not cbAutoPosition.Value
  ETop.Enabled = Not cbAutoPosition.Value
  VScroll2.Enabled = Not cbAutoPosition.Value

  If Not cbAutoPosition.Value Then
    VScroll1.Value = TChart1.Series(0).asCircularGauge.LinearGauge.CustomBounds.Top
    VScroll2.Value = TChart1.Series(0).asCircularGauge.LinearGauge.CustomBounds.Left
  Else
    ETop.Text = "0"
    ELeft.Text = "0"
  End If
End Sub

Private Sub cbHorizontal_Click()
  TChart1.Series(0).asCircularGauge.LinearGauge.Horizontal = cbHorizontal.Value
  TChart1.Series(0).asCircularGauge.LinearGauge.Axis.Title.Visible = False

  If cbHorizontal.Value Then
    TChart1.Series(0).asCircularGauge.LinearGauge.Axis.Increment = 50
  Else
    TChart1.Series(0).asCircularGauge.LinearGauge.Axis.Increment = 20
  End If
  TChart1.Series(0).asCircularGauge.LinearGauge.Axis.Labels.Font.Size = 7
End Sub

Private Sub cbSameValue_Click()
  TChart1.Series(0).asCircularGauge.AutoValueLinearGauge = cbSameValue.Value
  Timer2.Enabled = Not cbSameValue.Value
End Sub

Private Sub ELeft_Change()
  With TChart1.Series(0).asCircularGauge.LinearGauge
    w = .CustomBounds.Right - .CustomBounds.Left
    .SetCustomBounds VScroll2.Value, .CustomBounds.Top, VScroll2.Value + w, .CustomBounds.Bottom
  End With
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll2_Scroll()
  ELeft.Text = LTrim$(Str$(VScroll2.Value))
End Sub

Private Sub ETop_Change()
    With TChart1.Series(0).asCircularGauge.LinearGauge
    h = .CustomBounds.Bottom - .CustomBounds.Top
    .SetCustomBounds .CustomBounds.Left, VScroll1.Value, .CustomBounds.Right, VScroll1.Value + h
  End With
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll1_Scroll()
  ETop.Text = LTrim$(Str$(VScroll1.Value))
End Sub

Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .Legend.Visible = False
    .Header.Font.Color = vbWhite
    .Header.Caption = "Embedded Linear Gauge"
    
    .AddSeries scCircularGauge
    .Series(0).asCircularGauge.LinearGauge.Visible = True
    .Series(0).asCircularGauge.Value = 1
    
    .Series(0).asCircularGauge.Axis.Labels.Font.Size = 8
    .Series(0).asCircularGauge.Axis.Labels.Font.Color = vbGrayText
    .Series(0).asCircularGauge.TotalAngle = 280
    .Series(0).asCircularGauge.GreenLine.Pen.Visible = False
    .Series(0).asCircularGauge.RedLine.Pen.Visible = False
    
    Increment = 0.1
    Timer1.Interval = 50
    Timer2.Interval = 500
    Timer1.Enabled = True
    Timer2.Enabled = False
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Timer1_Timer()
  If (TChart1.Series(0).asCircularGauge.Value >= 100) Then
    Increment = -0.1
  End If
  If (TChart1.Series(0).asCircularGauge.Value <= 0) Then
    Increment = 0.1
  End If

  TChart1.Series(0).asCircularGauge.Value = TChart1.Series(0).asCircularGauge.Value + Increment
End Sub

Private Sub Timer2_Timer()
  If Not TChart1.Series(0).asCircularGauge.AutoValueLinearGauge Then
    TChart1.Series(0).asCircularGauge.LinearGauge.Value = Round(Rnd * 100)
  End If
End Sub
