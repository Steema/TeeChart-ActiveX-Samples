VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisMinorGridForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2085
   ClientTop       =   1575
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"AxisMinorGridForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1065
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "AxisMinorGridForm.frx":0624
      Top             =   0
      Width           =   11460
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Minor Grid"
      Height          =   195
      Left            =   60
      TabIndex        =   1
      Top             =   1170
      Value           =   1  'Checked
      Width           =   2955
   End
End
Attribute VB_Name = "AxisMinorGridForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Axis.Bottom.MinorGrid.Visible = Check1.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 4
    Check1_Click
  End With
End Sub
