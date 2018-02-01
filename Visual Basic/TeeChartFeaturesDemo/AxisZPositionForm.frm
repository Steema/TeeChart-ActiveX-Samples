VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisZPositionForm 
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
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"AxisZPositionForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "AxisZPositionForm.frx":029C
      Left            =   120
      List            =   "AxisZPositionForm.frx":02A6
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1230
      Width           =   1815
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   315
      Left            =   3300
      Max             =   100
      TabIndex        =   2
      Top             =   1230
      Width           =   2595
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisZPositionForm.frx":02B7
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "0%"
      Height          =   195
      Left            =   6000
      TabIndex        =   5
      Top             =   1305
      Width           =   210
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Z Position:"
      Height          =   195
      Left            =   2490
      TabIndex        =   3
      Top             =   1290
      Width           =   750
   End
End
Attribute VB_Name = "AxisZPositionForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
     HScroll1.Value = Round(TChart1.Axis.Left.ZPosition)
  Else
     HScroll1.Value = Round(TChart1.Axis.Right.ZPosition)
  End If
End Sub

Private Sub Form_Load()
    Combo1.ListIndex = 0
End Sub


Private Sub HScroll1_Change()

  If Combo1.ListIndex = 0 Then
    TChart1.Axis.Left.ZPosition = HScroll1.Value
    TChart1.Axis.Left.GridZPosition = HScroll1.Value
  Else
    TChart1.Axis.Right.ZPosition = HScroll1.Value
    TChart1.Axis.Right.GridZPosition = HScroll1.Value
  End If

  Label2.Caption = Str(HScroll1.Value) + "%"
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub
