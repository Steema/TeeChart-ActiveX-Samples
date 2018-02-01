VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_SMMA 
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
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   1290
      Max             =   1
      Min             =   100
      TabIndex        =   3
      Top             =   1320
      Value           =   3
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   825
      TabIndex        =   2
      Text            =   "3"
      Top             =   1305
      Width           =   435
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Function_SMMA.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_SMMA.frx":1F6E
      Top             =   0
      Width           =   11730
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Period :"
      Height          =   195
      Left            =   225
      TabIndex        =   4
      Top             =   1350
      Width           =   540
   End
End
Attribute VB_Name = "Function_SMMA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues
  Text2_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(1).FunctionType.Period = VScroll1.Value
  TChart1.Series(2).FunctionType.Period = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub
