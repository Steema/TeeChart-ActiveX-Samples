VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_Treemap 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6675
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11490
   LinkTopic       =   "Form2"
   ScaleHeight     =   6675
   ScaleWidth      =   11490
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesType_Treemap.frx":0000
      Left            =   2430
      List            =   "SeriesType_Treemap.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1710
      Width           =   1860
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4605
      Left            =   0
      TabIndex        =   0
      Top             =   2070
      Width           =   11490
      Base64          =   $"SeriesType_Treemap.frx":0023
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1650
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Text            =   "SeriesType_Treemap.frx":1991
      Top             =   0
      Width           =   11475
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit"
      Height          =   345
      Left            =   90
      TabIndex        =   1
      Top             =   1710
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Tiling Style :"
      Height          =   195
      Left            =   1305
      TabIndex        =   3
      Top             =   1755
      Width           =   870
   End
End
Attribute VB_Name = "SeriesType_Treemap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  If Combo1.ListIndex = 0 Then
    TChart1.Series(0).asTreeMap.MapStyle = tmSlice
  Else
    TChart1.Series(0).asTreeMap.MapStyle = tmStrip
  End If
End Sub

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
    TChart1.Series(0).asTreeMap.MapStyle = tmSlice
  Else
    TChart1.Series(0).asTreeMap.MapStyle = tmStrip
  End If
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).Clear
    
    With .Series(0).asTreeMap
      ' -1 because there's not a parent
      tmp = .AddValue(10, "A", -1, clTeeColor)
      tmp1 = .AddValue(38, "B", tmp, clTeeColor)
      tmp2 = .AddValue(40, "H", tmp1, clTeeColor)
      .AddValue 20, "N", tmp2, clTeeColor
      .AddValue 30, "O", tmp2, clTeeColor
      .AddValue 10, "I", tmp1, clTeeColor
      .AddValue 13, "J", tmp1, clTeeColor
      .AddValue 10, "C", tmp, clTeeColor
      tmp1 = .AddValue(35, "D", tmp, clTeeColor)
      tmp2 = .AddValue(20, "K", tmp1, clTeeColor)
      .AddValue 40, "P", tmp2, clTeeColor
      tmp2 = .AddValue(34, "L", tmp1, clTeeColor)
      .AddValue 24, "Q", tmp2, clTeeColor
      .AddValue 13, "E", tmp, clTeeColor
      .AddValue 10, "F", tmp, clTeeColor
      tmp1 = .AddValue(19, "G", tmp, clTeeColor)
      .AddValue 16, "M", tmp1, clTeeColor
      
      .Format.Shadow.Visible = True
      Combo1.ListIndex = 0
    End With
  End With
End Sub

