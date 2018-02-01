VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendStyleForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3660
   ClientTop       =   3210
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5595
      Left            =   0
      TabIndex        =   0
      Top             =   1320
      Width           =   11505
      Base64          =   $"LegendStyleForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "LegendStyleForm.frx":0A98
      Top             =   0
      Width           =   11490
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "LegendStyleForm.frx":0B15
      Left            =   1740
      List            =   "LegendStyleForm.frx":0B22
      TabIndex        =   2
      Text            =   "Percent"
      Top             =   900
      Width           =   1515
   End
   Begin VB.Label Label2 
      Caption         =   "New &Legend styles:"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   960
      Width           =   1455
   End
End
Attribute VB_Name = "LegendStyleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
TChart1.Legend.TextStyle = Combo1.ItemData(Combo1.ListIndex)
End Sub
Private Sub Form_Load()
TChart1.Series(0).FillSampleValues 7
End Sub
