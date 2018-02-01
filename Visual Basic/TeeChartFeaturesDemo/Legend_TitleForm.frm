VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_TitleForm 
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
      Height          =   5625
      Left            =   0
      TabIndex        =   0
      Top             =   1290
      Width           =   11505
      Base64          =   $"Legend_TitleForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Legend Title"
      Height          =   195
      Left            =   180
      TabIndex        =   3
      Top             =   900
      Value           =   1  'Checked
      Width           =   2220
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   750
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Legend_TitleForm.frx":07A0
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Legend Title properties.."
      Height          =   345
      Left            =   2835
      TabIndex        =   1
      Top             =   810
      Width           =   2910
   End
End
Attribute VB_Name = "Legend_TitleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Legend.Title.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
    TChart1.Legend.ShowEditorLegend
End Sub

Private Sub Form_Load()
    With TChart1
        .Series(0).FillSampleValues (8)
        .Legend.Title.Text.Add "Values"
    End With
End Sub
