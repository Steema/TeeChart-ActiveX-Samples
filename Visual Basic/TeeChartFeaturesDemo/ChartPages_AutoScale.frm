VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartPages_AutoScale 
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
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   435
      Left            =   330
      OleObjectBlob   =   "ChartPages_AutoScale.frx":0000
      TabIndex        =   3
      Top             =   990
      Width           =   3840
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Auto scale axis"
      Height          =   195
      Left            =   4590
      TabIndex        =   2
      Top             =   1110
      Width           =   1485
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"ChartPages_AutoScale.frx":0052
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartPages_AutoScale.frx":08A4
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartPages_AutoScale"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Page.AutoScale = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 100
  
  TChart1.Page.MaxPointsPerPage = 10
  TChart1.Page.AutoScale = True
  
  Check1.Value = Checked
  ChartPageNavigator1.ChartLink = TChart1.ChartLink
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
