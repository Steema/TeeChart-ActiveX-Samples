VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SeriesBandStairs 
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
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   405
      Left            =   3630
      TabIndex        =   4
      Top             =   1260
      Width           =   1185
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Series&2 Stairs"
      Height          =   285
      Left            =   1770
      TabIndex        =   3
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Series&1 Stairs"
      Height          =   285
      Left            =   150
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Tool_SeriesBandStairs.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool_SeriesBandStairs.frx":120A
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Tool_SeriesBandStairs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asLine.Stairs = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(1).asLine.Stairs = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .AddSeries scLine
    .AddSeries scLine
    .Series(0).FillSampleValues
    .Series(1).FillSampleValues
    .Series(0).asLine.Stairs = True
    .Series(1).asLine.Stairs = True
    
    .Tools.Add tcSeriesBand
    .Tools.Items(0).asSeriesBand.Series = .Series(0)
    .Tools.Items(0).asSeriesBand.Series2 = .Series(1)
    .Tools.Items(0).asSeriesBand.Brush.BackColor = RGB(126, 93, 65)
    .Tools.Items(0).asSeriesBand.Transparency = 20
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
