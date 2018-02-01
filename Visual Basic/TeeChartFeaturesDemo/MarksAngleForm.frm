VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksAngleForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2700
   ClientTop       =   2400
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5145
      Left            =   0
      TabIndex        =   0
      Top             =   1770
      Width           =   11505
      Base64          =   $"MarksAngleForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Reset"
      Height          =   345
      Left            =   3960
      TabIndex        =   5
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1680
      TabIndex        =   4
      Top             =   1320
      Width           =   555
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   5
      Left            =   2250
      Max             =   0
      Min             =   360
      SmallChange     =   5
      TabIndex        =   3
      Top             =   1320
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Marks Angle:"
      Height          =   195
      Left            =   600
      TabIndex        =   2
      Top             =   1380
      Width           =   930
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   1215
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MarksAngleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  VScroll1.Value = 0
  VScroll1_Change
End Sub

Private Sub Form_Load()
  Label1.Caption = "Series Marks can now be rotated using the Angle property." & Chr(13) _
  & Chr(13) _
  & "Example:  TChart1.Series(0).Marks.Angle = 90"
  With TChart1
    .AddSeries scHorizBar
    .Series(0).FillSampleValues 8
  End With
  VScroll1_Change
End Sub

Private Sub Text1_Change()
  Text1_Validate (True)
End Sub

Private Sub Text1_Validate(Cancel As Boolean)
  If Not IsNumeric(Text1.Text) Or val(Text1.Text) > 360 Then
    KeepFocus = True
    MsgBox "Please insert a number less than or equal to 360", , "Text1"
  Else
    TChart1.Series(0).Marks.Angle = val(Text1.Text)
    VScroll1.Value = val(Text1.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text1.Text = Str$(VScroll1.Value)
  Text1_Validate (False)
End Sub
