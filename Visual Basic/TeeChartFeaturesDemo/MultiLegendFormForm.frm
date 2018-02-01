VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MultiLegendFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3435
   ClientTop       =   3405
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5775
      Left            =   0
      TabIndex        =   0
      Top             =   1140
      Width           =   11505
      Base64          =   $"MultiLegendFormForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "MultiLegendFormForm.frx":0432
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show 2nd Legend"
      Height          =   195
      Left            =   210
      TabIndex        =   1
      Top             =   780
      Value           =   1  'Checked
      Width           =   2415
   End
End
Attribute VB_Name = "MultiLegendFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Load()

  With TChart1
    .AddSeries scBar
    .AddSeries scLine
    .Series(0).FillSampleValues 5
    .Series(1).FillSampleValues 5
    .Series(1).Marks.Visible = True
    .Series(1).Marks.Transparent = True
    .Legend.LegendStyle = lsValues
    .Legend.Series = 0
  End With
End Sub

Private Sub TChart1_OnAfterDraw()
  If Check1.Value = 1 Then
    With TChart1.Legend
      .Top = 125
      .Series = 1
      .DrawLegend
      .CustomPosition = False
      .Series = 0
    End With
  End If
End Sub
