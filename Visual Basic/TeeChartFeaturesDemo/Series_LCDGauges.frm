VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Series_LCDGauges 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Random!"
      Height          =   375
      Left            =   1860
      TabIndex        =   3
      Top             =   780
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   375
      Left            =   330
      TabIndex        =   2
      Top             =   780
      Width           =   1215
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   1
      Top             =   1260
      Width           =   11505
      Base64          =   $"Series_LCDGauges.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   377
      Object.Left            =   0
      Object.Top             =   84
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
      Language        =   0
      Languaged       =   0
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_LCDGauges.frx":39C2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series_LCDGauges"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Command2_Click()
Dim i As Integer

  For i = 0 To TChart1.SeriesCount - 1
    TChart1.Series(i).FillSampleValues
  Next i
End Sub


Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
