VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form SeriesType_OrgChart 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesType_OrgChart.frx":0000
      Left            =   1710
      List            =   "SeriesType_OrgChart.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   750
      Width           =   1395
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   750
      Width           =   1005
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5745
      Left            =   0
      TabIndex        =   1
      Top             =   1170
      Width           =   11505
      Base64          =   $"SeriesType_OrgChart.frx":0021
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   383
      Object.Left            =   0
      Object.Top             =   78
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
      Height          =   645
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "SeriesType_OrgChart.frx":0B2D
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesType_OrgChart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Series(0).asOrganizational.LineStyle = lsSquared
    Case 1: TChart1.Series(0).asOrganizational.LineStyle = lsDiagonal
  End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  TChart1.Series(0).FillSampleValues
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
