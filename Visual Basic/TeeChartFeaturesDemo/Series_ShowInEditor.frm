VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ShowInEditor 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Editor"
      Height          =   345
      Left            =   4200
      TabIndex        =   6
      Top             =   1200
      Width           =   1095
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show in Legend"
      Height          =   255
      Left            =   2280
      TabIndex        =   5
      Top             =   1370
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show in Editor"
      Height          =   255
      Left            =   2280
      TabIndex        =   4
      Top             =   1130
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_ShowInEditor.frx":0000
      Left            =   720
      List            =   "Series_ShowInEditor.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1225
      Width           =   1215
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5145
      Left            =   0
      TabIndex        =   1
      Top             =   1770
      Width           =   11505
      Base64          =   $"Series_ShowInEditor.frx":0004
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ShowInEditor.frx":09F0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Series:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1295
      Width           =   480
   End
End
Attribute VB_Name = "Series_ShowInEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(Combo1.ListIndex).ShowInEditor = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(Combo1.ListIndex).ShowInLegend = Check2.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  If TChart1.Series(Combo1.ListIndex).ShowInEditor Then
    Check1.Value = 1
  Else
    Check1.Value = 0
  End If
  
  If TChart1.Series(Combo1.ListIndex).ShowInLegend Then
    Check2.Value = 1
  Else
    Check2.Value = 0
  End If
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
Dim i As Integer
  For i = 0 To TChart1.SeriesCount - 1
    Combo1.AddItem TChart1.Series(i).Name, i
  Next i
  
  Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
