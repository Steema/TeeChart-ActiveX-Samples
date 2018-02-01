VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ArrowPercent 
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
      Height          =   5355
      Left            =   0
      TabIndex        =   1
      Top             =   1560
      Width           =   11505
      Base64          =   $"Series_ArrowPercent.frx":0000
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1380
      TabIndex        =   2
      Top             =   1170
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   1800
      Max             =   1
      Min             =   100
      TabIndex        =   4
      Top             =   1170
      Value           =   14
      Width           =   255
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ArrowPercent.frx":0660
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label ArrowPercent 
      AutoSize        =   -1  'True
      Caption         =   "Arrow Percent: "
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1200
      Width           =   1095
   End
End
Attribute VB_Name = "Series_ArrowPercent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Series(0).asArrow.ArrowWidth = 50
  TChart1.Series(0).asArrow.ArrowHeight = 50
  Text2.Text = Str$(TChart1.Series(0).asArrow.ArrowPercent)
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
    MsgBox "Please insert a numeric value", , "Arrow Percent"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Arrow Percent"
    Else
      TChart1.Series(0).asArrow.ArrowPercent = val(Text2.Text)
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
