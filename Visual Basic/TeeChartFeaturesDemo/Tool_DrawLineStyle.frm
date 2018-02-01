VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form Tool_DrawLineStyle 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_DrawLineStyle.frx":0000
      Left            =   3720
      List            =   "Tool_DrawLineStyle.frx":0013
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1200
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Enable draw"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool_DrawLineStyle.frx":0052
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_DrawLineStyle.frx":147E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Line style:"
      Height          =   195
      Left            =   2880
      TabIndex        =   3
      Top             =   1245
      Width           =   705
   End
End
Attribute VB_Name = "Tool_DrawLineStyle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asDrawLine.EnableDraw = Check1.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  With TChart1.Tools.Items(0).asDrawLine
    Select Case Combo1.ListIndex
      Case 0: .Style = dlLine
      Case 1: .Style = dlHorizParallel
      Case 2: .Style = dlVertParallel
      Case 3: .Style = dlRectangle
      Case 4: .Style = dlEllipse
    End Select
  End With
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 4
  
  With TChart1.Series(0)
    TChart1.Tools.Items(0).asDrawLine.AddLine TChart1.Series(0).XValues.Minimum, TChart1.Series(0).YValues.Maximum, TChart1.Series(0).XValues.Maximum, TChart1.Series(0).YValues.Minimum
    TChart1.Tools.Items(0).asDrawLine.Lines.Items(0).Style = dlEllipse
    TChart1.Tools.Items(0).asDrawLine.Lines.Items(0).Pen.Color = vbYellow
  End With
  
  TChart1.Repaint
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
