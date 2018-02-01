VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form ContourLevelsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3060
   ClientTop       =   2580
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5535
      Left            =   0
      TabIndex        =   2
      Top             =   1440
      Width           =   11535
      Base64          =   $"ContourLevelsForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   369
      Object.Left            =   0
      Object.Top             =   96
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
      Language        =   0
      Languaged       =   0
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ContourLevelsForm.frx":085E
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom levels"
      Height          =   195
      Left            =   360
      TabIndex        =   0
      Top             =   1110
      Value           =   1  'Checked
      Width           =   1875
   End
End
Attribute VB_Name = "ContourLevelsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1.Series(0).asContour
    If Check1.Value = 0 Then
      .AutomaticLevels = True
    Else
      .AutomaticLevels = False
      AddCustomLevels
    End If
  End With
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scContour
  TChart1.Aspect.View3D = False
  TChart1.Series(0).FillSampleValues 20
  AddCustomLevels
End Sub

Private Sub AddCustomLevels()
  With TChart1.Series(0).asContour
    .NumLevels = 10
    .CreateAutoLevels
    With .Levels
      .Items(0).UpToValue = -1
      .Items(1).UpToValue = -0.8
      .Items(2).UpToValue = -0.6
      .Items(3).UpToValue = -0.4
      .Items(4).UpToValue = -0.2
      .Items(5).UpToValue = 0
      .Items(6).UpToValue = 0.2
      .Items(7).UpToValue = 0.4
      .Items(8).UpToValue = 0.6
      .Items(9).UpToValue = 0.8
    End With
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
