VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolSeriesAnimationForm 
   BorderStyle     =   0  'None
   Caption         =   "Animate !"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"ToolSeriesAnimationForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5760
      TabIndex        =   7
      Top             =   1140
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "One by one"
      Height          =   255
      Left            =   4395
      TabIndex        =   6
      Top             =   1215
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2115
      Max             =   1000
      Min             =   1
      TabIndex        =   4
      Top             =   1215
      Value           =   100
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Animate !"
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   1140
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ToolSeriesAnimationForm.frx":033C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "100"
      Height          =   195
      Left            =   3855
      TabIndex        =   5
      Top             =   1230
      Width           =   270
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Steps:"
      Height          =   195
      Left            =   1515
      TabIndex        =   3
      Top             =   1215
      Width           =   450
   End
End
Attribute VB_Name = "ToolSeriesAnimationForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  On Error Resume Next

  HScroll1.Enabled = False
  Command1.Enabled = False
    
  TChart1.Tools.Items(0).asSeriesAnimation.Execute  ' <-- Animation !

  HScroll1.Enabled = True
  Command1.Enabled = True
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).ShowEditor

  ' cosmetic... just in case "steps" has changed
  HScroll1.Value = TChart1.Tools.Items(0).asSeriesAnimation.Steps
End Sub

Private Sub Check1_Click()
  If Check1.Value = 1 Then
     TChart1.Tools.Items(0).asSeriesAnimation.DrawEvery = 1
  Else
     TChart1.Tools.Items(0).asSeriesAnimation.DrawEvery = 0
  End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 6

  ' Cosmetic changes for better animation display...
  TChart1.Legend.Visible = False
  TChart1.Series(0).ValueFormat = "000"
  
  TChart1.Tools.Items(0).asSeriesAnimation.StartAtMin = False
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asSeriesAnimation.Steps = HScroll1.Value
  Label2.Caption = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  Label2.Caption = HScroll1.Value
End Sub
