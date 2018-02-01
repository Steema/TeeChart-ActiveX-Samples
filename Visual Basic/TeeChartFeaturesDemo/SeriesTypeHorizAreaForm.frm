VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesTypeHorizAreaForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"SeriesTypeHorizAreaForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5040
      TabIndex        =   6
      Top             =   1185
      Width           =   1095
   End
   Begin VB.CheckBox Check2 
      Caption         =   "3D"
      Height          =   195
      Left            =   3840
      TabIndex        =   5
      Top             =   1275
      Value           =   1  'Checked
      Width           =   615
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs"
      Height          =   195
      Left            =   2760
      TabIndex        =   4
      Top             =   1275
      Width           =   855
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesTypeHorizAreaForm.frx":0BC4
      Left            =   840
      List            =   "SeriesTypeHorizAreaForm.frx":0BD1
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1230
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesTypeHorizAreaForm.frx":0BF0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Layout:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1290
      Width           =   525
   End
End
Attribute VB_Name = "SeriesTypeHorizAreaForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Series(0).asHorizArea.MultiArea = maNone
    Case 1: TChart1.Series(1).asHorizArea.MultiArea = maStacked
    Case 2: TChart1.Series(2).asHorizArea.MultiArea = maStacked100
  End Select

  ' remove "Marks" when stacking...
  With TChart1
    .Series(0).Marks.Visible = .Series(0).asHorizArea.MultiArea = maNone
    .Series(1).Marks.Visible = .Series(1).asHorizArea.MultiArea = maNone
    .Series(2).Marks.Visible = .Series(2).asHorizArea.MultiArea = maNone
  End With
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Check1_Click()
  TChart1.Series(0).asHorizArea.Stairs = Check1.Value = 1
  TChart1.Series(1).asHorizArea.Stairs = Check1.Value = 1
  TChart1.Series(2).asHorizArea.Stairs = Check1.Value = 1
End Sub

Private Sub Check2_Click()
  TChart1.Aspect.View3D = Check2.Value = 1
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  TChart1.Series(0).FillSampleValues 6
  TChart1.Series(1).FillSampleValues 6
  TChart1.Series(2).FillSampleValues 6
End Sub
