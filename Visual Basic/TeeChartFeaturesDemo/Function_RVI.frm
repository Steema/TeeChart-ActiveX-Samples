VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_RVI 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Display &signal line"
      Height          =   240
      Left            =   1800
      TabIndex        =   5
      Top             =   1890
      Value           =   1  'Checked
      Width           =   1590
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   1155
      Max             =   1
      Min             =   100
      TabIndex        =   3
      Top             =   1890
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   690
      TabIndex        =   2
      Text            =   "10"
      Top             =   1875
      Width           =   435
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4620
      Left            =   0
      TabIndex        =   0
      Top             =   2295
      Width           =   11505
      Base64          =   $"Function_RVI.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1710
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_RVI.frx":1F30
      Top             =   0
      Width           =   11730
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Period :"
      Height          =   195
      Left            =   90
      TabIndex        =   4
      Top             =   1920
      Width           =   540
   End
End
Attribute VB_Name = "Function_RVI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(1).FunctionType.asRVI.Signal.Active = Check1.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 200
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(1).FunctionType.Period = VScroll1.Value
  TChart1.Header.Caption = "RVI(" & TChart1.Series(1).FunctionType.Period & ")"
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub
