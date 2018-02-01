VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BezierSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3060
   ClientTop       =   2685
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
      Base64          =   $"BezierSeriesFormForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Series"
      Height          =   345
      Left            =   4260
      TabIndex        =   8
      Top             =   960
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D Chart"
      Height          =   195
      Left            =   5760
      TabIndex        =   7
      Top             =   1020
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   3720
      Max             =   3
      Min             =   250
      TabIndex        =   4
      Top             =   960
      Value           =   32
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   3300
      TabIndex        =   3
      Text            =   "32"
      Top             =   960
      Width           =   435
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "BezierSeriesFormForm.frx":06CC
      Left            =   840
      List            =   "BezierSeriesFormForm.frx":06D9
      TabIndex        =   2
      Text            =   "Windows"
      Top             =   960
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BezierSeriesFormForm.frx":06FA
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Middle points:"
      Height          =   195
      Left            =   2280
      TabIndex        =   6
      Top             =   1020
      Width           =   975
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Style:"
      Height          =   195
      Left            =   360
      TabIndex        =   5
      Top             =   1020
      Width           =   390
   End
End
Attribute VB_Name = "BezierSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  TChart1.Series(0).asBezier.BezierStyle = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 30
  TChart1.Series(0).asBezier.BezierStyle = 0
End Sub

Private Sub Text2_Change()
  On Error GoTo proc_err
  TChart1.Series(0).asBezier.NumBezierPoints = CInt(Text2.Text)
  VScroll1.Value = Text2.Text
  Exit Sub
proc_err:
  MsgBox ("Please enter a valid integer value")
End Sub

Private Sub VScroll1_Change()
  TChart1.Series(0).asBezier.NumBezierPoints = VScroll1.Value
  Text2.Text = VScroll1.Value
End Sub
