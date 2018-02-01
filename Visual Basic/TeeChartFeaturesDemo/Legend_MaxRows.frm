VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_MaxRows 
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
      Height          =   300
      Left            =   1575
      Max             =   1
      Min             =   100
      TabIndex        =   3
      Top             =   1335
      Value           =   5
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1110
      TabIndex        =   2
      Text            =   "5"
      Top             =   1320
      Width           =   435
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Legend_MaxRows.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Legend_MaxRows.frx":15BE
      Top             =   0
      Width           =   11730
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Num. Rows:"
      Height          =   195
      Left            =   150
      TabIndex        =   4
      Top             =   1365
      Width           =   870
   End
End
Attribute VB_Name = "Legend_MaxRows"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (100)
    .Axis.Left.Increment = .Axis.Left.Maximum / 5
    .Axis.Bottom.Increment = .Axis.Bottom.Maximum / 5
    Text2_Change
    .Environment.InternalRepaint
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Legend.MaxNumRows = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

