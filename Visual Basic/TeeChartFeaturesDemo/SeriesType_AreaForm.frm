VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_AreaForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"SeriesType_AreaForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs"
      Height          =   195
      Left            =   2475
      TabIndex        =   6
      Top             =   1290
      Width           =   870
   End
   Begin VB.CheckBox Check5 
      Caption         =   "3D"
      Height          =   195
      Left            =   3465
      TabIndex        =   5
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1140
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesType_AreaForm.frx":0442
      Left            =   900
      List            =   "SeriesType_AreaForm.frx":044F
      TabIndex        =   3
      Text            =   "Combo1"
      Top             =   1245
      Width           =   1320
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SeriesType_AreaForm.frx":046E
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5535
      TabIndex        =   1
      Top             =   1245
      Width           =   1050
   End
   Begin VB.Label Label2 
      Caption         =   "Layout :"
      Height          =   240
      Left            =   135
      TabIndex        =   4
      Top             =   1290
      Width           =   825
   End
End
Attribute VB_Name = "SeriesType_AreaForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    

Private Sub Check1_Click()
TChart1.Series(0).asArea.Stairs = Check1.Value
TChart1.Series(1).asArea.Stairs = Check1.Value
TChart1.Series(2).asArea.Stairs = Check1.Value
End Sub

Private Sub Check5_Click()
TChart1.Aspect.View3D = Check5.Value
End Sub

Private Sub Combo1_Click()
With TChart1
  Select Case Combo1.ListIndex
    Case 0: .Series(2).asArea.MultiArea = maNone
    Case 1: .Series(2).asArea.MultiArea = maStacked
    Case 2: .Series(2).asArea.MultiArea = maStacked100
  End Select
  'remove "Marks" when stackeng...
  .Series(0).Marks.Visible = .Series(0).asArea.MultiArea = maNone
  .Series(1).Marks.Visible = .Series(1).asArea.MultiArea = maNone
  .Series(2).Marks.Visible = .Series(2).asArea.MultiArea = maNone
End With
End Sub

Private Sub Command2_Click()
TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
With TChart1
    For i = 0 To 2
      .AddSeries scArea
      .Series(i).FillSampleValues (6)
      .Series(i).Marks.Visible = True
    Next i
End With
Combo1.ListIndex = 0
End Sub
