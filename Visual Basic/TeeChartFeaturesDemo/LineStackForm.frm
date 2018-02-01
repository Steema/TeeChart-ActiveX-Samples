VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LineStackForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2355
   ClientTop       =   2430
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"LineStackForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "LineStackForm.frx":0C54
      Left            =   1560
      List            =   "LineStackForm.frx":0C64
      TabIndex        =   2
      Text            =   "Normal"
      Top             =   1290
      Width           =   1635
   End
   Begin VB.Label Label2 
      Caption         =   "Mode:"
      Height          =   195
      Left            =   1020
      TabIndex        =   3
      Top             =   1350
      Width           =   495
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   1215
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "LineStackForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  TChart1.Series(0).asLine.Stacked = Combo1.ListIndex
End Sub

Private Sub Form_Load()
  Label1.Caption = "Line Series can now be Stacked and Overlapped." & Chr(13) _
    & Chr(13) _
    & "Example: TChart1.Series(0).asLine.Stacked = cssOverlap"
  With TChart1
    .Series(0).FillSampleValues 15
    .Series(1).FillSampleValues 15
    .Series(2).FillSampleValues 15
    .Series(3).FillSampleValues 15
  End With
End Sub
