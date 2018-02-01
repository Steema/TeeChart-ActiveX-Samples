VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form PolarLabelsInsideForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3210
   ClientTop       =   2700
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox Check1 
      Caption         =   "Circle labels inside"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1200
      Value           =   1  'Checked
      Width           =   2235
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"PolarLabelsInsideForm.frx":0000
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PolarLabelsInsideForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asPolar.CircleLabelsInside = Check1.Value
End Sub

Private Sub Form_Load()
  Label1.Caption = "Polar (and Clock, and Radar) series can now display labels inside the circle." _
  & Chr(13) & Chr(13) _
  & "Example: TChart1.Series(0).asPolar.CircleLabelsInside = True"
  With TChart1
    .Aspect.View3D = False
    .Header.Visible = False
    .Axis.Visible = False
    .AddSeries scPolar
    .Series(0).FillSampleValues 9
    With .Series(0).asPolar
      .Circled = True
      .AngleIncrement = 30
      .CircleLabels.Font.Size = 10
      .CircleLabels.Font.Color = vbBlue
      .CircleLabels.Visible = True
      .CircleLabelsInside = True
    End With
    .Hover.Visible = False
  End With
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.ShowEditor
  TChart1.StopMouse
End Sub
