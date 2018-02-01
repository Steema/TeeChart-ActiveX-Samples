VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarkTipsToolDemoForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3120
   ClientTop       =   3525
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
      Base64          =   $"MarkTipsToolDemoForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   10
      Left            =   5700
      Max             =   0
      Min             =   1001
      TabIndex        =   7
      Top             =   1200
      Value           =   10
      Width           =   195
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5280
      TabIndex        =   6
      Text            =   "10"
      Top             =   1200
      Width           =   435
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   2820
      TabIndex        =   4
      Top             =   1170
      Width           =   1155
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "MarkTipsToolDemoForm.frx":0406
      Left            =   1500
      List            =   "MarkTipsToolDemoForm.frx":0410
      TabIndex        =   3
      Text            =   "Move"
      Top             =   1170
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Tips on:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MarkTipsToolDemoForm.frx":0421
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Delay (msec):"
      Height          =   195
      Left            =   4140
      TabIndex        =   5
      Top             =   1230
      Width           =   960
   End
End
Attribute VB_Name = "MarkTipsToolDemoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools(0).Active = Check1.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  TChart1.Tools(0).asMarksTip.MouseAction = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 8
  VScroll1_Scroll
End Sub

Private Sub Text2_Change()
  Text2_Validate True
End Sub

Private Sub Text2_Validate(Cancel As Boolean)
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Error warning"
  Else
    TChart1.Tools.Items(0).asMarksTip.Delay = val(Text2.Text)
    VScroll1.Value = val(Text2.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Validate (False)
End Sub
