VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Bar_Rounded 
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
      Left            =   7260
      Max             =   1
      Min             =   100
      TabIndex        =   10
      Top             =   1500
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   6795
      TabIndex        =   9
      Text            =   "20"
      Top             =   1485
      Width           =   435
   End
   Begin VB.CheckBox cbPen 
      Caption         =   "P&en"
      Height          =   240
      Left            =   9405
      TabIndex        =   8
      Top             =   1530
      Width           =   735
   End
   Begin VB.CheckBox cbHorizontal 
      Caption         =   "&Horizontal"
      Height          =   240
      Left            =   7920
      TabIndex        =   7
      Top             =   1530
      Width           =   1275
   End
   Begin VB.ComboBox cbBarRound 
      Height          =   315
      ItemData        =   "Bar_Rounded.frx":0000
      Left            =   4185
      List            =   "Bar_Rounded.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1485
      Width           =   1230
   End
   Begin VB.CheckBox cbRoundBars 
      Caption         =   "&Rounded Bars"
      Height          =   195
      Left            =   1350
      TabIndex        =   3
      Top             =   1530
      Value           =   1  'Checked
      Width           =   1545
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   375
      Left            =   90
      TabIndex        =   2
      Top             =   1440
      Width           =   915
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5025
      Left            =   0
      TabIndex        =   0
      Top             =   1890
      Width           =   11505
      Base64          =   $"Bar_Rounded.frx":002A
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Bar_Rounded.frx":17F0
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label2 
      Caption         =   "Round &Size:"
      Height          =   195
      Left            =   5715
      TabIndex        =   6
      Top             =   1530
      Width           =   1050
   End
   Begin VB.Label Label1 
      Caption         =   "&Bar Round :"
      Height          =   240
      Left            =   3195
      TabIndex        =   4
      Top             =   1530
      Width           =   960
   End
End
Attribute VB_Name = "Bar_Rounded"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cbBarRound_Click()
  If TChart1.Series(0).SeriesType = scBar Then
    Select Case cbBarRound.ListIndex
    Case 0: TChart1.Series(0).asBar.BarRound = brNone
    Case 1: TChart1.Series(0).asBar.BarRound = brAtValue
    Case 2: TChart1.Series(0).asBar.BarRound = brBothEnds
    End Select
  Else
    Select Case cbBarRound.ListIndex
    Case 0: TChart1.Series(0).asHorizBar.BarRound = brNone
    Case 1: TChart1.Series(0).asHorizBar.BarRound = brAtValue
    Case 2: TChart1.Series(0).asHorizBar.BarRound = brBothEnds
    End Select
  End If
End Sub

Private Sub cbHorizontal_Click()
  If cbHorizontal.Value Then
    TChart1.ChangeSeriesType 0, scHorizBar
    TChart1.Tools.Items(0).asColorLine.Axis = TChart1.Axis.Bottom
  Else
    TChart1.ChangeSeriesType 0, scBar
    TChart1.Tools.Items(0).asColorLine.Axis = TChart1.Axis.Left
  End If

  CustomizeSeries
End Sub

Private Sub cbPen_Click()
TChart1.Series(0).Pen.Visible = cbPen.Value
End Sub

Private Sub cbRoundBars_Click()
  If TChart1.Series(0).SeriesType = scBar Then
    If cbRoundBars.Value Then
      TChart1.Series(0).asBar.BarStyle = bsRoundRectangle
    Else
      TChart1.Series(0).asBar.BarStyle = bsRectangle
    End If
  Else
    If cbRoundBars.Value Then
      TChart1.Series(0).asHorizBar.BarStyle = bsRoundRectangle
    Else
      TChart1.Series(0).asHorizBar.BarStyle = bsRectangle
    End If
  End If
  
  Label1.Enabled = cbRoundBars.Value
  cbBarRound.Enabled = cbRoundBars.Value
  Label2.Enabled = cbRoundBars.Value
  Text1.Enabled = cbRoundBars.Value
  VScroll1.Enabled = cbRoundBars.Value
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  CustomizeSeries
  With TChart1
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub CustomizeSeries()
  cbBarRound.ListIndex = 1
  
  With TChart1.Series(0)
    If cbRoundBars.Value Then
      If .SeriesType = scBar Then
      .asBar.BarStyle = bsRoundRectangle
      Else
      .asHorizBar.BarStyle = bsRoundRectangle
      End If
    Else
      If .SeriesType = scBar Then
        .asBar.BarStyle = bsRectangle
      Else
        .asHorizBar.BarStyle = bsRectangle
      End If
    End If
    
    If .SeriesType = scBar Then
      .asBar.RoundSize = VScroll1.Value
    Else
      .asHorizBar.RoundSize = VScroll1.Value
    End If
    
    cbBarRound_Click
    
    .Pen.Visible = cbPen.Value
  End With

End Sub


Private Sub Text2_Change()
  If TChart1.Series(0).SeriesType = scBar Then
    TChart1.Series(0).asBar.RoundSize = VScroll1.Value
  Else
    TChart1.Series(0).asHorizBar.RoundSize = VScroll1.Value
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub
