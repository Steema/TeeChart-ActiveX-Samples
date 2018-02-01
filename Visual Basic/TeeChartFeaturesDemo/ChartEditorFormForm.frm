VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartEditorFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2310
   ClientTop       =   1710
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5745
      Left            =   0
      TabIndex        =   0
      Top             =   1170
      Width           =   11505
      Base64          =   $"ChartEditorFormForm.frx":0000
   End
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   5160
      OleObjectBlob   =   "ChartEditorFormForm.frx":0638
      Top             =   750
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Show Editor"
      Height          =   345
      Left            =   840
      TabIndex        =   3
      Top             =   750
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Include new Editor tabs"
      Height          =   195
      Left            =   2370
      TabIndex        =   2
      Top             =   810
      Value           =   1  'Checked
      Width           =   2115
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartEditorFormForm.frx":0694
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartEditorFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  With TeeEditor1
    .ShowPages.Tools = Check1.Value
    .ShowPages.ExportDialog = Check1.Value
    .ShowPages.PrintPreview = Check1.Value
    .ShowPages.SeriesData = Check1.Value
  End With
  TeeEditor1.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 7
  
  With TeeEditor1
    .Chart = TChart1
    .ShowPages.Tools = True
    .ShowPages.ExportDialog = True
    .ShowPages.PrintPreview = True
    .ShowPages.SeriesData = True
  End With
End Sub
