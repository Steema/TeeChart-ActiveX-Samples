VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Pie_GradientForm 
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
      Height          =   5640
      Left            =   0
      TabIndex        =   0
      Top             =   1275
      Width           =   11505
      Base64          =   $"Pie_GradientForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Gradient"
      Height          =   195
      Left            =   2040
      TabIndex        =   3
      Top             =   915
      Value           =   1  'Checked
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   750
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Pie_GradientForm.frx":0AF6
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Gradient"
      Height          =   345
      Left            =   195
      TabIndex        =   1
      Top             =   840
      Width           =   1635
   End
End
Attribute VB_Name = "Pie_GradientForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Series(0).asDonut.Gradient.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
    TChart1.Series(0).asDonut.Gradient.ShowEditor True
End Sub

Private Sub Form_Load()
    TChart1.Series(0).FillSampleValues (5)
    TChart1.Series(0).asDonut.Gradient.Visible = True
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
