VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_AddRemoveEvents 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Remove Last Series"
      Height          =   345
      Left            =   2340
      TabIndex        =   3
      Top             =   1170
      Width           =   1995
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add New LineSeries"
      Height          =   345
      Left            =   180
      TabIndex        =   2
      Top             =   1170
      Width           =   2025
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11460
      Base64          =   $"Series_AddRemoveEvents.frx":0000
      Begin TeeChart.TeePreviewer TeePreviewer1 
         Left            =   5520
         OleObjectBlob   =   "Series_AddRemoveEvents.frx":0174
         Top             =   120
      End
      Begin TeeChart.TeeEditor TeeEditor1 
         Left            =   5880
         OleObjectBlob   =   "Series_AddRemoveEvents.frx":01A3
         Top             =   120
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_AddRemoveEvents.frx":01FF
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Series_AddRemoveEvents"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.AddSeries scBar
End Sub

Private Sub Command2_Click()
  If TChart1.SeriesCount < 1 Then
    MsgBox "There aren't Series to remove!", , "RemoveSeries"
  Else
    TChart1.RemoveSeries TChart1.SeriesCount - 1
  End If
End Sub

Private Sub TChart1_OnAddSeries(ByVal SeriesIndex As Long)
Dim Color As Long
  TChart1.Header.Caption = "Added Series named : " + TChart1.Series(SeriesIndex).Name
  Color = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
  TChart1.Panel.Gradient.StartColor = Color
End Sub

Private Sub TChart1_OnRemoveSeries(ByVal SeriesIndex As Long)
Dim Color As Long
'  TChart1.Header.Caption = "Removed Series named : " + TChart1.Series(SeriesIndex).Name
  Color = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
  TChart1.Panel.Gradient.StartColor = Color
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
