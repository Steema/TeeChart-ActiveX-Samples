VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FunctionCCIForm 
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
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"FunctionCCIForm.frx":0000
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4320
      TabIndex        =   6
      Text            =   "0,015"
      Top             =   1080
      Width           =   855
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2475
      TabIndex        =   3
      Text            =   "20"
      Top             =   1065
      Width           =   570
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   3030
      Max             =   1
      Min             =   100
      TabIndex        =   2
      Top             =   1080
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "FunctionCCIForm.frx":0B7A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Constant:"
      Height          =   195
      Left            =   3615
      TabIndex        =   5
      Top             =   1125
      Width           =   675
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Moving average period:"
      Height          =   195
      Left            =   750
      TabIndex        =   4
      Top             =   1110
      Width           =   1680
   End
End
Attribute VB_Name = "FunctionCCIForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 40
  Text3.Text = TChart1.Series(1).FunctionType.asCCI.Constant
End Sub

Private Sub Text2_Change()
  If val(Text2.Text) < 1 Or val(Text2.Text) > 100 Then
    KeepFocus = True
    MsgBox "Please enter number between [1..100]", , "Moving average period"
  Else
    VScroll1.Value = val(Text2.Text)
    TChart1.Series(1).FunctionType.Period = VScroll1.Value
  End If
End Sub

Private Sub Text3_Change()
  TChart1.Series(1).FunctionType.asCCI.Constant = val(Text3.Text)
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub


