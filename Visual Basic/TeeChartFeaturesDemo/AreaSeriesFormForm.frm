VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AreaSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2970
   ClientTop       =   2265
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"AreaSeriesFormForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "AreaSeriesFormForm.frx":0A94
      Left            =   720
      List            =   "AreaSeriesFormForm.frx":0AA1
      TabIndex        =   6
      Text            =   "3D"
      Top             =   1080
      Width           =   1155
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Editor"
      Height          =   345
      Left            =   5460
      TabIndex        =   5
      Top             =   1080
      Width           =   1035
   End
   Begin VB.CheckBox Check2 
      Caption         =   "3D"
      Height          =   195
      Left            =   3360
      TabIndex        =   4
      Top             =   1140
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs"
      Height          =   195
      Left            =   2100
      TabIndex        =   3
      Top             =   1140
      Width           =   1155
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AreaSeriesFormForm.frx":0AC0
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Layout:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1140
      Width           =   555
   End
End
Attribute VB_Name = "AreaSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
Dim i
  With TChart1
    For i = 0 To .SeriesCount - 1
      .Series(i).asArea.Stairs = Check1.Value
    Next i
  End With
End Sub

Private Sub Check2_Click()
  TChart1.Aspect.View3D = Check2.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  TChart1.Series(0).asArea.MultiArea = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub


Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 6
    .Series(1).FillSampleValues 6
    .Series(2).FillSampleValues 6
  End With
End Sub
