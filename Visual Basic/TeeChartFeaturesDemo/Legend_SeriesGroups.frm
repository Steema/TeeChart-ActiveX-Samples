VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_SeriesGroups 
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
      ItemData        =   "Legend_SeriesGroups.frx":0000
      Left            =   5070
      List            =   "Legend_SeriesGroups.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1200
      Width           =   1665
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   3450
      TabIndex        =   4
      Top             =   1200
      Width           =   1155
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Legend_SeriesGroups.frx":003B
      Left            =   1320
      List            =   "Legend_SeriesGroups.frx":004E
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1200
      Width           =   1665
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Legend_SeriesGroups.frx":0096
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Legend_SeriesGroups.frx":0162
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Legend styles:"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   1260
      Width           =   1020
   End
End
Attribute VB_Name = "Legend_SeriesGroups"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  TChart1.Legend.LegendStyle = Combo1.ListIndex
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo2_Change()
  With TChart1.Legend
    Select Case Combo2.ListIndex
      Case 0: .CheckBoxes = False
      Case 1: .CheckBoxes = True
              .CheckBoxesStyle = cbsCheck
      Case 2: .CheckBoxes = True
              .CheckBoxesStyle = cbsRadio
    End Select
  End With
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
    For i = 0 To 3
      .AddSeries scBar
    Next i
        
    With .SeriesList
      .AddGroup "Group A"
      .Groups.Items(0).Add 0
      .Groups.Items(0).Add 1
      
      .AddGroup "Group B"
      .Groups.Items(1).Add 2
      .Groups.Items(1).Add 3
    End With
    
    With .Legend
      .LegendStyle = lsSeriesGroups
      .Font.Size = 18
      .CheckBoxes = True
    End With
    
    For i = 0 To .SeriesCount - 1
      .Series(i).FillSampleValues 3
    Next i
  End With
  
  Combo1.ListIndex = 4
  Combo2.ListIndex = 1
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

