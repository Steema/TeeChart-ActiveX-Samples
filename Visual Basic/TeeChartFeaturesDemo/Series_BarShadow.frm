VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Series_BarShadow 
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
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   5
      Top             =   1680
      Width           =   11535
      Base64          =   $"Series_BarShadow.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   353
      Object.Left            =   0
      Object.Top             =   112
      Object.Visible         =   -1  'True
      Object.Width           =   769
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_BarShadow.frx":085E
      Left            =   3780
      List            =   "Series_BarShadow.frx":0868
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1200
      Width           =   1485
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Shadow..."
      Height          =   345
      Left            =   1470
      TabIndex        =   2
      Top             =   1200
      Width           =   1245
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Visible"
      Height          =   195
      Left            =   450
      TabIndex        =   1
      Top             =   1260
      Value           =   1  'Checked
      Width           =   765
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1065
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_BarShadow.frx":0882
      Top             =   0
      Width           =   11430
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Bar style:"
      Height          =   195
      Left            =   3060
      TabIndex        =   3
      Top             =   1260
      Width           =   645
   End
End
Attribute VB_Name = "Series_BarShadow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If TChart1.Series(0).SeriesType = scBar Then
    TChart1.Series(0).asBar.Shadow.Visible = Check1.Value
  Else
    TChart1.Series(0).asHorizBar.Shadow.Visible = Check1.Value
  End If
End Sub

Private Sub Combo1_Change()
  If Combo1.ListIndex = 0 Then
    TChart1.ChangeSeriesType 0, scBar
  Else
    TChart1.ChangeSeriesType 0, scHorizBar
  End If
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  If TChart1.Series(0).SeriesType = scBar Then
    TChart1.Series(0).asBar.Shadow.ShowEditor
  Else
    TChart1.Series(0).asHorizBar.Shadow.ShowEditor
  End If
End Sub

Private Sub Form_Load()
  TChart1.RemoveAllSeries
  TChart1.Aspect.View3D = False
  TChart1.AddSeries scBar
  TChart1.Series(0).FillSampleValues
  
  With TChart1.Series(0).asBar.Shadow
    .HorizSize = 5
    .VertSize = 5
    .Clip = True
    .Visible = True
  End With
  
  Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
