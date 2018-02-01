VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartListBox_RadioForm 
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
      Height          =   5295
      Left            =   2160
      TabIndex        =   0
      Top             =   1575
      Width           =   9315
      Base64          =   $"ChartListBox_RadioForm.frx":0000
   End
   Begin TeeChart.TeeListBox TeeListBox1 
      Height          =   5295
      Left            =   -15
      OleObjectBlob   =   "ChartListBox_RadioForm.frx":0432
      TabIndex        =   3
      Top             =   1575
      Width           =   2175
   End
   Begin VB.Frame Frame1 
      Caption         =   "Check Style :"
      Height          =   600
      Left            =   45
      TabIndex        =   2
      Top             =   945
      Width           =   2175
      Begin VB.OptionButton Option1 
         Caption         =   "Check"
         Height          =   315
         Index           =   0
         Left            =   90
         TabIndex        =   5
         Top             =   225
         Value           =   -1  'True
         Width           =   840
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Radio"
         Height          =   315
         Index           =   1
         Left            =   1035
         TabIndex        =   4
         Top             =   225
         Width           =   975
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartListBox_RadioForm.frx":048C
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartListBox_RadioForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
  For i = 0 To 3
    .AddSeries scLine
    .Series(i).FillSampleValues (5)
  Next i
End With
TeeListBox1.Chart = TChart1
End Sub

Private Sub Option1_Click(Index As Integer)
  Select Case Index
    Case 0: TeeListBox1.CheckStyle = cbsCheck
    Case 1: TeeListBox1.CheckStyle = cbsRadio
  End Select
End Sub



Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
