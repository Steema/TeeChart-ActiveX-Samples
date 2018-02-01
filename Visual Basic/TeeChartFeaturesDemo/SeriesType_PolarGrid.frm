VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_PolarGrid 
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
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   2730
      Max             =   200
      Min             =   1
      TabIndex        =   6
      Top             =   1230
      Value           =   20
      Width           =   1275
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1320
      Max             =   200
      Min             =   1
      TabIndex        =   5
      Top             =   1230
      Value           =   21
      Width           =   1275
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Axis on top"
      Height          =   225
      Left            =   5520
      TabIndex        =   4
      Top             =   1230
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Clockwise"
      Height          =   225
      Left            =   4320
      TabIndex        =   3
      Top             =   1230
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   150
      TabIndex        =   2
      Top             =   1170
      Width           =   945
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"SeriesType_PolarGrid.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "SeriesType_PolarGrid.frx":019E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesType_PolarGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asPolarGrid.ClockWiseLabels = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Axis.Behind = Not CBool(Check2.Value)
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scPolarGrid
  TChart1.Series(0).asPolarGrid.CircleLabels.Visible = True
  TChart1.Series(0).asPolarGrid.RadiusIncrement = 1
  TChart1.Series(0).asPolarGrid.Circled = True
  HScroll1_Change
End Sub

Private Sub HScroll1_Change()
Dim Sector, Track As Integer
Dim tmp, sqr1, sqr2 As Double

  With TChart1.Series(0).asPolarGrid
    .NumSectors = HScroll1.Value
    .NumTracks = HScroll2.Value
    
    TChart1.Series(0).BeginUpdate
       
    For Sector = 0 To .NumSectors - 1
      For Track = 0 To .NumTracks - 1
      
      sqr1 = Cos(Sector / (.NumSectors * 0.2))
      sqr2 = Cos(Track / (.NumTracks * 0.2))
      
      If sqr1 < 0 Then
        sqr1 = 0
      End If
      
      If sqr2 < 0 Then
        sqr2 = 0
      End If
      
      tmp = 0.5 * Sqr(sqr1) + _
        Sqr(sqr2) - _
        Cos(Track / (.NumTracks * 0.5))
      
       .AddCell Sector, Track, tmp
      Next Track
    Next Sector
    
    TChart1.Series(0).EndUpdate
    
    .AngleIncrement = 360 / .NumSectors
  End With
  
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  HScroll1_Change
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
