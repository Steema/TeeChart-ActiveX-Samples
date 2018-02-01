VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_DrawLineClickedTolerance 
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
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   2040
      Max             =   0
      Min             =   100
      TabIndex        =   5
      Top             =   1200
      Value           =   5
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1560
      TabIndex        =   4
      Text            =   "5"
      Top             =   1200
      Width           =   495
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Enable draw"
      Height          =   255
      Left            =   2880
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Tool_DrawLineClickedTolerance.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_DrawLineClickedTolerance.frx":125C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Clicked tolerance:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1245
      Width           =   1275
   End
End
Attribute VB_Name = "Tool_DrawLineClickedTolerance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asDrawLine.EnableDraw = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcDrawLine
  
  With TChart1.Tools.Items(0).asDrawLine
    .Series = TChart1.Series(0)
    .EnableDraw = False
    .Pen.Width = 4
    .Pen.Color = RGB(0, 0, 128)
    .AddLine TChart1.Series(0).asCandle.DateValues.Value(8), TChart1.Series(0).asCandle.HighValues.Value(1), TChart1.Series(0).asCandle.DateValues.Value(20), TChart1.Series(0).asCandle.HighValues.Value(20)
    .ClickTolerance = 5
  End With
End Sub

Private Sub TChart1_OnMouseDown(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim i As Integer
Dim line As Long

  With TChart1.Tools.Items(0).asDrawLine
    For i = 0 To (.Lines.Count - 1)
      .Lines.Items(i).Pen.Color = vbBlue
    Next i

    line = .ClickedTolerance(X, Y, val(Text2.Text))
  
    If line <> -1 Then
      TChart1.Header.Text.Item(0) = "DrawLine index : " + Format(line) + " Clicked !"
      .Lines.Items(line).Pen.Color = vbRed
    End If
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Click tolerance"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Click tolerance"
    Else
      TChart1.Tools.Items(0).asDrawLine.ClickTolerance = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
