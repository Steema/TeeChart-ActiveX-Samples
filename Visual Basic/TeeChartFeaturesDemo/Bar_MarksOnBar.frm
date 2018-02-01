VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Bar_MarksOnBar 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.VScrollBar VScroll2 
      Height          =   270
      Left            =   9075
      Max             =   1
      Min             =   100
      TabIndex        =   11
      Top             =   1590
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   8610
      TabIndex        =   10
      Text            =   "8"
      Top             =   1575
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   7455
      Max             =   1
      Min             =   100
      TabIndex        =   8
      Top             =   1590
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   6990
      TabIndex        =   7
      Text            =   "0"
      Top             =   1575
      Width           =   435
   End
   Begin VB.ComboBox cblocation 
      Height          =   315
      ItemData        =   "Bar_MarksOnBar.frx":0000
      Left            =   5085
      List            =   "Bar_MarksOnBar.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1575
      Width           =   1185
   End
   Begin VB.CheckBox cbMarksOnBar 
      Caption         =   "&Marks On Bar"
      Height          =   195
      Left            =   2790
      TabIndex        =   4
      Top             =   1620
      Width           =   1410
   End
   Begin VB.ComboBox cbstyle 
      Height          =   315
      ItemData        =   "Bar_MarksOnBar.frx":0025
      Left            =   1035
      List            =   "Bar_MarksOnBar.frx":002F
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1575
      Width           =   1590
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4890
      Left            =   0
      TabIndex        =   0
      Top             =   2025
      Width           =   11505
      Base64          =   $"Bar_MarksOnBar.frx":0049
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1470
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Bar_MarksOnBar.frx":17E3
      Top             =   0
      Width           =   11730
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "&Font Size :"
      Height          =   195
      Left            =   7830
      TabIndex        =   12
      Top             =   1620
      Width           =   750
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "&Angle :"
      Height          =   195
      Left            =   6390
      TabIndex        =   9
      Top             =   1620
      Width           =   495
   End
   Begin VB.Label llocation 
      Caption         =   "Location :"
      Height          =   240
      Left            =   4275
      TabIndex        =   5
      Top             =   1620
      Width           =   780
   End
   Begin VB.Label Label1 
      Caption         =   "&Bar Style :"
      Height          =   240
      Left            =   180
      TabIndex        =   2
      Top             =   1620
      Width           =   780
   End
End
Attribute VB_Name = "Bar_MarksOnBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cblocation_Click()
If TChart1.Series(0).SeriesType = scBar Then
Select Case cblocation.ListIndex
Case 0:
  TChart1.Series(0).asBar.MarksLocation = mlStart
Case 1:
  TChart1.Series(0).asBar.MarksLocation = mlCenter
Case 2:
  TChart1.Series(0).asBar.MarksLocation = mlEnd
End Select
Else
Select Case cblocation.ListIndex
Case 0:
  TChart1.Series(0).asHorizBar.MarksLocation = mlStart
Case 1:
  TChart1.Series(0).asHorizBar.MarksLocation = mlCenter
Case 2:
  TChart1.Series(0).asHorizBar.MarksLocation = mlEnd
End Select
End If
End Sub

Private Sub cbMarksOnBar_Click()
  cblocation.Enabled = cbMarksOnBar.Value
  llocation.Enabled = cbMarksOnBar.Value

  UpdateMarksLocation
End Sub

Private Sub cbstyle_Click()
  If cbstyle.ListIndex = 0 Then
    TChart1.ChangeSeriesType 0, scHorizBar
    TChart1.Series(0).asHorizBar.Gradient.Direction = gdBottomTop
    TChart1.Axis.Left.Increment = 0
    TChart1.Axis.Bottom.Increment = 100
  Else
    TChart1.ChangeSeriesType 0, scBar
    TChart1.Series(0).asBar.Gradient.Direction = gdLeftRight
    TChart1.Axis.Bottom.Increment = 0
    TChart1.Axis.Left.Increment = 100
  End If
  UpdateMarksLocation
End Sub

Private Sub Form_Load()
  cbstyle.ListIndex = 0
  cblocation.ListIndex = 2
  VScroll2.Value = 12
  cbMarksOnBar.Value = 1
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(0).Marks.Angle = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

Private Sub Text3_Change()
  TChart1.Series(0).Marks.Font.Size = VScroll2.Value
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = LTrim$(Str$(VScroll2.Value))
End Sub

Private Sub UpdateMarksLocation()
  If TChart1.Series(0).SeriesType = scBar Then
    TChart1.Series(0).asBar.MarksOnBar = cbMarksOnBar.Value
  Else
    TChart1.Series(0).asHorizBar.MarksOnBar = cbMarksOnBar.Value
  End If
  cblocation_Click
End Sub
