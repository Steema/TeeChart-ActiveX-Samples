VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PrintPagesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3300
   ClientTop       =   3405
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   1
      Top             =   1740
      Width           =   11505
      Base64          =   $"PrintPagesFormForm.frx":0000
   End
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   270
      Left            =   2700
      OleObjectBlob   =   "PrintPagesFormForm.frx":0432
      TabIndex        =   2
      Top             =   1350
      Width           =   3660
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Print all pages"
      Height          =   345
      Left            =   360
      TabIndex        =   3
      Top             =   1320
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "PrintPagesFormForm.frx":0485
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PrintPagesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  With TChart1.Printer
    .PrintPages 1, TChart1.Page.Count
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scBar
    .Series(0).FillSampleValues 30
    .Page.MaxPointsPerPage = 10
  End With
  ChartPageNavigator1.Chart = TChart1
End Sub
