VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartRoundPanelForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"ChartRoundPanelForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Border..."
      Height          =   345
      Left            =   4200
      TabIndex        =   6
      Top             =   1215
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "No rounding"
      Height          =   195
      Left            =   2580
      TabIndex        =   5
      Top             =   1275
      Width           =   1455
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      LargeChange     =   5
      Left            =   2190
      Max             =   0
      Min             =   1000
      SmallChange     =   5
      TabIndex        =   3
      Top             =   1260
      Value           =   30
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1635
      TabIndex        =   2
      Text            =   "30"
      Top             =   1245
      Width           =   570
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartRoundPanelForm.frx":0302
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Rounding amount:"
      Height          =   195
      Left            =   270
      TabIndex        =   4
      Top             =   1290
      Width           =   1305
   End
End
Attribute VB_Name = "ChartRoundPanelForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Panel.Border.ShowEditor
End Sub

Private Sub Check1_Click()
  VScroll1.Value = 0
  Check1.Enabled = False
End Sub

Private Sub Text2_Change()
Dim v As Integer
  v = val(Text2.Text)
  If Not IsNumeric(Text2.Text) Or v < 0 Or v > 1000 Then
    KeepFocus = True
    MsgBox "Please insert a numeric value between 0 and 1000", , "Round border"
  Else
    TChart1.Panel.BorderRound = v
    TChart1.Repaint
    Check1.Enabled = v > 0
    If Check1.Enabled Then Check1.Value = 0
    If VScroll1.Value <> v Then VScroll1.Value = v
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
Dim s As String
  s = LTrim$(Str$(VScroll1.Value))
  If Text2.Text <> s Then Text2.Text = s
End Sub
