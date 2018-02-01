VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartListBox_FontSeriesColor 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox Check1 
      Caption         =   "Font Series color"
      Height          =   195
      Left            =   270
      TabIndex        =   3
      Top             =   1050
      Value           =   1  'Checked
      Width           =   1755
   End
   Begin TeeChart.TeeListBox TeeListBox1 
      Height          =   5415
      Left            =   0
      OleObjectBlob   =   "ChartListBox_FontSeriesColor.frx":0000
      TabIndex        =   2
      Top             =   1470
      Width           =   2085
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5415
      Left            =   2100
      TabIndex        =   1
      Top             =   1455
      Width           =   9360
      Base64          =   $"ChartListBox_FontSeriesColor.frx":005A
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartListBox_FontSeriesColor.frx":0F90
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ChartListBox_FontSeriesColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TeeListBox1.FontSeriesColor = Check1.Value
End Sub

Private Sub Form_Load()
  With TeeListBox1
    .ChartLink = TChart1.ChartLink
    .FontSeriesColor = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
