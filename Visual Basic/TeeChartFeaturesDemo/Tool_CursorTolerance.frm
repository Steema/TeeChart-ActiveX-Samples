VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_CursorTolerance 
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
      Left            =   1800
      Max             =   0
      Min             =   100
      TabIndex        =   6
      Top             =   1200
      Value           =   3
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1320
      TabIndex        =   5
      Text            =   "3"
      Top             =   1200
      Width           =   495
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Follow mouse"
      Height          =   195
      Left            =   4560
      TabIndex        =   3
      Top             =   1200
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Snap"
      Height          =   195
      Left            =   2880
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Tool_CursorTolerance.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_CursorTolerance.frx":0594
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Click tolerance:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1245
      Width           =   1095
   End
End
Attribute VB_Name = "Tool_CursorTolerance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asTeeCursor.Snap = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asTeeCursor.FollowMouse = Check2.Value
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
      TChart1.Tools.Items(0).asTeeCursor.ClickTolerance = val(Text2.Text)
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
