VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form HorizLineFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2430
   ClientTop       =   3105
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   2  'Align Bottom
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "HorizLineFormForm.frx":0000
      TabIndex        =   3
      Top             =   1395
      Width           =   11505
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5025
      Left            =   0
      TabIndex        =   1
      Top             =   1890
      Width           =   11505
      Base64          =   $"HorizLineFormForm.frx":0066
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs"
      Height          =   315
      Left            =   240
      TabIndex        =   2
      Top             =   900
      Width           =   1395
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "HorizLineFormForm.frx":079C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "HorizLineFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asHorizLine.Stairs = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 12
  TeeCommander1.Chart = TChart1
End Sub
