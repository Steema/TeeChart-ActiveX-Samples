VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_GetCircleLabelEvent 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Apply !"
      Height          =   345
      Left            =   3090
      TabIndex        =   3
      Top             =   1020
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2400
      TabIndex        =   2
      Text            =   "c"
      Top             =   1050
      Width           =   495
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Series_GetCircleLabelEvent.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_GetCircleLabelEvent.frx":07F8
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Add extra text for Circle labels :"
      Height          =   195
      Left            =   150
      TabIndex        =   4
      Top             =   1080
      Width           =   2175
   End
End
Attribute VB_Name = "Series_GetCircleLabelEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Repaint
End Sub

Private Sub TChart1_OnGetSeriesCircleLabel(ByVal SeriesIndex As Long, ByVal Angle As Double, ByVal Index As Long, Text As String)
  Text = Text + Text2.Text
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
