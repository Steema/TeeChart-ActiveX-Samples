VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_HighLowLine 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Lines..."
      Height          =   345
      Left            =   1410
      TabIndex        =   3
      Top             =   870
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   180
      TabIndex        =   2
      Top             =   870
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   1
      Top             =   1260
      Width           =   11505
      Base64          =   $"SeriesType_HighLowLine.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   765
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "SeriesType_HighLowLine.frx":0C60
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesType_HighLowLine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Command2_Click()
  TChart1.Series(0).Pen.ShowEditor
End Sub

Private Sub Form_Load()
Dim i As Integer
  TChart1.AddSeries scHighLowLine
  
  With TChart1.Series(0)
    For i = 0 To 25
      .asHighLowLine.AddHighLow i, Rnd * 600, Rnd * 600, Str(i), vbGreen
    Next i
  
    With .asHighLowLine.HighPointer
      .Style = psCircle
      .Pen.Color = RGB(128, 0, 255)
      .Brush.Style = bsFill40
      .Brush.Color = RGB(255, 0, 128)
      .Brush.BackColor = RGB(128, 128, 0)
      .HorizontalSize = 6
      .VerticalSize = 6
    End With
    
    .asHighLowLine.LowPointer.Brush.Color = RGB(149, 220, 105)
    .Color = RGB(64, 64, 64)
    .Pen.Color = RGB(213, 255, 235)
    .Pen.Width = 2
    .Cursor = 2020
    .HorizontalAxis = aBothHorizAxis
    .VerticalAxis = aBothVertAxis
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
