VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tools_DrawLineDraggedForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3615
   ClientTop       =   3225
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"Tools_DrawLineDraggedForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tools_DrawLineDraggedForm.frx":028C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      Caption         =   "Triggered Line event:"
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   1260
      Width           =   1575
   End
   Begin VB.Label Label3 
      Caption         =   "Cursor position:"
      Height          =   255
      Left            =   420
      TabIndex        =   4
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "..."
      Height          =   255
      Left            =   1620
      TabIndex        =   3
      Top             =   1260
      Width           =   3915
   End
   Begin VB.Label Label1 
      Caption         =   "..."
      Height          =   195
      Left            =   1620
      TabIndex        =   2
      Top             =   960
      Width           =   5355
   End
End
Attribute VB_Name = "Tools_DrawLineDraggedForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
 TChart1.Series(0).FillSampleValues 7
End Sub

Private Sub TChart1_OnCursorToolChange(ByVal Tool As Long, ByVal X As Long, ByVal Y As Long, ByVal XVal As Double, ByVal YVal As Double, ByVal Series As Long, ByVal ValueIndex As Long)
  Label1.Caption = "X pixel: " & X & ", Y pixel: " & Y & ", XValue: " & Format(XVal, "#.00") & ", YValue: " & Format(YVal, "#.00")
End Sub

Private Sub TChart1_OnDrawLineToolDraggedLine()
  Label2.Caption = "Line Dragged"
End Sub

Private Sub TChart1_OnDrawLineToolLineDrag()
  Label2.Caption = "Line Drag"
End Sub

Private Sub TChart1_OnDrawLineToolNewLine()
  Label2.Caption = "NewLine"
End Sub

Private Sub TChart1_OnDrawLineToolSelectLine()
  Label2.Caption = "Line selected"
End Sub
