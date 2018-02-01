VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ContourLevelMarks 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   6330
      TabIndex        =   10
      Top             =   1170
      Width           =   1005
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   5790
      Max             =   0
      Min             =   100
      TabIndex        =   9
      Top             =   1200
      Value           =   4
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   5340
      TabIndex        =   8
      Text            =   "4"
      Top             =   1200
      Width           =   435
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Font Color"
      Height          =   195
      Left            =   3480
      TabIndex        =   6
      Top             =   1230
      Width           =   1035
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3030
      Max             =   0
      Min             =   100
      TabIndex        =   5
      Top             =   1200
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2580
      TabIndex        =   4
      Text            =   "10"
      Top             =   1200
      Width           =   435
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Level Marks"
      Height          =   195
      Left            =   150
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1185
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Series_ContourLevelMarks.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ContourLevelMarks.frx":D19A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Densiry:"
      Height          =   195
      Left            =   4710
      TabIndex        =   7
      Top             =   1230
      Width           =   570
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Num. Levels:"
      Height          =   195
      Left            =   1590
      TabIndex        =   3
      Top             =   1230
      Width           =   930
   End
End
Attribute VB_Name = "Series_ContourLevelMarks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asContour.ContourMarks.Visible = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asContour.ContourMarks.ColorLevel = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  TChart1.Series(0).asContour.ContourMarks.Visible = True
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
    MsgBox "Please insert a numeric value", , "Num. Levels"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Num. Levels"
    Else
      TChart1.Series(0).asContour.NumLevels = val(Text2.Text)
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
    MsgBox "Please insert a numeric value", , "Density"
  Else
    If (val(Text3.Text) > 100 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Density"
    Else
      TChart1.Series(0).asContour.ContourMarks.Density = val(Text3.Text)
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
