VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form StochasticFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"StochasticFormForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3840
      Max             =   1
      Min             =   100
      TabIndex        =   4
      Top             =   1050
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3420
      TabIndex        =   3
      Top             =   1050
      Width           =   435
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Stochastic"
      Height          =   195
      Left            =   450
      TabIndex        =   2
      Top             =   1110
      Value           =   1  'Checked
      Width           =   1995
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "StochasticFormForm.frx":0862
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Period:"
      Height          =   255
      Left            =   2820
      TabIndex        =   5
      Top             =   1080
      Width           =   555
   End
End
Attribute VB_Name = "StochasticFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    .Series(1).Active = Check1.Value
    .Tools.Items(0).Active = Check1.Value
    .Axis.Custom(0).Visible = .Series(1).Active
    If .Axis.Custom(0).Visible = False Then
      .Axis.Left.EndPosition = 100
    Else
      .Axis.Left.EndPosition = 70
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 120
    .Axis.Left.Title.Caption = .Series(0).Title
    .Axis.Custom(0).Title.Caption = .Series(1).Title
    .Tools.Items(0).asColorband.StartValue = .Series(1).YValues.Minimum
    .Tools.Items(0).asColorband.EndValue = .Series(1).YValues.Maximum
  End With
  VScroll1_Scroll
End Sub

Private Sub Text1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Period 1"
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
