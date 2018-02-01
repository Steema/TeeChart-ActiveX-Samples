VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Frame 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Paspartou"
      Height          =   195
      Left            =   5730
      TabIndex        =   6
      Top             =   900
      Value           =   1  'Checked
      Width           =   1125
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   3300
      Max             =   200
      TabIndex        =   5
      Top             =   870
      Value           =   45
      Width           =   1785
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_Frame.frx":0000
      Left            =   690
      List            =   "Tool_Frame.frx":0019
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   840
      Width           =   1635
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   1
      Top             =   1260
      Width           =   11505
      Base64          =   $"Tool_Frame.frx":004E
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   765
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_Frame.frx":05D6
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      Height          =   195
      Left            =   5190
      TabIndex        =   7
      Top             =   900
      Width           =   330
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Margins:"
      Height          =   195
      Left            =   2640
      TabIndex        =   4
      Top             =   900
      Width           =   600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Frame:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   900
      Width           =   480
   End
End
Attribute VB_Name = "Tool_Frame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Tools.Items(0).asFrame.Brush.Style = bsSolid
  Else
    TChart1.Tools.Items(0).asFrame.Brush.Style = bsClear
  End If
End Sub

Private Sub Combo1_Change()
  TChart1.Tools.Items(0).asFrame.Style = Combo1.ListIndex + 1
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcFrame
  Combo1.ListIndex = 3
  
  With TChart1.Tools.Items(0).asFrame
    .Size = 45
    .Style = 4
  End With
  
  TChart1.Tools.Items(0).asFrame.Brush.Style = bsSolid
  Label3.Caption = Str$(HScroll1.Value)
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asFrame.Size = HScroll1.Value
  Label3.Caption = Str$(HScroll1.Value)
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
