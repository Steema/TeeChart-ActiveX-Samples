VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_AxisBreaks 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6825
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6825
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.HScrollBar HScroll2 
      Height          =   285
      Left            =   3195
      Max             =   100
      TabIndex        =   10
      Top             =   1665
      Width           =   2715
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   285
      Left            =   3195
      Max             =   100
      TabIndex        =   9
      Top             =   1260
      Width           =   2715
   End
   Begin VB.ComboBox cbBreakStyle 
      Height          =   315
      ItemData        =   "Tool_AxisBreaks.frx":0000
      Left            =   8595
      List            =   "Tool_AxisBreaks.frx":0010
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   1665
      Width           =   2445
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Brush..."
      Height          =   375
      Left            =   180
      TabIndex        =   6
      Top             =   1620
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Break &Pen..."
      Height          =   375
      Left            =   1620
      TabIndex        =   5
      Top             =   1200
      Width           =   1335
   End
   Begin VB.ComboBox cbAxis 
      Height          =   315
      ItemData        =   "Tool_AxisBreaks.frx":0041
      Left            =   8550
      List            =   "Tool_AxisBreaks.frx":004B
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1260
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4770
      Left            =   0
      TabIndex        =   0
      Top             =   2055
      Width           =   11505
      Base64          =   $"Tool_AxisBreaks.frx":005D
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Tool_AxisBreaks.frx":0A31
      Top             =   0
      Width           =   11730
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add break"
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   1230
      Width           =   1515
   End
   Begin VB.Label LblBreakSize 
      Caption         =   "Label5"
      Height          =   195
      Left            =   2115
      TabIndex        =   13
      Top             =   1710
      Width           =   915
   End
   Begin VB.Label Label4 
      Caption         =   "Break size (axis value)"
      Height          =   240
      Left            =   5985
      TabIndex        =   12
      Top             =   1710
      Width           =   1230
   End
   Begin VB.Label Label3 
      Caption         =   "Gap size (px)"
      Height          =   240
      Left            =   5985
      TabIndex        =   11
      Top             =   1305
      Width           =   1230
   End
   Begin VB.Label Label2 
      Caption         =   "Style :"
      Height          =   240
      Left            =   7920
      TabIndex        =   7
      Top             =   1710
      Width           =   555
   End
   Begin VB.Label Label1 
      Caption         =   "Axis :"
      Height          =   255
      Left            =   7965
      TabIndex        =   3
      Top             =   1305
      Width           =   555
   End
End
Attribute VB_Name = "Tool_AxisBreaks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cbAxis_Click()
  CheckAxis
End Sub

Private Sub cbBreakStyle_Click()
  Select Case cbBreakStyle.ListIndex
    Case 0:  TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).AxisBreakStyle = tabSmallZigZag
    Case 1:  TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).AxisBreakStyle = tabZigZag
    Case 2:  TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).AxisBreakStyle = tabLine
    Case 3:  TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).AxisBreakStyle = tabNone
  End Select
End Sub

Private Sub Command1_Click()
  HScroll1.Enabled = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0
  HScroll2.Enabled = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0
  
  cbAxis.Enabled = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0
  cbBreakStyle.Enabled = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0
  Command3.Enabled = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0
  Command2.Enabled = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0

  If TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count = 0 Then
    If TChart1.Tools.Items(0).asAxisBreaks.Axis = TChart1.Axis.Left.Index Then
        TChart1.Tools.Items(0).asAxisBreaks.Breaks.Add 2, 4
    Else
       TChart1.Tools.Items(0).asAxisBreaks.Breaks.Add 2, 4
    End If
    Command1.Caption = "Clear breaks"

    HScroll2.Value = Rnd(TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).EndValue - _
      TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).StartValue) * 10
  Else
    TChart1.Tools.Items(0).asAxisBreaks.Breaks.Clear

    Command1.Caption = "Add break"
  End If
End Sub

Private Sub CheckAxis()
  
  TChart1.Tools.Items(0).asAxisBreaks.Breaks.Clear

  If (cbAxis.ListIndex = 0) Then
    'TChart1.Tools.Items(0).asAxisBreaks.Axis = TChart1.Axis.Left
  Else
    TChart1.Tools.Items(0).asAxisBreaks.Axis = TChart1.Axis.Bottom
  End If

  Command1_Click
  cbBreakStyle_Click
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).asAxisBreaks.Pen.ShowEditor
End Sub

Private Sub Command3_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1.Series(0)
   .Add 0, "", clTeeColor
   .Add 1, "", clTeeColor
   .Add 5, "", clTeeColor
   .Add 4, "", clTeeColor
   .Add 7, "", clTeeColor
   .Add 2, "", clTeeColor
   .Add 3, "", clTeeColor
   .Add 4, "", clTeeColor
  End With
  
  TChart1.Axis.Left.Increment = 0.2
  TChart1.Axis.Bottom.Increment = 0.2
  
  TChart1.Tools.Add tcAxisBreaks
  
  With TChart1.Tools.Items(0).asAxisBreaks
    .Axis = TChart1.Axis.Left
    .Pen.Width = 1
    .Pen.Color = vbBlack
    .Brush.Gradient.EndColor = vbGrayText
    .Brush.Gradient.Visible = True
    .GapSize = 15
  End With

  TChart1.Walls.Back.Pen.Hide
  Command1_Click

  cbAxis.ListIndex = 0
  cbBreakStyle.ListIndex = 0
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asAxisBreaks.GapSize = HScroll1.Value
End Sub

Private Sub HScroll2_Change()
  If TChart1.Tools.Items(0).asAxisBreaks.Breaks.Count > 0 Then
     breakSize = HScroll2.Value / 10
     TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).EndValue = TChart1.Tools.Items(0).asAxisBreaks.Breaks.Item(0).StartValue + breakSize
  Else
     HScroll2.Value = 0
  End If
  LblBreakSize.Caption = HScroll2.Value / 10
End Sub

Private Sub TChart1_OnAfterDraw()
 'application.ProcessMessages;
End Sub


Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
