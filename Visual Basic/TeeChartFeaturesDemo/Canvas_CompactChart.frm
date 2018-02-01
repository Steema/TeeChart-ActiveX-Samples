VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Canvas_CompactChart 
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
      Height          =   300
      Left            =   9855
      Max             =   1
      Min             =   1000
      TabIndex        =   12
      Top             =   1575
      Value           =   150
      Width           =   255
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   8865
      Max             =   1
      Min             =   1000
      TabIndex        =   11
      Top             =   1575
      Value           =   250
      Width           =   255
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   9225
      TabIndex        =   10
      Text            =   "150"
      Top             =   1575
      Width           =   600
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   8280
      TabIndex        =   9
      Text            =   "250"
      Top             =   1575
      Width           =   600
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   6300
      TabIndex        =   8
      Text            =   "C:\tmp\"
      Top             =   1575
      Width           =   1860
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2925
      TabIndex        =   7
      Text            =   "C:\Program Files\flex_sdk_3\bin"
      Top             =   1575
      Width           =   3255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Create and Open CompactChart"
      Height          =   375
      Left            =   45
      TabIndex        =   2
      Top             =   1215
      Width           =   2805
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4935
      Left            =   0
      TabIndex        =   0
      Top             =   1980
      Width           =   11505
      Base64          =   $"Canvas_CompactChart.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "Canvas_CompactChart.frx":11C4
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label4 
      Caption         =   "&Height:"
      Height          =   240
      Left            =   9225
      TabIndex        =   6
      Top             =   1260
      Width           =   870
   End
   Begin VB.Label Label3 
      Caption         =   "&Width:"
      Height          =   240
      Left            =   8280
      TabIndex        =   5
      Top             =   1260
      Width           =   870
   End
   Begin VB.Label Label2 
      Caption         =   "&Temp Path :"
      Height          =   240
      Left            =   6300
      TabIndex        =   4
      Top             =   1260
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "&Path to Flex :"
      Height          =   240
      Left            =   2970
      TabIndex        =   3
      Top             =   1305
      Width           =   1095
   End
End
Attribute VB_Name = "Canvas_CompactChart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Export.asFlex.CompileDeleteShow VScroll1.Value, VScroll2.Value, Text3.Text, _
     TChart1.Name, Text2.Text, True, True, True
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (8)
    .Legend.Visible = False
    .Tools.Add tcMarksTip
    .Tools.Items(0).asMarksTip.Series = TChart1.Series(0)
    
    .Animations.Add tcExpand
    .Animations.Items(0).asExpand.Target = cpSeriesPointer
    .Animations.Items(0).asExpand.Trigger = atMouseOver
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text4.Text = LTrim$(Str$(VScroll1.Value))
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text5.Text = LTrim$(Str$(VScroll2.Value))
End Sub

