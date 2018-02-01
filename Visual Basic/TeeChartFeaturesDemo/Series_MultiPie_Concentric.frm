VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_MultiPie_Concentric 
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
   Begin VB.CheckBox Check2 
      Caption         =   "Concentric"
      Height          =   255
      Left            =   1260
      TabIndex        =   3
      Top             =   1230
      Value           =   1  'Checked
      Width           =   2085
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1230
      Width           =   885
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   1
      Top             =   1560
      Width           =   11505
      Base64          =   $"Series_MultiPie_Concentric.frx":0000
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_MultiPie_Concentric.frx":0C06
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series_MultiPie_Concentric"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
    TChart1.Series(0).asPie.MultiPie = mpConcentric
    TChart1.Series(1).asPie.MultiPie = mpConcentric
    TChart1.Series(1).Transparency = 50
  Else
    TChart1.Series(0).asPie.MultiPie = mpAutomatic
    TChart1.Series(1).asPie.MultiPie = mpAutomatic
    TChart1.Series(1).Transparency = 50
  End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues
  TChart1.Series(1).FillSampleValues
  With TChart1.Series(0).asPie
    .MultiPie = mpConcentric
    .PiePen.Visible = False
  End With
  With TChart1.Series(1).asPie
    .MultiPie = mpConcentric
    .PiePen.Visible = False
  End With
  TChart1.Series(0).Marks.Transparent = True
  TChart1.Series(1).Marks.Transparent = True
  TChart1.Series(1).Transparency = 50
  TChart1.Legend.Visible = False
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

