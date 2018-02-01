VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_WindRoseMirrorAngles 
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
   Begin VB.CheckBox Check2 
      Caption         =   "Mirror Labels"
      Height          =   195
      Left            =   1890
      TabIndex        =   4
      Top             =   1230
      Width           =   1275
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_WindRoseMirrorAngles.frx":0000
      Left            =   3480
      List            =   "Series_WindRoseMirrorAngles.frx":0028
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1170
      Width           =   1305
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Mirror Angles"
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   1230
      Width           =   1305
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11460
      Base64          =   $"Series_WindRoseMirrorAngles.frx":0060
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_WindRoseMirrorAngles.frx":0842
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series_WindRoseMirrorAngles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asWindRose.MirrorAngles = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asWindRose.MirrorLabels = Check2.Value
End Sub

Private Sub Combo1_Change()
  TChart1.Series(0).asWindRose.AngleIncrement = val(Combo1.Text)
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 3
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
