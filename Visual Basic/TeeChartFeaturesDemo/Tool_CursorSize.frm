VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_CursorSize 
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
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   3840
      Max             =   0
      Min             =   100
      TabIndex        =   5
      Top             =   1200
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   3360
      TabIndex        =   4
      Text            =   "0"
      Top             =   1200
      Width           =   495
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   1560
      Max             =   0
      Min             =   100
      TabIndex        =   3
      Top             =   1200
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1080
      TabIndex        =   2
      Text            =   "10"
      Top             =   1200
      Width           =   495
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Tool_CursorSize.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_CursorSize.frx":0B92
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Horiz. Size:"
      Height          =   195
      Left            =   2520
      TabIndex        =   7
      Top             =   1245
      Width           =   795
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Vert. Size:"
      Height          =   195
      Left            =   240
      TabIndex        =   6
      Top             =   1245
      Width           =   720
   End
End
Attribute VB_Name = "Tool_CursorSize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Vert. Size"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Vert. Size"
    Else
      TChart1.Tools.Items(0).asTeeCursor.VertSize = val(Text2.Text)
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

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Horiz. Size"
  Else
    If (val(Text3.Text) > 100 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Horiz. Size"
    Else
      TChart1.Tools.Items(0).asTeeCursor.HorizSize = val(Text3.Text)
      VScroll2.Value = val(Text3.Text)
    End If
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text3_Confirm
End Sub
