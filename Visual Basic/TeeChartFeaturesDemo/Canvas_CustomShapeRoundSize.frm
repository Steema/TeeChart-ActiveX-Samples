VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Canvas_CustomShapeRoundSize 
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
      Left            =   1650
      Max             =   0
      Min             =   100
      TabIndex        =   4
      Top             =   1080
      Value           =   15
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1170
      TabIndex        =   3
      Text            =   "15"
      Top             =   1080
      Width           =   465
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"Canvas_CustomShapeRoundSize.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Canvas_CustomShapeRoundSize.frx":0640
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Round Size:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1110
      Width           =   870
   End
End
Attribute VB_Name = "Canvas_CustomShapeRoundSize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  With TChart1.Series(0).Marks
    .Transparent = False
    .Pen.Visible = True
    .ShapeStyle = fosRoundRectangle
    .RoundSize = VScroll1.Value
  End With
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Round Size"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Round Size"
    Else
      TChart1.Series(0).Marks.RoundSize = val(Text2.Text)
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

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
