VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_DrawStyle 
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
   Begin VB.ComboBox Combo2 
      Appearance      =   0  'Flat
      Height          =   315
      ItemData        =   "Series_DrawStyle.frx":0000
      Left            =   3240
      List            =   "Series_DrawStyle.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1080
      Width           =   1275
   End
   Begin VB.ComboBox Combo1 
      Appearance      =   0  'Flat
      Height          =   315
      ItemData        =   "Series_DrawStyle.frx":0004
      Left            =   720
      List            =   "Series_DrawStyle.frx":0006
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1080
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Pen Gradient"
      Height          =   195
      Left            =   4920
      TabIndex        =   2
      Top             =   1140
      Value           =   1  'Checked
      Width           =   1875
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   1
      Top             =   1530
      Width           =   11505
      Base64          =   $"Series_DrawStyle.frx":0008
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   945
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_DrawStyle.frx":125C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Draw Style:"
      Height          =   195
      Left            =   2310
      TabIndex        =   6
      Top             =   1140
      Width           =   810
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Series:"
      Height          =   195
      Left            =   150
      TabIndex        =   3
      Top             =   1140
      Width           =   480
   End
End
Attribute VB_Name = "Series_DrawStyle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).Pen.Fill.Gradient.Visible = Check1.Value
End Sub

Private Sub Combo1_Change()
  If Combo1.ListIndex = 0 Then
    TChart1.ChangeSeriesType 0, asLine
    With TChart1.Series(0).asLine
        .LinePen.Width = 5
        .LinePen.Fill.Gradient.Visible = Check1.Value
        .LinePen.Fill.Gradient.StartColor = vbBlue
        .LinePen.Fill.Gradient.MidColor = vbRed
        .LinePen.Fill.Gradient.EndColor = vbCyan
    End With
  Else
    TChart1.ChangeSeriesType 0, scArea
    With TChart1.Series(0).asArea
        .AreaPen.Visible = False
        .AreaChartBrush.Gradient.Visible = Check1.Value
        .AreaChartBrush.Gradient.StartColor = vbBlue
        .AreaChartBrush.Gradient.MidColor = vbRed
        .AreaChartBrush.Gradient.EndColor = vbCyan
        .AreaChartBrush.Gradient.Direction = gdLeftRight
        .LinePen.Width = 5
        .LinePen.Fill.Gradient.Visible = False
    End With
  End If
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo2_Change()
If TChart1.SeriesCount > 0 Then
  If Combo1.ListIndex = 0 Then
    Select Case Combo2.ListIndex
      Case 0:         TChart1.Series(0).asLine.DrawStyle = dsAll
      Case 1:         TChart1.Series(0).asLine.DrawStyle = dsCurve
      Case 2:         TChart1.Series(0).asLine.DrawStyle = dsSegments
     End Select
  Else: Select Case Combo2.ListIndex
      Case 0:         TChart1.Series(0).asArea.DrawStyle = dsAll
      Case 1:         TChart1.Series(0).asArea.DrawStyle = dsCurve
      Case 2:         TChart1.Series(0).asArea.DrawStyle = dsSegments
     End Select
  End If
 End If
End Sub

Private Sub Combo2_Click()
  Combo2_Change
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scLine
  TChart1.Series(0).FillSampleValues
  Combo1.AddItem "Line"
  Combo1.AddItem "Area"
    
  Combo2.AddItem "dsAll"
  Combo2.AddItem "dsCurve"
  Combo2.AddItem "dsSegments"
  
  Combo1.ListIndex = 1
  Combo2.ListIndex = 1
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

