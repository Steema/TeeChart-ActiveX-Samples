VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CursorToolDemoForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3345
   ClientTop       =   2505
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   6195
      Left            =   0
      TabIndex        =   0
      Top             =   720
      Width           =   11505
      Base64          =   $"CursorToolDemoForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CursorToolDemoForm.frx":0606
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "CursorToolDemoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
Dim tmpIndex
  With TChart1
    .Series(0).FillSampleValues 20
    .Series(1).FillSampleValues 20
    With .Tools
      .Items(0).asColorLine.Value = TChart1.Series(0).YValues.Minimum
      ' To add a cursor by code example:
      '    tmpIndex = .Add(tcCursor)
      '    .Items(tmpIndex).asTeeCursor.Series = 0 ' Uses Seriesindex
      '    .Items(tmpIndex).asTeeCursor.FollowMouse = True
      '    .Items(tmpIndex).asTeeCursor.Pen.Style = psDashDot
      '    .Items(tmpIndex).asTeeCursor.Pen.Color = vbWhite
      '    tmpIndex = .Add(tcCursor)
      '    .Items(tmpIndex).asTeeCursor.Series = 1
      '    .Items(tmpIndex).asTeeCursor.FollowMouse = True
      '    .Items(tmpIndex).asTeeCursor.Pen.Style = psDashDot
    End With
    .Axis.Left.Minimum = 0
  End With
End Sub

Private Sub Text1_Click()
  TChart1.ShowEditor
End Sub
