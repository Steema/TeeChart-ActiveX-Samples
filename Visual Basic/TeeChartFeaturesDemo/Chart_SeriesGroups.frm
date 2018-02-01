VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Chart_SeriesGroups 
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
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Chart_SeriesGroups.frx":0000
      Left            =   3060
      List            =   "Chart_SeriesGroups.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1200
      Width           =   1230
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Chart_SeriesGroups.frx":0020
      Left            =   810
      List            =   "Chart_SeriesGroups.frx":0022
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1200
      Width           =   1320
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   4545
      TabIndex        =   3
      Top             =   1185
      Width           =   1050
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Chart_SeriesGroups.frx":0024
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Chart_SeriesGroups.frx":13B8
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Active:"
      Height          =   195
      Left            =   2490
      TabIndex        =   5
      Top             =   1260
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Groups:"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1260
      Width           =   555
   End
End
Attribute VB_Name = "Chart_SeriesGroups"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Combo2.ListIndex = TChart1.SeriesList.Groups.Items(Combo1.ListIndex).Active
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo2_Change()
  TChart1.SeriesList.Groups.Items(Combo1.ListIndex).Active = Combo2.ListIndex
End Sub

Private Sub Combo2_Click()
  Combo2_Change
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
Dim i As Integer
  With TChart1
    .SeriesList.AddGroup "Group B"
    .SeriesList.Groups.Items(0).Add 0
    .SeriesList.Groups.Items(0).Add 1
    
    .SeriesList.AddGroup "Group A"
    .SeriesList.Groups.Items(1).Add 2
    .SeriesList.Groups.Items(1).Add 3
    
    .Legend.LegendStyle = lsSeriesGroups
    
    For i = 0 To .SeriesList.Groups.Count - 1
      Combo1.AddItem .SeriesList.Groups.Items(i).Name, 0
    Next i
  End With
  
  Combo1.ListIndex = 0
  Combo2.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
