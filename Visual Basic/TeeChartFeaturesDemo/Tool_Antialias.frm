VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Antialias 
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
      Left            =   2340
      Max             =   255
      Min             =   -255
      TabIndex        =   3
      Top             =   1230
      Width           =   2745
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Antialias"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1065
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Tool_Antialias.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Tool_Antialias.frx":9BA0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Colors:"
      Height          =   195
      Left            =   1740
      TabIndex        =   4
      Top             =   1260
      Width           =   480
   End
End
Attribute VB_Name = "Tool_Antialias"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Header.Caption = Str$(TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asHueLumSat.Hue)
End Sub

Private Sub Check1_Click()
  TChart1.Tools.Items(1).asAntiAlias.Antialias = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Panel.Border.Visible = True
  TChart1.Tools.Add tcAntiAlias
  TChart1.Tools.Items(1).asAntiAlias.Filters.Add fcHueLumSat
  TChart1.Tools.Items(1).asAntiAlias.Filters.Item(0).asHueLumSat.Hue = 0
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(1).asAntiAlias.Filters.Item(0).asHueLumSat.Hue = HScroll1.Value
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
