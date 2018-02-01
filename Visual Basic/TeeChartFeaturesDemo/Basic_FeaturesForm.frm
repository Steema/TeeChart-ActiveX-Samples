VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Basic_FeaturesForm 
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
   Begin TeeChart.TChart MyChart 
      Height          =   4605
      Left            =   3720
      TabIndex        =   0
      Top             =   2280
      Width           =   7740
      Base64          =   $"Basic_FeaturesForm.frx":0000
   End
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   3015
      OleObjectBlob   =   "Basic_FeaturesForm.frx":00C0
      Top             =   1755
   End
   Begin VB.TextBox Text2 
      Height          =   4605
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Text            =   "Basic_FeaturesForm.frx":011C
      Top             =   2280
      Width           =   3705
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1740
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Basic_FeaturesForm.frx":02CA
      Top             =   0
      Width           =   11460
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Show the Chart Editor"
      Height          =   345
      Left            =   4140
      TabIndex        =   2
      Top             =   1830
      Width           =   2490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Run the code"
      Height          =   345
      Left            =   600
      TabIndex        =   1
      Top             =   1830
      Width           =   1695
   End
End
Attribute VB_Name = "Basic_FeaturesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With MyChart
  .RemoveAllSeries
  .AddSeries scBar
  .Series(0).Clear
  .Series(0).Add 123, "ABC", vbRed
  .Series(0).Add 456, "DEF", vbBlue
  .Series(0).Add 321, "GHI", vbGreen
  .Series(0).Marks.Style = smsValue
End With
End Sub

Private Sub Command2_Click()
  TeeEditor1.Chart = MyChart
  TeeEditor1.ShowEditor
End Sub
