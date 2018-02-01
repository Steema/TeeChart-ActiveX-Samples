VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Polar_SmoothForm 
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
      Height          =   5385
      Left            =   0
      TabIndex        =   5
      Top             =   1530
      Width           =   11505
      Base64          =   $"Polar_SmoothForm.frx":0000
   End
   Begin VB.Frame Frame1 
      Caption         =   "Smoothing Options"
      Height          =   735
      Left            =   3375
      TabIndex        =   3
      Top             =   720
      Width           =   2175
      Begin VB.CheckBox Check3 
         Caption         =   "Interpolate"
         Height          =   285
         Left            =   360
         TabIndex        =   4
         Top             =   315
         Value           =   1  'Checked
         Width           =   1455
      End
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Smooth Polar"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1155
      Value           =   1  'Checked
      Width           =   2535
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Original Polar"
      Height          =   195
      Left            =   360
      TabIndex        =   1
      Top             =   855
      Value           =   1  'Checked
      Width           =   2535
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Polar_SmoothForm.frx":0958
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Polar_SmoothForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(1).Active = Check1.Value
End Sub

Private Sub Check2_Click()
    TChart1.Series(0).Active = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Series(0).FunctionType.asSmoothing.Interpolate = Check3.Value
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .Legend.Alignment = laBottom
    .Legend.TopPos = 0
    .Legend.LegendStyle = lsSeries
    With .Series(1)
      .FillSampleValues (25)
      .Pen.Width = 2
      .asPolar.Pointer.HorizontalSize = 2
      .asPolar.Pointer.VerticalSize = 2
    End With
    With .Series(0)
      .SetFunction tfSmoothing
      .DataSource = TChart1.Series(1)
      .FunctionType.asSmoothing.Factor = 7
      .asPolar.Pointer.Visible = False
      .Pen.Width = 3
      .Pen.Color = vbCyan
      With .asPolar
      .Brush.Style = bsCrossSmall
      .Brush.Color = vbCyan
      .CircleGradient.StartColor = &H8000000F
      .CircleGradient.MidColor = vbWhite
      .CircleGradient.EndColor = &H8000000F
      .CircleGradient.Visible = True
      End With
    End With
End With
End Sub


Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
