VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form WindAngleIncForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   3255
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   0
      Top             =   1260
      Width           =   11505
      Base64          =   $"WindAngleIncForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "WindAngleIncForm.frx":0736
      Top             =   0
      Width           =   11490
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "WindAngleIncForm.frx":07C1
      Left            =   2400
      List            =   "WindAngleIncForm.frx":07D5
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   840
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "Angle increment:"
      Height          =   255
      Left            =   1080
      TabIndex        =   2
      Top             =   900
      Width           =   1215
   End
End
Attribute VB_Name = "WindAngleIncForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  TChart1.Series(0).asWindRose.AngleIncrement = Combo1.ItemData(Combo1.ListIndex)
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 20
    .Series(0).asWindRose.CircleLabels.Visible = True
    .Series(0).asWindRose.AngleIncrement = 30
  End With
  
  Combo1.ListIndex = 1
End Sub
