VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_AxisArrowSize 
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
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   7260
      Max             =   0
      Min             =   100
      TabIndex        =   7
      Top             =   1275
      Value           =   50
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   6780
      TabIndex        =   6
      Text            =   "50"
      Top             =   1275
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   3030
      TabIndex        =   5
      Top             =   1200
      Width           =   735
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Active Bottom"
      Height          =   195
      Left            =   1590
      TabIndex        =   3
      Top             =   1275
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Active Left Top"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1275
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   1
      Top             =   1680
      Width           =   11505
      Base64          =   $"Tool_AxisArrowSize.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_AxisArrowSize.frx":03D0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Height          =   195
      Left            =   3870
      TabIndex        =   8
      Top             =   1275
      Width           =   45
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Size Percent:"
      Height          =   195
      Left            =   5790
      TabIndex        =   4
      Top             =   1305
      Width           =   945
   End
End
Attribute VB_Name = "Tool_AxisArrowSize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(0).Active = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(1).Active = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues (10)
End Sub

Private Sub TChart1_OnAxisArrowToolClick(ByVal ToolIndex As Long, ByVal AtStart As Boolean)
  If AtStart Then
    Label2.Caption = TChart1.Tools.Items(ToolIndex).Description + " " + Format(ToolIndex) + " at start"
  Else
    Label2.Caption = TChart1.Tools.Items(ToolIndex).Description + " " + Format(ToolIndex) + " at end"
  End If
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
    MsgBox "Please insert a numeric value", , "Size Percent"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Size Percent"
    Else
      TChart1.Tools.Items(0).asAxisArrow.SizePercent = val(Text2.Text)
      TChart1.Tools.Items(1).asAxisArrow.SizePercent = val(Text2.Text)
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
