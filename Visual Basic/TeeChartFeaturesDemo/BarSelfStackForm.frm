VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BarSelfStackForm 
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
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"BarSelfStackForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Self stacked"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1245
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BarSelfStackForm.frx":076C
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "BarSelfStackForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    
Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Series(0).asBar.MultiBar = mbSelfStack
  Else
    TChart1.Series(0).asBar.MultiBar = mbNone
  End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).Add 100, "Cars", vbRed
  TChart1.Series(0).Add 300, "Phones", vbGreen
  TChart1.Series(0).Add 200, "Lamps", vbYellow

  ' Set "Self-Stacked":
  TChart1.Series(0).asBar.MultiBar = mbSelfStack

  ' cosmetic
  TChart1.Series(0).Marks.Visible = False
  TChart1.Series(0).Marks.Style = smsValue
  TChart1.Series(0).ColorEachPoint = True
End Sub
