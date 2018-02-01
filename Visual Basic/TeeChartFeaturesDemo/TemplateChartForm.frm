VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TemplateChartForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3825
   ClientTop       =   2745
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart2 
      Height          =   5265
      Left            =   5460
      TabIndex        =   2
      Top             =   1620
      Width           =   6015
      Base64          =   $"TemplateChartForm.frx":0000
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   5460
      Base64          =   $"TemplateChartForm.frx":00B8
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Edit Chart2"
      Height          =   345
      Left            =   1860
      TabIndex        =   6
      Top             =   1200
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Include data with import"
      Height          =   195
      Left            =   5070
      TabIndex        =   5
      Top             =   1260
      Value           =   1  'Checked
      Width           =   2055
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Import Chart1"
      Height          =   345
      Left            =   3540
      TabIndex        =   4
      Top             =   1200
      Width           =   1275
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Chart1"
      Height          =   345
      Left            =   180
      TabIndex        =   3
      Top             =   1200
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "TemplateChartForm.frx":02E2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "TemplateChartForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Command2_Click()
  TChart2.ClearChart
  TChart2.Import.LoadFromStream TChart1.Export.asNative.SaveToStream(Check1.Value)
End Sub

Private Sub Command3_Click()
  TChart2.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 15
End Sub

