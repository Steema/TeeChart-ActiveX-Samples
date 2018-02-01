VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Marks_ItemText 
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
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   2040
      TabIndex        =   8
      Text            =   "Text3"
      Top             =   1245
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Transparent"
      Height          =   255
      Left            =   5040
      TabIndex        =   7
      Top             =   1265
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Font"
      Height          =   345
      Left            =   3840
      TabIndex        =   6
      Top             =   1230
      Width           =   975
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   255
      Left            =   960
      TabIndex        =   4
      Top             =   1245
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   480
      TabIndex        =   3
      Text            =   "0"
      Top             =   1245
      Width           =   495
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   1
      Top             =   1680
      Width           =   11505
      Base64          =   $"Marks_ItemText.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Marks_ItemText.frx":079C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Text:"
      Height          =   195
      Left            =   1630
      TabIndex        =   5
      Top             =   1290
      Width           =   360
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Item:"
      Height          =   195
      Left            =   100
      TabIndex        =   2
      Top             =   1285
      Width           =   345
   End
End
Attribute VB_Name = "Marks_ItemText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).Marks.Item(val(Text2.Text)).Transparent = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).Marks.Item(val(Text2.Text)).ShowEditorShape
End Sub

Private Sub Form_Load()
  VScroll1.Value = 0
  VScroll1.Max = 0
  VScroll1.Min = TChart1.Series(0).CountLegendItems - 1
  
  Text3.Text = TChart1.Series(0).ValueMarkText(0)
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
    MsgBox "Please insert a numeric value", , "Item"
  Else
    If (val(Text2.Text) > TChart1.Series(0).CountLegendItems - 1 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(TChart1.Series(0).Count - 1), , "Item"
    Else
      If TChart1.Series(0).Marks.Item(val(Text2.Text)).Transparent Then
        Check1.Value = 1
      Else
        Check1.Value = 0
      End If
      Text3.Text = TChart1.Series(0).ValueMarkText(val(Text2.Text))
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub Text3_Change()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Item"
  Else
    If (val(Text2.Text) > TChart1.Series(0).CountLegendItems - 1 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(TChart1.Series(0).Count - 1), , "Item"
    Else
      TChart1.Series(0).Marks.Item(val(Text2.Text)).Text.Text = Text3.Text
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
