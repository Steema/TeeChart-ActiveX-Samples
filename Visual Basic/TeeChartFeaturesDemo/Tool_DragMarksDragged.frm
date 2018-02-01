VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_DragMarksDragged 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   1
      Top             =   1530
      Width           =   11505
      Base64          =   $"Tool_DragMarksDragged.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_DragMarksDragged.frx":053A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Dragging Mark Pos :"
      Height          =   195
      Left            =   3120
      TabIndex        =   3
      Top             =   1200
      Width           =   1455
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Mark index :"
      Height          =   195
      Left            =   600
      TabIndex        =   2
      Top             =   1200
      Width           =   870
   End
End
Attribute VB_Name = "Tool_DragMarksDragged"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Series(0).Marks.Transparent = False
End Sub

Private Sub TChart1_OnDragMarksToolDraggedMark(ByVal Index As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Label1.Caption = "Mark index : " + Format(Index) + "  dragged"
End Sub

Private Sub TChart1_OnDragMarksToolDraggingMark(ByVal Index As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Label2.Caption = "Dragging Mark Pos : " + FormatNumber(TChart1.Series(0).XScreenToValue(X)) + " / " + FormatNumber(TChart1.Series(0).YScreenToValue(Y))
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
