VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form HTMLTextFormat 
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
   Begin TeeChart.TChart TChart1 
      Height          =   4965
      Left            =   0
      TabIndex        =   4
      Top             =   1950
      Width           =   11505
      Base64          =   $"HTMLTextFormat.frx":0000
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Us&e HTML text for Rectangle Tool with custom format"
      Height          =   285
      Left            =   150
      TabIndex        =   0
      Top             =   1530
      Value           =   1  'Checked
      Width           =   5145
   End
   Begin VB.CheckBox Check2 
      Caption         =   "U&se HTML text for Axis Labels with custom format"
      Height          =   285
      Left            =   150
      TabIndex        =   3
      Top             =   1200
      Width           =   5265
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Use HTML text for Marks with custom format"
      Height          =   285
      Left            =   150
      TabIndex        =   2
      Top             =   870
      Width           =   5145
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "HTMLTextFormat.frx":0BA4
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "HTMLTextFormat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OldLabels1() As String
Dim OldLabels2() As String


Private Sub Check1_Click()
  If Check1.Value Then
    TChart1.Series(0).Marks.TextFormat = ttfHtml
  Else
    TChart1.Series(0).Marks.TextFormat = ttfNormal
  End If
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
    AddCustomLabels
  Else
    TChart1.Axis.Bottom.Labels.Clear
    For i = 0 To UBound(OldLabels1) - 1
       TChart1.Axis.Bottom.Labels.Add OldLabels1(i), OldLabels2(i)
    Next i
    TChart1.Repaint
  End If
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(0).Active = Check3.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (5)
    .Tools.Items(0).asRectangle.Shape.TextFormat = ttfHtml
    .Tools.Items(0).asRectangle.Text = "<b>My custom HTML Text</b><br><FONT color=BLUE size=18>Other Text"
    X = 2
    .Tools.Items(0).asRectangle.Shape.Width = TChart1.MultiLineTextWidth(.Tools.Items(0).asRectangle.Text, X, ttfHtml) + 10
  End With
End Sub

Private Sub TChart1_OnGetSeriesMark(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, MarkText As String)
  If TChart1.Series(SeriesIndex).Marks.TextFormat = ttfHtml Then
    If ValueIndex = 1 Then
      MarkText = "<b>" & MarkText & "</b><br>" & _
        "<FONT size=10>HTML Format<br>" & _
        "<b><FONT color=RED size=8>Custom</b>"
    Else
      MarkText = "<b>" & MarkText & "</b><br>" & _
        "<FONT color=Blue size=8>HTML Format<br>" & _
        "<FONT color=Green size=9>Custom"
    End If
  End If
End Sub

Private Sub AddCustomLabels()
  ReDim OldLabels1(5)
  ReDim OldLabels2(5)

  With TChart1.Axis.Bottom
    ' Save old labels
    For t = 0 To .Labels.Count - 1
      OldLabels1(t) = .Labels.Item(t).Value
      OldLabels2(t) = .Labels.Item(t).Text
    Next t
    
    .Labels.Clear ' remove all custom labels

    ' add custom labels
    .Labels.Add 0, "<FONT color=Blue size=15>1st"
    .Labels.Item(0).Format.TextFormat = ttfHtml

    .Labels.Add 1, "<b><FONT color=BLUE size=15>2st</b>"
    .Labels.Item(1).Format.TextFormat = ttfHtml
    
    .Labels.Add 2, "<b><FONT color=GREEN size=8>Third...</b>"
    .Labels.Item(2).Format.TextFormat = ttfHtml
    .Labels.Item(2).Format.Transparent = True
    .Labels.Item(2).Format.Transparency = 60
    
    For t = 0 To 1
      .Labels.Add OldLabels1(t), OldLabels2(t)
    Next t
  End With
End Sub


Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
