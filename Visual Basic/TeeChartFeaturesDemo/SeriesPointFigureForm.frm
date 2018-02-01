VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesPointFigureForm 
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
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"SeriesPointFigureForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   495
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
      Text            =   "SeriesPointFigureForm.frx":097E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesPointFigureForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 40
  TChart1.Series(0).asPointFigure.BoxSize = 5
End Sub
