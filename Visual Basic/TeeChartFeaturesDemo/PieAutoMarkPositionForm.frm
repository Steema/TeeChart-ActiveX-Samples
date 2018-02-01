VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form PieAutoMarkPositionForm 
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
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"PieAutoMarkPositionForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Auto Mark position"
      Height          =   255
      Left            =   600
      TabIndex        =   0
      Top             =   1185
      Value           =   1  'Checked
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "PieAutoMarkPositionForm.frx":0BA0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PieAutoMarkPositionForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asPie.AutoMarkPosition = Check1.Value = 1
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 16
End Sub
