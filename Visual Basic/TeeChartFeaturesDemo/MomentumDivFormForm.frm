VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MomentumDivFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3990
   ClientTop       =   1965
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
      Base64          =   $"MomentumDivFormForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   4620
      Max             =   1
      Min             =   100
      TabIndex        =   4
      Top             =   1020
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4200
      TabIndex        =   3
      Top             =   1020
      Width           =   435
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Momentum"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1050
      Value           =   1  'Checked
      Width           =   2235
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MomentumDivFormForm.frx":059C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Period:"
      Height          =   195
      Left            =   3600
      TabIndex        =   5
      Top             =   1080
      Width           =   495
   End
End
Attribute VB_Name = "MomentumDivFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  ' show / hide the momentum series
  TChart1.Series(1).Active = Check1.Value
  ' re-position the axis
  If TChart1.Series(1).Active Then
    TChart1.Axis.Left.EndPosition = 80
  Else
    TChart1.Axis.Left.EndPosition = 100
  End If
  ' show / hide the custom right axis
  TChart1.Axis.Custom(0).Visible = TChart1.Series(1).Active
  ' show / hide the blue color line
  TChart1.Tools.Items(0).Active = TChart1.Series(1).Active
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 50
    Text2.Text = VScroll1.Value
    .Tools.Items(0).asColorLine.Value = .Series(0).YValues.Minimum
    .Axis.Left.Title.Caption = .Series(0).Title
    .Axis.Custom(0).Title.Caption = .Series(1).Title
  End With
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Text1"
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
