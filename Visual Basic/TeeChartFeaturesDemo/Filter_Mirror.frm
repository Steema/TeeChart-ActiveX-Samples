VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Mirror 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Filter_Mirror.frx":0000
      Left            =   1500
      List            =   "Filter_Mirror.frx":0010
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1050
      Width           =   1395
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Filter_Mirror.frx":002B
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Filter_Mirror.frx":0DF1
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Mirror Direction:"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   1110
      Width           =   1110
   End
End
Attribute VB_Name = "Filter_Mirror"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asMirror.Direction = Combo1.ListIndex
  TChart1.Repaint
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcAntiAlias
  TChart1.Tools.Items(0).asAntiAlias.Filters.Add fcMirror
  TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asMirror.Direction = mdLeft
  Combo1.ListIndex = 3
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
