VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesTowerForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
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
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"SeriesTowerForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Origin"
      Height          =   195
      Left            =   4320
      TabIndex        =   5
      Top             =   1170
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesTowerForm.frx":02D6
      Left            =   2355
      List            =   "SeriesTowerForm.frx":02EF
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1095
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   480
      TabIndex        =   2
      Top             =   1065
      Width           =   1200
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesTowerForm.frx":032B
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Style:"
      Height          =   195
      Left            =   1920
      TabIndex        =   3
      Top             =   1140
      Width           =   390
   End
End
Attribute VB_Name = "SeriesTowerForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  TChart1.Series(0).asTower.TowerStyle = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Check1_Click()
  TChart1.Series(0).asTower.UseOrigin = Check1.Value = 1
End Sub

Private Sub Form_Load()
Dim X As Integer, z As Integer
  TChart1.Series(0).Clear
  For X = 1 To 10
    For z = 1 To 10
      TChart1.Series(0).asTower.AddXYZ X, Rnd * 1000 - 100, z, "", clTeeColor
    Next z
  Next X
  ' example:
  TChart1.Series(0).asTower.Origin = 500
  TChart1.Series(0).asTower.UseOrigin = True
  Combo1.ListIndex = 0
End Sub
