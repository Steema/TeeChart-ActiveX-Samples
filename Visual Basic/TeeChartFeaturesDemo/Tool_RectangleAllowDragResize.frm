VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_RectangleAllowDragResize 
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
   Begin VB.CheckBox Check2 
      Caption         =   "Allow resize"
      Height          =   195
      Left            =   3600
      TabIndex        =   4
      Top             =   1245
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Allow drag"
      Height          =   195
      Left            =   1920
      TabIndex        =   3
      Top             =   1245
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   360
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Tool_RectangleAllowDragResize.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_RectangleAllowDragResize.frx":05D2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_RectangleAllowDragResize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asRectangle.AllowDrag = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asRectangle.AllowResize = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcRectangle
  
  With TChart1.Tools.Items(0).asRectangle
    .Shape.Left = 100
    .Shape.Top = 50
    .Width = 170
    .Height = 100
    .Shape.Color = vbRed
    .Shape.Transparency = 80
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
