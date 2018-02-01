VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Canvas_RoundRectWithZ 
   BackColor       =   &H80000005&
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   6210
      Left            =   0
      TabIndex        =   0
      Top             =   705
      Width           =   11505
      Base64          =   $"Canvas_RoundRectWithZ.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   570
      Left            =   150
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Canvas_RoundRectWithZ.frx":179E
      Top             =   0
      Width           =   11640
   End
End
Attribute VB_Name = "Canvas_RoundRectWithZ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
    .Header.Visible = False
    .Walls.Visible = False
    .Axis.Visible = False
    .Aspect.Orthogonal = True
End With
End Sub

Private Sub TChart1_OnAfterDraw()
With TChart1.Canvas
    .Brush.Color = vbRed
    .RoundRectWithZ 10, 10, 300, 300, 100, 100, 10
    .Brush.Color = vbGreen
    .RoundRectWithZ 50, 50, 350, 350, 100, 50, 10
    .Brush.Color = vbBlue
    .RoundRectWithZ 150, 100, 400, 300, 100, 200, 10
End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

