VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SubTitlesForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2250
   ClientTop       =   2220
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   0
      Top             =   1350
      Width           =   11505
      Base64          =   $"SubTitlesForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "SubTitlesForm.frx":0340
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Subfooter"
      Height          =   195
      Left            =   3120
      TabIndex        =   2
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1875
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Subtitle"
      Height          =   195
      Left            =   300
      TabIndex        =   1
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1695
   End
End
Attribute VB_Name = "SubTitlesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.SubHeader.Visible = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.SubFooter.Visible = Check2.Value
End Sub
