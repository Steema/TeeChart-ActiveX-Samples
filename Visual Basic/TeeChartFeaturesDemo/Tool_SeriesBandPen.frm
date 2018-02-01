VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SeriesBandPen 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   3240
      TabIndex        =   4
      Top             =   1200
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw Behind Series"
      Height          =   195
      Left            =   1320
      TabIndex        =   3
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Pen..."
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   975
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool_SeriesBandPen.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_SeriesBandPen.frx":050C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_SeriesBandPen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asSeriesBand.DrawBehindSeries = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).asSeriesBand.Pen.ShowEditor
End Sub

Private Sub Command2_Click()
TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scLine
  TChart1.AddSeries scLine
  
  TChart1.Series(0).FillSampleValues (10)
  TChart1.Series(1).FillSampleValues (10)
  
  TChart1.Series(0).Color = RGB(130, 155, 254)
  TChart1.Series(1).Color = RGB(252, 209, 36)
  
  TChart1.Tools.Add tcSeriesBand
  
  With TChart1.Tools.Items(0).asSeriesBand
    .Series = TChart1.Series(0)
    .Series2 = TChart1.Series(1)
    .Gradient.EndColor = RGB(128, 0, 128)
    .Gradient.Visible = True
    .Pen.Visible = True
    .Pen.Width = 5
    .Pen.Color = vbRed
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
