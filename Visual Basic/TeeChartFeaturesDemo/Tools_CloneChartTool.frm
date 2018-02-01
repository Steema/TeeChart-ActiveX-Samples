VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tools_CloneChartTool 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Edit"
      Height          =   345
      Left            =   4440
      TabIndex        =   6
      Top             =   1110
      Width           =   975
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3840
      Max             =   0
      Min             =   450
      TabIndex        =   5
      Top             =   1140
      Value           =   100
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3120
      TabIndex        =   4
      Text            =   "100"
      Top             =   1140
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Clone ColorLine Tool"
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   1110
      Width           =   1815
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   1
      Top             =   1560
      Width           =   11505
      Base64          =   $"Tools_CloneChartTool.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Tools_CloneChartTool.frx":039E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Initial Value:"
      Height          =   195
      Left            =   2160
      TabIndex        =   3
      Top             =   1185
      Width           =   855
   End
End
Attribute VB_Name = "Tools_CloneChartTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Add tcColorLine
  
  With TChart1.Tools.Items(TChart1.Tools.Count - 1).asColorLine
    .Axis = TChart1.Axis.Right
    .Value = VScroll1.Value
    .Pen.Width = 4
    .Pen.Color = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
  End With
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcColorLine
  
  With TChart1.Tools.Items(0).asColorLine
    .Axis = TChart1.Axis.Right
    .Value = val(Text2.Text)
    .Pen.Width = 4
    .Pen.Color = RGB(255, 255, 255)
  End With
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
    MsgBox "Please insert a numeric value", , "Initial Value"
  Else
    If (val(Text2.Text) > 450 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 450", , "Initial Value"
    Else
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
