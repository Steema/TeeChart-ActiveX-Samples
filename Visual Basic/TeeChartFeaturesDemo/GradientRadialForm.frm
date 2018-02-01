VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form GradientRadialForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"GradientRadialForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5880
      TabIndex        =   6
      Top             =   1215
      Width           =   855
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   315
      Left            =   3660
      Max             =   300
      Min             =   -300
      TabIndex        =   4
      Top             =   1230
      Width           =   1995
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   315
      Left            =   900
      Max             =   300
      Min             =   -300
      TabIndex        =   2
      Top             =   1230
      Width           =   1995
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "GradientRadialForm.frx":043E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Vertical:"
      Height          =   195
      Left            =   3000
      TabIndex        =   5
      Top             =   1290
      Width           =   570
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Horizontal:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1290
      Width           =   750
   End
End
Attribute VB_Name = "GradientRadialForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Walls.Back.Gradient.ShowEditor False
End Sub

Private Sub HScroll1_Change()
  TChart1.Walls.Back.Gradient.RadialX = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  TChart1.Walls.Back.Gradient.RadialY = HScroll2.Value
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

