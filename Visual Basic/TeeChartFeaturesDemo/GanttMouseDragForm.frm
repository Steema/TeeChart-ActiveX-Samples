VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form GanttMouseDragForm 
   BorderStyle     =   0  'None
   Caption         =   "Animate !"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"GanttMouseDragForm.frx":0000
   End
   Begin VB.CommandButton Command4 
      Caption         =   "< >"
      Height          =   375
      Left            =   4110
      TabIndex        =   6
      Top             =   885
      Width           =   495
   End
   Begin VB.CommandButton Command3 
      Caption         =   "> <"
      Height          =   375
      Left            =   3615
      TabIndex        =   5
      Top             =   885
      Width           =   495
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "GanttMouseDragForm.frx":0838
      Left            =   1470
      List            =   "GanttMouseDragForm.frx":0848
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   915
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   ">>"
      Height          =   375
      Left            =   765
      TabIndex        =   3
      Top             =   885
      Width           =   495
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   5040
      Max             =   100
      Min             =   1
      TabIndex        =   7
      Top             =   960
      Value           =   6
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "<<"
      Height          =   375
      Left            =   270
      TabIndex        =   2
      Top             =   885
      Width           =   495
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "GanttMouseDragForm.frx":0876
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   720
      TabIndex        =   8
      Top             =   1320
      Width           =   3375
   End
End
Attribute VB_Name = "GanttMouseDragForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Axis.Bottom.Increment = TChart1.GetDateTimeStep(dtOneDay)
    Case 1: TChart1.Axis.Bottom.Increment = TChart1.GetDateTimeStep(dtOneWeek)
    Case 2: TChart1.Axis.Bottom.Increment = TChart1.GetDateTimeStep(dtHalfMonth)
    Case 3: TChart1.Axis.Bottom.Increment = TChart1.GetDateTimeStep(dtOneMonth)
  End Select
End Sub

Private Sub Command1_Click()
  With TChart1.Axis.Bottom
    .SetMinMax .Minimum - 1, .Maximum - 1
  End With
End Sub

Private Sub Command2_Click()
  With TChart1.Axis.Bottom
    .SetMinMax .Minimum + 1, .Maximum + 1
  End With
End Sub

Private Sub Command3_Click()
  With TChart1.Axis.Bottom
    .SetMinMax .Minimum + 1, .Maximum - 1
  End With
End Sub

Private Sub Command4_Click()
  With TChart1.Axis.Bottom
    .SetMinMax .Minimum - 1, .Maximum + 1
  End With
End Sub

Private Sub Form_Load()
  ' Set 2D
  TChart1.Aspect.View3D = False

  ' Disable automatic sorting by date
  TChart1.Series(0).XValues.Order = loNone

  ' Fill Gantt with sample date-time values:
  With TChart1.Series(0)
    .asGantt.AddGantt DateSerial(2002, 4, 1), DateSerial(2002, 4, 10), 0, "A"
    .asGantt.AddGantt DateSerial(2002, 4, 5), DateSerial(2002, 4, 15), 1, "B"
    .asGantt.AddGantt DateSerial(2002, 4, 2), DateSerial(2002, 4, 8), 2, "C"
    .asGantt.AddGantt DateSerial(2002, 4, 9), DateSerial(2002, 4, 21), 3, "D"

    ' Make marks visible
    .Marks.Visible = True
    .Marks.ShadowSize = 0
    .Marks.Gradient.Visible = True
  End With

  ' Set horizontal bottom axis minimum and maximum
  TChart1.Axis.Bottom.SetMinMax DateSerial(2002, 4, 1), DateSerial(2002, 5, 1)

  ' Set vertical left axis minimum and maximum
  TChart1.Axis.Left.SetMinMax -2, 5
  TChart1.Axis.Left.GridCentered = False

  ' Disable zoom
  TChart1.Zoom.Enable = False

  ' Set horizontal daily Increment for labels and grids:
  TChart1.Axis.Bottom.Increment = TChart1.GetDateTimeStep(dtOneDay)
  TChart1.Axis.Bottom.Labels.Angle = 90
  TChart1.Axis.Bottom.Labels.DateTimeFormat = "dd-mmm"

  ' initialize Gantt Tool:
  TChart1.Tools.Add tcGantt
  TChart1.Tools.Items(0).asGantt.Series = TChart1.Series(0)
  TChart1.Tools.Items(0).Active = True
'  Gantt.OnDragBar:=GanttTool1DragBar;

  Combo1.ListIndex = 0
End Sub

Private Sub HScroll1_Change()
  HScroll1_Scroll
End Sub

Private Sub HScroll1_Scroll()
  TChart1.Series(0).asGantt.Pointer.VerticalSize = HScroll1.Value
End Sub

Private Sub TChart1_OnGanttToolDragBar(ByVal Tool As Long, ByVal GanttBar As Long)
  With TChart1.Tools.Items(0).asGantt.Gantt
    Label1.Caption = FormatDateTime(.StartValues.Value(GanttBar)) + " - " + _
                    FormatDateTime(.EndValues.Value(GanttBar))
  End With
End Sub

Private Sub TChart1_OnGetSeriesMark(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, MarkText As String)
  ' Example, customize Series marks...
  Select Case ValueIndex
    Case 0: MarkText = "John"
    Case 1: MarkText = "Ann"
    Case 2: MarkText = "David"
    Case 3: MarkText = "Carol"
  End Select
End Sub

Private Sub TChart1_OnMouseUp(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Label1.Caption = ""
End Sub

