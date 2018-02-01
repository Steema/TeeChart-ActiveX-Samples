VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_RadarForm 
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
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"SeriesType_RadarForm.frx":0000
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   510
      Left            =   0
      OleObjectBlob   =   "SeriesType_RadarForm.frx":0450
      TabIndex        =   6
      Top             =   1170
      Width           =   7035
   End
   Begin VB.CheckBox Check4 
      Caption         =   "Show Axis"
      Height          =   240
      Left            =   9240
      TabIndex        =   5
      Top             =   885
      Value           =   1  'Checked
      Width           =   1905
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Show Lines"
      Height          =   240
      Left            =   9240
      TabIndex        =   4
      Top             =   615
      Value           =   1  'Checked
      Width           =   1905
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Labels"
      Height          =   240
      Left            =   9240
      TabIndex        =   3
      Top             =   345
      Value           =   1  'Checked
      Width           =   1905
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Squared"
      Height          =   240
      Left            =   9240
      TabIndex        =   2
      Top             =   75
      Value           =   1  'Checked
      Width           =   1905
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesType_RadarForm.frx":049C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesType_RadarForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asRadar.Circled = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asRadar.CircleLabels.Visible = Check2.Value
End Sub

Private Sub Check3_Click()
With TChart1
  .Series(0).Pen.Visible = Check3.Value
  .Series(1).Pen.Visible = Check3.Value
  .Series(2).Pen.Visible = Check3.Value
End With
End Sub

Private Sub Check4_Click()
  TChart1.Axis.Right.Visible = Check4.Value
End Sub

Private Sub Form_Load()
With TChart1
    For i = 0 To 2
        .AddSeries scRadar
        .Series(i).FillSampleValues (5)
    Next i
End With
TeeCommander1.Chart = TChart1
Check1_Click
Check2_Click
Check3_Click
Check4_Click
End Sub
