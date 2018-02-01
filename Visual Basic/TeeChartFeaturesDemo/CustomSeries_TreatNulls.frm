VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CustomSeries_TreatNulls 
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
   Begin VB.CheckBox Check3 
      Caption         =   "Antialias"
      Height          =   195
      Left            =   8040
      TabIndex        =   8
      Top             =   1260
      Width           =   1005
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Filled"
      Height          =   195
      Left            =   6930
      TabIndex        =   7
      Top             =   1260
      Value           =   1  'Checked
      Width           =   765
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Null point 5"
      Height          =   195
      Left            =   5430
      TabIndex        =   6
      Top             =   1260
      Width           =   1215
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "CustomSeries_TreatNulls.frx":0000
      Left            =   3840
      List            =   "CustomSeries_TreatNulls.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1200
      Width           =   1275
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "CustomSeries_TreatNulls.frx":002C
      Left            =   1140
      List            =   "CustomSeries_TreatNulls.frx":003F
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1200
      Width           =   1575
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"CustomSeries_TreatNulls.frx":0073
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1065
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "CustomSeries_TreatNulls.frx":0829
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Treat Nulls:"
      Height          =   195
      Left            =   2970
      TabIndex        =   4
      Top             =   1260
      Width           =   810
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Series Type:"
      Height          =   195
      Left            =   180
      TabIndex        =   3
      Top             =   1260
      Width           =   885
   End
End
Attribute VB_Name = "CustomSeries_TreatNulls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If Check1.Value Then
    TChart1.Series(0).SetNull 5
  Else
    TChart1.Series(0).PointColor(5) = RGB(64, 0, 128)
  End If
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
     TChart1.Series(0).Brush.Style = bsSolid
  Else
     TChart1.Series(0).Brush.Style = bsClear
  End If
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(0).Active = Check3.Value
End Sub

Private Sub Combo1_Change()
  TChart1.SeriesList.ClearValues

  Select Case Combo1.ListIndex
    Case 0: TChart1.ChangeSeriesType 0, scPolar
    Case 1: TChart1.ChangeSeriesType 0, scRadar
    Case 2: TChart1.ChangeSeriesType 0, scPolarBar
    Case 3: TChart1.ChangeSeriesType 0, scPolarGrid
    Case 0: TChart1.ChangeSeriesType 0, scWindRose
  End Select
  
  TChart1.Series(0).FillSampleValues 10

  If Check1.Value Then
     TChart1.Series(0).SetNull 5
  End If
  
'  TChart1.Series(0).asPolar.TreatNulls = Combo2.ListIndex

  If Check2.Value Then
     TChart1.Series(0).Brush.Style = bsSolid
  Else
     TChart1.Series(0).Brush.Style = bsClear
  End If
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo2_Change()
'  TChart1.Series(0).asPolar.TreatNulls = Combo2.ListIndex
End Sub

Private Sub Combo2_Click()
  Combo1_Click
End Sub

Private Sub Form_Load()
  TChart1.ApplyPalette cpMacOS
  
  TChart1.Axis.Left.AutomaticMinimum = False
  TChart1.Axis.Left.Minimum = -1000
  
  Combo1.ListIndex = 0
  Combo2.ListIndex = 0
  
  Check1.Value = Checked
  
  TChart1.Series(0).FillSampleValues 25
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
