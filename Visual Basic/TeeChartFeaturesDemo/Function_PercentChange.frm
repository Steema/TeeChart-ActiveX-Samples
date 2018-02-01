VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Function_PercentChange 
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
      Caption         =   "&Random !"
      Height          =   375
      Left            =   135
      TabIndex        =   2
      Top             =   1260
      Width           =   1185
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Function_PercentChange.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_PercentChange.frx":0F54
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Function_PercentChange"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
 TChart1.Series(0).Clear
 TChart1.Series(0).FillSampleValues 4
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scArea
    With .Series(0).asArea
      .Smoothed = True
      .AreaPen.Visible = False
      .LinePen.Visible = False
      .Gradient.Visible = True
      .AreaChartBrush.Gradient.Visible = True
    End With
  
    Command1_Click
    
    .AddSeries scLine
    With .Series(1)
      .SetFunction tfPercentChange
      .Pen.Visible = False
      .DataSource = "Series0"
      .Marks.Visible = True
      .Marks.Angle = 90
      .Marks.ArrowLength = 30
      .Marks.Font.Color = vbRed
      .Title = "Percentage change"
      .asLine.Gradient.Visible = True
      .asLine.Gradient.EndColor = vbBlue
      .Marks.Transparent = True
      .Marks.Arrow.Visible = False
    End With
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
