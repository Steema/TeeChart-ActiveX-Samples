VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Area_StairsForm 
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
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"Area_StairsForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1110
      Value           =   1  'Checked
      Width           =   1320
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1020
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Area_StairsForm.frx":04B6
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Area_StairsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
With TChart1
    .Series(0).asArea.Stairs = Check1.Value
    .Series(1).asArea.Stairs = Check1.Value
End With
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scArea
    .AddSeries scArea
    .Series(0).FillSampleValues 10
    .Series(1).FillSampleValues 10
    .Series(0).asArea.MultiArea = maStacked
    Check1_Click
End With
End Sub
