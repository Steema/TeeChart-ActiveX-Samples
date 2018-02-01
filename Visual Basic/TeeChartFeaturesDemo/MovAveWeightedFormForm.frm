VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MovAveWeightedFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3495
   ClientTop       =   2235
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"MovAveWeightedFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Weighted"
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   1260
      Width           =   1635
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MovAveWeightedFormForm.frx":03C0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MovAveWeightedFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(1).FunctionType.asMovAvg.Weighted = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 100
  TChart1.Series(1).FunctionType.asMovAvg.Weighted = True
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
