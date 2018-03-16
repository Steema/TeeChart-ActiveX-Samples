VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- Dragging points example"
   ClientHeight    =   4920
   ClientLeft      =   3045
   ClientTop       =   3165
   ClientWidth     =   7815
   LinkTopic       =   "Form1"
   ScaleHeight     =   4920
   ScaleWidth      =   7815
   Begin TeeChart.TChart TChart1 
      Height          =   4275
      Left            =   60
      OleObjectBlob   =   "Form Drag.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   7695
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Form Drag.frx":0656
      Left            =   3420
      List            =   "Form Drag.frx":0663
      Style           =   2  'Dropdown List
      TabIndex        =   6
      ToolTipText     =   "Choose a Bar style..."
      Top             =   4500
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&About..."
      Height          =   375
      Left            =   5220
      TabIndex        =   5
      Top             =   4500
      Width           =   1095
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   15
      Left            =   1740
      Max             =   100
      Min             =   1
      SmallChange     =   5
      TabIndex        =   4
      Top             =   4560
      Value           =   1
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View &3D"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   4500
      Value           =   1  'Checked
      Width           =   915
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   375
      Left            =   6540
      TabIndex        =   1
      Top             =   4500
      Width           =   1155
   End
   Begin VB.Label Label1 
      Caption         =   "3D %:"
      Height          =   255
      Left            =   1200
      TabIndex        =   3
      Top             =   4560
      Width           =   495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim TheClickedPyramid As Integer

Private Sub Check1_Click()
 ' switch 2D / 3D view...
 TChart1.Aspect.View3D = Check1.Value
 ' enable scroll-bar only in 3D...
 HScroll1.Enabled = Check1.Value
End Sub

Private Sub Combo1_Click()
' change the bar style when combo1 changes...
 TChart1.Series(0).asBar.BarStyle = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
 End
End Sub

Private Sub Command2_Click()
 TChart1.AboutBox
End Sub

Private Sub Form_Load()
' some sample data for the pyramids...
 TChart1.Series(0).FillSampleValues 8
 
' change pyramids cursor...
 TChart1.Series(0).Cursor = 2020
 
' do not allow zoom and scroll
 TChart1.Zoom.Enable = False
 TChart1.Scroll.Enable = pmNone
 
' set temporary variables...
 TheClickedPyramid = -1
 TheOriginalValue = 0
 
' set starting scroll-bar position...
 HScroll1.Value = TChart1.Aspect.Chart3DPercent
 
' set starting combo value
 Combo1.ListIndex = 1
End Sub

Private Sub HScroll1_Change()
 TChart1.Aspect.Chart3DPercent = HScroll1.Value
End Sub

Private Sub TChart1_OnAfterDraw()
' Custom draw a white circle around the clicked pyramid...
Dim X, Y As Integer
  If TheClickedPyramid <> -1 Then
     With TChart1.Canvas
       .Pen.Color = vbWhite
       .Pen.Width = 1
       .Pen.Style = psDot
       .Brush.Style = bsClear
     End With
     With TChart1.Series(0)
       X = .CalcXPos(TheClickedPyramid)
       Y = .CalcYPos(TheClickedPyramid)
       TChart1.Canvas.Ellipse X, Y, X + 40, Y + 40
     End With
  End If
End Sub

Private Sub TChart1_OnMouseDown(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
 ' calculate if mouse has clicked a Pyramid...
 TheClickedPyramid = TChart1.Series(0).Clicked(X, Y)
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
 ' drag the pyramid !!!
  If TheClickedPyramid <> -1 Then
     With TChart1.Series(0)
      .PointValue(TheClickedPyramid) = .YScreenToValue(Y)
     End With
  End If
End Sub

Private Sub TChart1_OnMouseUp(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
' when releasing mouse, stop dragging...
 TheClickedPyramid = -1
 TChart1.Repaint
End Sub



