VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolSeriesBandForm 
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
      Height          =   5955
      Left            =   0
      TabIndex        =   2
      Top             =   960
      Width           =   11505
      Base64          =   $"ToolSeriesBandForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw Behind Series"
      Height          =   240
      Left            =   90
      TabIndex        =   1
      Top             =   585
      Value           =   1  'Checked
      Width           =   3930
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   480
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ToolSeriesBandForm.frx":00D4
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ToolSeriesBandForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
TChart1.Tools.Items(0).asSeriesBand.DrawBehindSeries = Check1.Value
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scLine
    .AddSeries scLine
    .Series(0).FillSampleValues (10)
    .Series(1).FillSampleValues (10)
    .Tools.Add tcSeriesBand
    .Tools.Items(0).asSeriesBand.Series = .Series(0)
    .Tools.Items(0).asSeriesBand.Series2 = .Series(1)
    .Tools.Items(0).asSeriesBand.Brush.Color = vbYellow
    .Tools.Items(0).asSeriesBand.Transparency = 50
End With
End Sub

