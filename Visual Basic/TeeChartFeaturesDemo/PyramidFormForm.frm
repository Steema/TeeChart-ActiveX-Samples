VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PyramidFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3975
   ClientTop       =   3555
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5595
      Left            =   0
      TabIndex        =   0
      Top             =   1320
      Width           =   11505
      Base64          =   $"PyramidFormForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   5940
      TabIndex        =   7
      Top             =   870
      Width           =   1035
   End
   Begin VB.CheckBox Check3 
      Caption         =   "With null points"
      Height          =   195
      Left            =   4320
      TabIndex        =   6
      Top             =   930
      Width           =   1575
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3780
      Max             =   1
      Min             =   1000
      TabIndex        =   4
      Top             =   870
      Value           =   50
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3360
      TabIndex        =   3
      Top             =   870
      Width           =   435
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Colour each"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   900
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PyramidFormForm.frx":05FA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Size %:"
      Height          =   255
      Left            =   2760
      TabIndex        =   5
      Top             =   900
      Width           =   555
   End
End
Attribute VB_Name = "PyramidFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).ColorEachPoint = Check1.Value
End Sub

Private Sub Check3_Click()
  With TChart1
    If Check3.Value = 0 Then
      .Series(0).PointColor(2) = clTeeColor
      .Series(0).PointColor(4) = clTeeColor
    Else
      .Series(0).PointColor(2) = clNone
      .Series(0).PointColor(4) = clNone
    End If
  End With
End Sub

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
  With TChart1.Series(0)
    .Add 10, "", clTeeColor
    .Add 15, "", clTeeColor
    .Add 5, "", clTeeColor
    .Add 2, "", clTeeColor
    .Add 7, "", clTeeColor
  End With
  VScroll1_Scroll
End Sub

Private Sub Text2_Change()
Text2_Confirm
End Sub
Private Sub Text2_Confirm()
 If Not IsNumeric(Text2.Text) Then
  KeepFocus = True
  MsgBox "Please insert a numeric value", , "Size"
 Else
  TChart1.Series(0).asPyramid.SizePercent = val(Text2.Text)
  VScroll1.Value = val(Text2.Text)
 End If
End Sub
Private Sub VScroll1_Change()
VScroll1_Scroll
End Sub
Private Sub VScroll1_Scroll()
Text2.Text = Str$(VScroll1.Value)
Text2_Confirm
End Sub
