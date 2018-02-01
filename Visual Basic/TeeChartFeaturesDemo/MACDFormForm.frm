VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MACDFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3435
   ClientTop       =   2580
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   0
      Top             =   1260
      Width           =   11505
      Base64          =   $"MACDFormForm.frx":0000
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Show MACD Exp."
      Height          =   195
      Left            =   1800
      TabIndex        =   10
      Top             =   960
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Histogram"
      Height          =   195
      Left            =   1800
      TabIndex        =   9
      Top             =   690
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show MACD"
      Height          =   195
      Left            =   180
      TabIndex        =   8
      Top             =   810
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.TextBox Text3 
      Height          =   315
      Left            =   5820
      TabIndex        =   6
      Top             =   780
      Width           =   435
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   315
      Left            =   6240
      Max             =   1
      Min             =   100
      TabIndex        =   5
      Top             =   780
      Value           =   12
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   4320
      TabIndex        =   3
      Top             =   780
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   4740
      Max             =   1
      Min             =   100
      TabIndex        =   2
      Top             =   780
      Value           =   26
      Width           =   255
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MACDFormForm.frx":06DC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      Caption         =   "Period2:"
      Height          =   255
      Left            =   5220
      TabIndex        =   7
      Top             =   840
      Width           =   555
   End
   Begin VB.Label Label1 
      Caption         =   "Period:"
      Height          =   255
      Left            =   3720
      TabIndex        =   4
      Top             =   840
      Width           =   555
   End
End
Attribute VB_Name = "MACDFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  Check2.Enabled = Check1.Value
  Check3.Enabled = Check1.Value
  With TChart1
    .Series(1).Active = Check1.Value
    If Check1.Value = 1 Then
      .Series(1).FunctionType.asMACD.Histogram.Active = Check2.Value
      .Series(1).FunctionType.asMACD.MACDExp.Active = Check3.Value
    Else
      .Series(1).FunctionType.asMACD.Histogram.Active = .Series(1).Active
      .Series(1).FunctionType.asMACD.MACDExp.Active = .Series(1).Active
    End If
    .Axis.Custom(0).Visible = .Series(1).Active
    If .Axis.Custom(0).Visible = False Then
      .Axis.Left.EndPosition = 100
    Else
      .Axis.Left.EndPosition = 50
    End If
  End With
End Sub

Private Sub Check2_Click()
  TChart1.Series(1).FunctionType.asMACD.Histogram.Active = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Series(1).FunctionType.asMACD.MACDExp.Active = Check3.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 120
    .Axis.Left.Title.Caption = .Series(0).Title
    .Axis.Custom(0).Title.Caption = .Series(1).Title
  End With
  VScroll1_Scroll
  VScroll2_Scroll
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

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Period 2"
  Else
    With TChart1.Series(1).FunctionType
      .asMACD.Period2 = val(Text3.Text)
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
