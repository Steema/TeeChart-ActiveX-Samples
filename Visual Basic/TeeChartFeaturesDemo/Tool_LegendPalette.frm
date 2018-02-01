VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Tool_LegendPalette 
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
   Begin TeeChart.TChart TChart1 
      Height          =   5775
      Left            =   45
      TabIndex        =   5
      Top             =   1170
      Width           =   11490
      Base64          =   $"Tool_LegendPalette.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_LegendPalette.frx":12C6E
      Left            =   3360
      List            =   "Tool_LegendPalette.frx":12C7B
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   750
      Width           =   1335
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Pen"
      Height          =   195
      Left            =   1350
      TabIndex        =   3
      Top             =   810
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Vertical"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   810
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   645
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_LegendPalette.frx":12C95
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Axis:"
      Height          =   195
      Left            =   2880
      TabIndex        =   1
      Top             =   795
      Width           =   330
   End
End
Attribute VB_Name = "Tool_LegendPalette"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  With TChart1.Tools.Items(0).asLegendPalette
    .Vertical = Check1.Value
    .Left = TChart1.Canvas.Width - TChart1.Tools.Items(0).asLegendPalette.Width - 10
  End With
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asLegendScrollBar.Pen.Visible = Check2.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  With TChart1.Tools.Items(0).asLegendPalette
    Select Case Combo1.ListIndex
      Case 0: .Axis = laDefault
      Case 1: .Axis = laOther
      Case 2: .Axis = laBoth
    End Select
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .Axis.FastCalc = True
    .Aspect.ZoomText = False
    .Panel.MarginRight = 18
 
    .Series(0).FillSampleValues
  
    ' To add the tool via code
    '.Tools.Add tcLegendPalette
    '.Tools.Items(0).asLegendPalette.Series = TChart1.Series(0)
    '.Tools.Items(0).asLegendPalette.Pen.Visible = False
  End With
  
  Combo1.ListIndex = 2
  
  TChart1.Environment.InternalRepaint
  TChart1.Tools.Items(0).asLegendPalette.Left = TChart1.Canvas.Width - TChart1.Tools.Items(0).asLegendPalette.Width - 10
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
