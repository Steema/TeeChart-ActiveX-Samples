VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ADXFunctionFormForm 
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
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"ADXFunctionFormForm.frx":0000
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   6240
      TabIndex        =   8
      Top             =   1230
      Width           =   195
   End
   Begin VB.CommandButton Command2 
      Caption         =   "DMDown Line pen     "
      Height          =   345
      Left            =   4680
      TabIndex        =   7
      Top             =   1170
      Width           =   1815
   End
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   4200
      TabIndex        =   6
      Top             =   1230
      Width           =   195
   End
   Begin VB.CommandButton Command1 
      Caption         =   "DMUp Line pen     "
      Height          =   345
      Left            =   2640
      TabIndex        =   5
      Top             =   1170
      Width           =   1815
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   1260
      TabIndex        =   3
      Top             =   1170
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   1680
      Max             =   1
      Min             =   1000
      TabIndex        =   2
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
      TabIndex        =   1
      Text            =   "ADXFunctionFormForm.frx":1B20
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Period:"
      Height          =   255
      Left            =   720
      TabIndex        =   4
      Top             =   1230
      Width           =   555
   End
End
Attribute VB_Name = "ADXFunctionFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  With TChart1.Series(1).FunctionType.asADX.DMUp
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
     Text4.BackColor = .asFastLine.LinePen.Color
    End If
  End With
End Sub

Private Sub Command2_Click()
  With TChart1.Series(1).FunctionType.asADX.DMDown
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
      Text3.BackColor = .asFastLine.LinePen.Color
    End If
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 300
  'ADX is a FunctionType applied to a Series. The Series may be of
  'differing type but is scLine as default. The ADX Function has 2
  'associated points mapped as 'Sub Series' - DMUp and DMDown.
  'DMUp and DMDown are Series within a Series and may be accessed
  'via the .asADX property to ADX FunctionType interface. Their Series
  'Type is FastLine and their FastLine specific characteristics may be
  'reached via the .asFastLine property of the DM Sub Series.
  Text4.BackColor = TChart1.Series(1).FunctionType.asADX.DMUp.asFastLine.LinePen.Color
  Text3.BackColor = TChart1.Series(1).FunctionType.asADX.DMDown.asFastLine.LinePen.Color
  VScroll1_Scroll
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
