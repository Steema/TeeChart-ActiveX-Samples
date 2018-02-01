VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SubChartEvents 
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
      Caption         =   "&Edit Tool"
      Height          =   435
      Left            =   120
      TabIndex        =   2
      Top             =   1230
      Width           =   1605
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Tool_SubChartEvents.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "Tool_SubChartEvents.frx":14A6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_SubChartEvents"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Tools.Add tcSubChart
    With .Tools.Items(0).asSubChart
      .Charts.AddChart "Chart2"
      With .Charts.Items(0)
        '.Chart.Aspect.View3D = False
       ' .Chart.Axis.Visible = False
     '   .Chart.Walls.Visible = False
'        .Chart.Width = 360
'        .Chart.Height = 260
'        .Chart.Left = 335
'        .AllowResize = True
'        .AllowDrag = True

.Chart.Panel.Gradient.Visible = True
        '.Chart.AddSeries scWorld
'        .Chart.Series(0).asWorld.Map = wmEurope
'        .Chart.Series(0).FillSampleValues
'        .Chart.Series(0).asWorld.UseColorRange = False
'        .Chart.Series(0).asWorld.UsePalette = True
'        .Chart.Series(0).asWorld.PaletteStyle = psRainbow
      End With
    End With
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
