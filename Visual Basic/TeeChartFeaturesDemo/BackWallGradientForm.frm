VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BackWallGradientForm 
   BorderStyle     =   0  'None
   Caption         =   "GradientForm"
   ClientHeight    =   6915
   ClientLeft      =   2145
   ClientTop       =   2445
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5805
      Left            =   0
      TabIndex        =   0
      Top             =   1110
      Width           =   11505
      Base64          =   $"BackWallGradientForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "BackWallGradientForm.frx":00D0
      Top             =   0
      Width           =   11460
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Backwall gradient"
      Height          =   195
      Left            =   180
      TabIndex        =   1
      Top             =   780
      Value           =   1  'Checked
      Width           =   1635
   End
End
Attribute VB_Name = "BackWallGradientForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Walls.Back.Transparent = False
  TChart1.Walls.Back.Gradient.Visible = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Walls.Back.Transparent = False
  TChart1.Walls.Back.Gradient.Visible = True
  TChart1.Walls.Back.Gradient.MidColor = vbCyan
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.ShowEditor
  TChart1.StopMouse
End Sub
