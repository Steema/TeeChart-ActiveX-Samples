VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BarStackNegativeForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2940
   ClientTop       =   3285
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   465
      Left            =   0
      OleObjectBlob   =   "BarStackNegativeForm.frx":0000
      TabIndex        =   2
      Top             =   750
      Width           =   7050
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5685
      Left            =   0
      TabIndex        =   0
      Top             =   1230
      Width           =   11505
      Base64          =   $"BarStackNegativeForm.frx":0066
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BarStackNegativeForm.frx":0AA0
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "BarStackNegativeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
Dim a, b, c As Variant
'Dim bArr As Variant
'Dim cArr As Variant
  aArr = Array(23, -56, 42, 9, -8)
  bArr = Array(32, -16, 9, 39, -28)
  cArr = Array(12, -21, 14, 22, -13)
  TeeCommander1.Chart = TChart1
  With TChart1
    .Series(0).AddArray 5, aArr
    .Series(1).AddArray 5, bArr
    .Series(2).AddArray 5, cArr
  End With
End Sub
