VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Chart_SeriesGroupsFindByName 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   7560
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Apply"
      Height          =   345
      Left            =   5490
      TabIndex        =   6
      Top             =   1020
      Width           =   1125
   End
   Begin VB.TextBox Text3 
      Enabled         =   0   'False
      Height          =   285
      Left            =   4830
      TabIndex        =   5
      Top             =   1050
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Color       "
      Height          =   345
      Left            =   3840
      TabIndex        =   4
      Top             =   1035
      Width           =   1335
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1830
      TabIndex        =   3
      Text            =   "Group A"
      Top             =   1020
      Width           =   1515
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   1
      Top             =   1470
      Width           =   11505
      Base64          =   $"Chart_SeriesGroupsFindByName.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Chart_SeriesGroupsFindByName.frx":138C
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "SeriesGroup name:"
      Height          =   195
      Left            =   330
      TabIndex        =   2
      Top             =   1080
      Width           =   1350
   End
End
Attribute VB_Name = "Chart_SeriesGroupsFindByName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> 0 Then
    Text3.BackColor = CommonDialog1.Color
  End If
End Sub

Private Sub Command2_Click()
Dim i As Integer
Dim SGroup As Long
  SGroup = TChart1.SeriesList.Groups.FindByName(Text2.Text, False)
  
  If SGroup <> -1 Then
    For i = 0 To TChart1.SeriesList.Groups.Items(SGroup).SeriesCount - 1
       TChart1.SeriesList.Groups.Items(SGroup).Series.Items(i).Color = Text3.BackColor
    Next i
  Else
    MsgBox "This Group name does not exist", , "Series Groups"
  End If
End Sub

Private Sub Form_Load()
  With TChart1
    .SeriesList.AddGroup "Group A"
    .SeriesList.Groups.Items(0).Add 0
    .SeriesList.Groups.Items(0).Add 2
    
    .SeriesList.AddGroup "Group B"
    .SeriesList.Groups.Items(1).Add 1
    .SeriesList.Groups.Items(1).Add 3
    .Legend.LegendStyle = lsSeriesGroups
  End With
  
  Text2.Text = "Group A"
  Text3.BackColor = vbBlack
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
