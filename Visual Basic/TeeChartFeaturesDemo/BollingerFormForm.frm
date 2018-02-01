VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BollingerFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   1650
   ClientTop       =   1545
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"BollingerFormForm.frx":0000
   End
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   195
      Left            =   1320
      TabIndex        =   10
      Top             =   1080
      Width           =   195
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Line pen     "
      Height          =   345
      Left            =   240
      TabIndex        =   9
      Top             =   1020
      Width           =   1395
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   2910
      Max             =   1
      Min             =   1000
      TabIndex        =   6
      Top             =   1020
      Value           =   50
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   2490
      TabIndex        =   5
      Top             =   1020
      Width           =   435
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   315
      Left            =   4650
      Max             =   1
      Min             =   1000
      TabIndex        =   4
      Top             =   1020
      Value           =   2
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   315
      Left            =   4230
      TabIndex        =   3
      Top             =   1020
      Width           =   435
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Exponential"
      Height          =   195
      Left            =   5130
      TabIndex        =   2
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BollingerFormForm.frx":0A64
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Period:"
      Height          =   195
      Left            =   1890
      TabIndex        =   8
      Top             =   1080
      Width           =   495
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Deviation:"
      Height          =   195
      Left            =   3390
      TabIndex        =   7
      Top             =   1080
      Width           =   720
   End
End
Attribute VB_Name = "BollingerFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(1).FunctionType.asBollinger.Exponential = Check1.Value
End Sub

Private Sub Command1_Click()
  With TChart1.Series(1)
    PenColor = .asFastLine.LinePen.Color
    PenStyle = .asFastLine.LinePen.Style
    PenVisible = .asFastLine.LinePen.Visible
    PenWidth = .asFastLine.LinePen.Width
    PenForm.Show vbModal
    If PenCancel = False Then
      .asFastLine.LinePen.Color = PenColor
      .asFastLine.LinePen.Style = PenStyle
      .asFastLine.LinePen.Visible = PenVisible
      .asFastLine.LinePen.Width = PenWidth
      Text4.BackColor = PenColor
      With .FunctionType.asBollinger.LowBand
        .asFastLine.LinePen.Color = PenColor
        .asFastLine.LinePen.Style = PenStyle
        .asFastLine.LinePen.Visible = PenVisible
        .asFastLine.LinePen.Width = PenWidth
      End With
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 400
    .Axis.Left.Title.Caption = .Series(0).Title
    With .Series(1)
      .FunctionType.asBollinger.LowBand.Color = .Color
      Text4.BackColor = .Color
    End With
  End With
  VScroll1_Scroll
  VScroll2_Scroll
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Period"
  Else
    With TChart1.Series(1).FunctionType
      .Period = val(Text2.Text)
    End With
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

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Deviation"
  Else
    With TChart1.Series(1).FunctionType
      .asBollinger.Deviation = val(Text3.Text)
    End With
    VScroll2.Value = val(Text3.Text)
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text3_Confirm
End Sub
