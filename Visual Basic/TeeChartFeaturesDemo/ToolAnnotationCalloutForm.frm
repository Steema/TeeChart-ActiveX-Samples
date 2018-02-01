VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form ToolAnnotationCalloutForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
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
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"ToolAnnotationCalloutForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Border..."
      Height          =   345
      Left            =   1800
      TabIndex        =   3
      Top             =   1245
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   1245
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Follow mouse"
      Height          =   195
      Left            =   3600
      TabIndex        =   4
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ToolAnnotationCalloutForm.frx":0DBE
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ToolAnnotationCalloutForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstTime As Boolean

Private Sub SetCallout(ByVal AIndex As Integer)
  ' Change annotation text
  TChart1.Tools.Items(0).asAnnotation.Text = "Point: " + Str(AIndex) + Chr(13) + _
                   "Value: " + TChart1.Series(0).ValueMarkText(AIndex)

  ' Re-position annotation callout
  With TChart1.Tools.Items(0).asAnnotation.Callout
    .Visible = True
    .XPosition = TChart1.Series(0).CalcXPos(AIndex)
    .YPosition = TChart1.Series(0).CalcYPos(AIndex)
    .ZPosition = 0
  End With
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).asAnnotation.Callout.Arrow.ShowEditor
End Sub

Private Sub Check1_Click()
  TChart1.Header.Text.Clear
  
  If Check1.Value = 1 Then
    TChart1.Header.Text.Add "Move the mouse over points !"
    TChart1.Series(0).Cursor = 0
  Else
    TChart1.Header.Text.Add "Click a point !"
    TChart1.Series(0).Cursor = -21
  End If
End Sub

Private Sub Form_Activate()
  If FirstTime Then
    FirstTime = False
    ' force a first-time chart redrawing, to obtain valid
    ' coordinates (Series(0).CalcXPos, etc).
    TChart1.Repaint
    ' Start positioning annotation callout at point index 5
    SetCallout 5
  End If
End Sub

Private Sub Form_Load()
  FirstTime = True
  TChart1.Series(0).FillSampleValues (25)
  
  TChart1.Tools.Items(0).asAnnotation.Callout.Arrow.Visible = True
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  If Check1.Value = 0 Then SetCallout ValueIndex
End Sub

Function TeeDistance(ByVal X As Integer, ByVal Y As Integer) As Double
  TeeDistance = Sqr(X ^ 2 + Y ^ 2)
End Function

' Returns Series point index that is nearest to xy position.
Function NearestPoint(ByVal X As Long, ByVal Y As Long) As Long
Dim Difference As Long, tmpDif As Long, i As Long, res As Long
  res = -1
  Difference = -1
  For i = 0 To TChart1.Series(0).Count - 1
    tmpDif = Round(TeeDistance(TChart1.Series(0).CalcXPos(i) - X, _
                               TChart1.Series(0).CalcYPos(i) - Y))

    If (Difference = -1) Or (tmpDif < Difference) Then
      Difference = tmpDif
      res = i
    End If
  Next i
  NearestPoint = res
End Function

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim i As Integer
  i = -1
  If Check1.Value = 1 Then ' follow mouse
    ' Locate nearest point to mouse...
    i = NearestPoint(X, Y)
  End If
  If i <> -1 Then SetCallout i ' set annotation callout
End Sub
