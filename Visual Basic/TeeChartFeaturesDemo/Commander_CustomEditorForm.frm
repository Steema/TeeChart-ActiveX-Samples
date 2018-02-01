VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Commander_CustomEditorForm 
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
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"Commander_CustomEditorForm.frx":0000
      Begin TeeChart.TeePreviewer TeePreviewer1 
         Left            =   4500
         OleObjectBlob   =   "Commander_CustomEditorForm.frx":0416
         Top             =   1170
      End
      Begin TeeChart.TeeEditor TeeEditor1 
         Left            =   1890
         OleObjectBlob   =   "Commander_CustomEditorForm.frx":0445
         Top             =   2250
      End
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   480
      Left            =   0
      OleObjectBlob   =   "Commander_CustomEditorForm.frx":04A1
      TabIndex        =   2
      Top             =   930
      Width           =   7035
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Commander_CustomEditorForm.frx":04ED
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Commander_CustomEditorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
' This can be done at design-time.
' This code is how to do it programatically
  TeeCommander1.Chart = TChart1
  TeeCommander1.Editor = TeeEditor1
  TeeCommander1.Previewer = TeePreviewer1
  TeeEditor1.EditorTitle = "My custom Editor Dialog"
  TeePreviewer1.PreviewTitle = "My custom Preview Dialog"
  TeeEditor1.Chart = TChart1
  TeePreviewer1.Chart = TChart1

End Sub

Private Sub TeeCommander1_OnEditedChart()
  ' Force "Tree" editor mode at editor OnShow event
  TeeEditor1.TreeView = True
End Sub
