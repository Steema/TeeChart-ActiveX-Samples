VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Rotate 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   7170
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text2 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5970
      TabIndex        =   7
      Top             =   1050
      Width           =   315
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Back Color       "
      Height          =   345
      Left            =   4560
      TabIndex        =   6
      Top             =   1020
      Width           =   1755
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Autosize"
      Height          =   195
      Left            =   3150
      TabIndex        =   5
      Top             =   1110
      Value           =   1  'Checked
      Width           =   1065
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   780
      Max             =   360
      TabIndex        =   3
      Top             =   1080
      Width           =   1755
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   1
      Top             =   1470
      Width           =   11505
      Base64          =   $"Filter_Rotate.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_Rotate.frx":085E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "10"
      Height          =   195
      Left            =   2640
      TabIndex        =   4
      Top             =   1110
      Width           =   180
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Angle:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1110
      Width           =   450
   End
End
Attribute VB_Name = "Filter_Rotate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asRotate.AutoSize = Check1.Value
  TChart1.Repaint
End Sub

Private Sub Command1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> 0 Then
    TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asRotate.BackColor = CommonDialog1.Color
    Text2.BackColor = CommonDialog1.Color
    TChart1.Repaint
  End If
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcAntiAlias
  TChart1.Tools.Items(0).asAntiAlias.Filters.Add fcRotate
  
  With TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asRotate
    .Angle = 10
    .AutoSize = True
    HScroll1.Value = Round(.Angle)
    .BackColor = vbWhite
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asRotate.Angle = HScroll1.Value
  Label2.Caption = Str$(HScroll1.Value)
  
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
