VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form RightWallFormForm 
   BorderStyle     =   0  'None
   Caption         =   "RightWallForm"
   ClientHeight    =   6915
   ClientLeft      =   1905
   ClientTop       =   2265
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"RightWallForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   365
      Object.Left            =   0
      Object.Top             =   96
      Object.Visible         =   -1  'True
      Object.Width           =   767
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   2
      Languaged       =   2
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      TabIndex        =   4
      Text            =   "Right wall new in TeeChart Pro v5. Default display Visible = False."
      Top             =   0
      Width           =   11490
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   5
      Left            =   2640
      Max             =   20
      Min             =   1
      TabIndex        =   2
      Top             =   1020
      Value           =   5
      Width           =   1815
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Right wall"
      Height          =   195
      Left            =   150
      TabIndex        =   1
      Top             =   1050
      Width           =   1815
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Right wall thickness"
      Height          =   195
      Left            =   4620
      TabIndex        =   3
      Top             =   1050
      Width           =   1410
   End
End
Attribute VB_Name = "RightWallFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Walls.Right.Visible = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scBar
  TChart1.Series(0).FillSampleValues 10
  Check1.Value = 1
  TChart1.Walls.Right.Visible = True
  TChart1.Walls.Right.Size = HScroll1.Value
End Sub

Private Sub HScroll1_Change()
  TChart1.Walls.Right.Size = HScroll1.Value
End Sub

