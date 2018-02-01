VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolExtraLegendForm 
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
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"ToolExtraLegendForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Align"
      Height          =   345
      Left            =   4440
      TabIndex        =   4
      Top             =   1245
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit extra legend..."
      Height          =   345
      Left            =   2280
      TabIndex        =   3
      Top             =   1245
      Width           =   1815
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show extra legend"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ToolExtraLegendForm.frx":0488
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ToolExtraLegendForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).asExtraLegend.Legend.ShowEditorLegend
End Sub

Private Sub Command2_Click()
  ' Customize extra legend position.
  ' Align with default normal legend.
  With TChart1.Tools.Items(0).asExtraLegend.Legend
    .CustomPosition = True
    .Left = TChart1.Legend.Left
    .Top = TChart1.Legend.ShapeBounds.Bottom + 10
  End With
End Sub

Private Sub Check1_Click()
  TChart1.Tools.Items(0).Active = Check1.Value = 1
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 5
  TChart1.Series(1).FillSampleValues 5

  TChart1.Tools.Add tcExtraLegend
  TChart1.Tools.Items(0).asExtraLegend.Series = TChart1.Series(1)

  ' Cosmetic...
  With TChart1.Tools.Items(0).asExtraLegend.Legend
    .Shadow.Transparency = 70
    .CustomPosition = True
    .Left = 50
    .Top = 50
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
