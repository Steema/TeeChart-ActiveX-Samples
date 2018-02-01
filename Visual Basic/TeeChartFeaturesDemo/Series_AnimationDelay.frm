VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form Series_AnimationDelay 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2280
      Max             =   1000
      TabIndex        =   8
      Top             =   1245
      Value           =   100
      Width           =   1815
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   1320
      Max             =   0
      Min             =   32767
      TabIndex        =   6
      Top             =   1245
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   600
      TabIndex        =   5
      Text            =   "10"
      Top             =   1245
      Width           =   735
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5880
      TabIndex        =   3
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Animate!"
      Height          =   345
      Left            =   4680
      TabIndex        =   2
      Tag             =   "0"
      Top             =   1200
      Width           =   975
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Series_AnimationDelay.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_AnimationDelay.frx":0916
      Top             =   0
      Width           =   11430
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "100"
      Height          =   195
      Left            =   4200
      TabIndex        =   9
      Top             =   1290
      Width           =   270
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Steps:"
      Height          =   195
      Left            =   1800
      TabIndex        =   7
      Top             =   1290
      Width           =   450
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Delay:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1285
      Width           =   450
   End
End
Attribute VB_Name = "Series_AnimationDelay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  If Command1.Tag = 1 Then
    stop_animation
  Else
    Command1.Tag = 1
    Command1.Caption = "Stop"
    TChart1.Tools.Items(0).asSeriesAnimation.Execute
    stop_animation
  End If
End Sub

Private Sub stop_animation()
  TChart1.Tools.Items(0).asSeriesAnimation.Stop
  Command1.Tag = 0
  Command1.Caption = "Execute!"
End Sub


Private Sub Command2_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcSeriesAnimation
  TChart1.Tools.Items(0).asSeriesAnimation.Steps = 100
  TChart1.Tools.Items(0).asSeriesAnimation.Delay = 10
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asSeriesAnimation.Steps = HScroll1.Value
  Label3.Caption = HScroll1.Value
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Delay"
  Else
    If (val(Text2.Text) > 32767 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 32.767", , "Delay"
    Else
      TChart1.Tools.Items(0).asSeriesAnimation.Delay = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
