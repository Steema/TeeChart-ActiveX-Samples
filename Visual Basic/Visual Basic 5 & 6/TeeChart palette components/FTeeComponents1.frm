VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart palette components"
   ClientHeight    =   5310
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8880
   LinkTopic       =   "Form1"
   ScaleHeight     =   5310
   ScaleWidth      =   8880
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Align           =   3  'Align Left
      Height          =   4785
      Left            =   0
      OleObjectBlob   =   "FTeeComponents1.frx":0000
      TabIndex        =   0
      Top             =   525
      Width           =   5685
   End
   Begin TeeChart.TeeListBox TeeListBox1 
      Align           =   4  'Align Right
      Height          =   4785
      Left            =   5775
      OleObjectBlob   =   "FTeeComponents1.frx":0521
      TabIndex        =   1
      Top             =   525
      Width           =   3105
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   1  'Align Top
      Height          =   525
      Left            =   0
      OleObjectBlob   =   "FTeeComponents1.frx":057C
      TabIndex        =   2
      Top             =   0
      Width           =   8880
      Begin TeeChart.TeePreviewer TeePreviewer1 
         Height          =   390
         Left            =   7200
         OleObjectBlob   =   "FTeeComponents1.frx":05C8
         TabIndex        =   4
         Top             =   75
         Visible         =   0   'False
         Width           =   420
      End
      Begin TeeChart.TeeEditor TeeEditor1 
         Height          =   330
         Left            =   6765
         OleObjectBlob   =   "FTeeComponents1.frx":05F7
         TabIndex        =   3
         Top             =   105
         Visible         =   0   'False
         Width           =   345
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  'Associate TeeChart components with Chart
  TeeCommander1.Chart = TChart1
  TeeListBox1.Chart = TChart1
  TeeEditor1.Chart = TChart1
  TeePreviewer1.Chart = TChart1
  
  'Associate the TeeCommander editor and previewer with
  'TeeEditor1 and TeePreviewer1
  TeeCommander1.Editor = TeeEditor1
  TeeCommander1.Previewer = TeePreviewer1
  
  'Change some settings of the Editor and Previewer
  TeeEditor1.Options.Add = False
  TeeEditor1.Options.Delete = False
  TeeEditor1.Options.Clone = False
  TeeEditor1.Options.DataSource = False
  
  TeePreviewer1.PaperColor = RGB(255, 255, 192)

  'FillChart
  TChart1.Series(0).FillSampleValues 10
  TChart1.Series(1).FillSampleValues 10
  TChart1.Series(2).FillSampleValues 10
  
End Sub

Private Sub Form_Resize()
  TChart1.Width = Form1.Width - TeeListBox1.Width - 150
End Sub


