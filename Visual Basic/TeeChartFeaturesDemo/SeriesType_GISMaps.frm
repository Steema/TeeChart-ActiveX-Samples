VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_GISMaps 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Axes"
      Height          =   195
      Left            =   5940
      TabIndex        =   6
      Top             =   1020
      Width           =   765
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesType_GISMaps.frx":0000
      Left            =   3510
      List            =   "SeriesType_GISMaps.frx":002E
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   960
      Width           =   1905
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   1710
      TabIndex        =   3
      Top             =   960
      Width           =   1035
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Border..."
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5535
      Left            =   0
      TabIndex        =   1
      Top             =   1380
      Width           =   11505
      Base64          =   $"SeriesType_GISMaps.frx":00CF
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "SeriesType_GISMaps.frx":01DD
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Map:"
      Height          =   195
      Left            =   3060
      TabIndex        =   4
      Top             =   1020
      Width           =   360
   End
End
Attribute VB_Name = "SeriesType_GISMaps"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Axis.Visible = Check1.Value
End Sub

Private Sub Combo1_Change()
'   Change the map:
  Select Case Combo1.ListIndex
    Case 0: TChart1.Series(0).asWorld.Map = wmWorld
    Case 1: TChart1.Series(0).asWorld.Map = wmAfrica
    Case 2: TChart1.Series(0).asWorld.Map = wmAsia
    Case 3: TChart1.Series(0).asWorld.Map = wmAustralia
    Case 4: TChart1.Series(0).asWorld.Map = wmCentralAmerica
    Case 5: TChart1.Series(0).asWorld.Map = wmEurope
    Case 6: TChart1.Series(0).asWorld.Map = wmEurope15
    Case 7: TChart1.Series(0).asWorld.Map = wmEurope27
    Case 8: TChart1.Series(0).asWorld.Map = wmSpain
    Case 9: TChart1.Series(0).asWorld.Map = wmMiddleEast
    Case 10: TChart1.Series(0).asWorld.Map = wmNorthAmerica
    Case 11: TChart1.Series(0).asWorld.Map = wmSouthAmerica
    Case 12: TChart1.Series(0).asWorld.Map = wmUSA
    Case 13: TChart1.Series(0).asWorld.Map = wmUSAHawaiiAlaska
  End Select

'   Now fill the new map with some sample values:
  TChart1.Series(0).FillSampleValues
End Sub


Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).Pen.ShowEditor
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scWorld
  Combo1.ListIndex = 7
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
