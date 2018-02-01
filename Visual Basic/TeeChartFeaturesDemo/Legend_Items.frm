VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_Items 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   2160
      TabIndex        =   5
      Text            =   "Text3"
      Top             =   900
      Width           =   2265
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   1650
      Max             =   0
      Min             =   7
      TabIndex        =   4
      Top             =   900
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1140
      TabIndex        =   3
      Text            =   "0"
      Top             =   900
      Width           =   495
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5595
      Left            =   0
      TabIndex        =   1
      Top             =   1320
      Width           =   11505
      Base64          =   $"Legend_Items.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Legend_Items.frx":0804
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Legend Item:"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   960
      Width           =   930
   End
End
Attribute VB_Name = "Legend_Items"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Legend.TextStyle = ltsValue
  TChart1.Legend.ColumnWidthAuto = False
  TChart1.Legend.ColumnWidths(0) = 100
  
  TChart1.Environment.InternalRepaint
  
  Text3.Text = TChart1.Legend.Item(0).Text
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Legend Item"
  Else
    If (val(Text2.Text) > 7 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 7", , "Legend Item"
    Else
      Text3.Text = TChart1.Legend.Item(val(Text2.Text)).Text
    End If
  End If
End Sub

Private Sub Text3_Change()
  TChart1.Legend.Item(val(Text2.Text)).Text = Text3.Text
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
