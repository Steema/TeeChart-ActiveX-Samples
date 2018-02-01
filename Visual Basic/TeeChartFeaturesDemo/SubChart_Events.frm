VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SubChart_Events 
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
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   525
      Left            =   60
      OleObjectBlob   =   "SubChart_Events.frx":0000
      TabIndex        =   2
      Top             =   1170
      Width           =   11475
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"SubChart_Events.frx":004C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SubChart_Events.frx":24D2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SubChart_Events"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues
  End With
End Sub

Private Sub TChart1_OnSubChartToolDragged()
  setTitle ("Subchart dragged!")
End Sub

Private Sub TChart1_OnSubChartToolDragging()
  setTitle ("Dragging subchart!")
End Sub

Private Sub TChart1_OnSubChartToolResized()
  setTitle ("Subchart resized!")
End Sub

Private Sub TChart1_OnSubChartToolResizing()
  setTitle ("Resizing subchart!")
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub setTitle(TitleText As String)
'TODO  With TChart1.Tools.Items(0).asSubChart.Charts.Items(0).Chart.Header
'    .Visible = True
'    .Text.Clear
'    .Text.Add TitleText
'  End With
   TChart1.Header.Font.Color = vbBlack
   TChart1.Header.Visible = True
   TChart1.Header.Caption = TitleText
End Sub

