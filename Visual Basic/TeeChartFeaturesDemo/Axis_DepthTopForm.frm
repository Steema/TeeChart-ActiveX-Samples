VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_DepthTopForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   0
      Top             =   1260
      Width           =   11505
      Base64          =   $"Axis_DepthTopForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "View Depth Axis"
      Height          =   240
      Left            =   2790
      TabIndex        =   3
      Top             =   900
      Width           =   2355
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View DepthTop Axis"
      Height          =   240
      Left            =   180
      TabIndex        =   2
      Top             =   900
      Value           =   1  'Checked
      Width           =   2355
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Axis_DepthTopForm.frx":06AE
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Axis_DepthTopForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Axis.DepthTop.Visible = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Axis.Depth.Visible = Check2.Value
End Sub

Private Sub Form_Load()
    TChart1.Series(0).FillSampleValues (10)
End Sub
