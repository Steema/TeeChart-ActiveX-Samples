VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PrintPreviewNavigateForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2925
   ClientTop       =   1740
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   270
      Left            =   2160
      OleObjectBlob   =   "PrintPreviewNavigateForm.frx":0000
      TabIndex        =   2
      Top             =   1140
      Width           =   2940
   End
   Begin TeeChart.TeePreviewPanel TeePreviewPanel1 
      Height          =   5385
      Left            =   0
      OleObjectBlob   =   "PrintPreviewNavigateForm.frx":0053
      TabIndex        =   1
      Top             =   1500
      Width           =   5475
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5385
      Left            =   5490
      TabIndex        =   0
      Top             =   1500
      Width           =   5985
      Base64          =   $"PrintPreviewNavigateForm.frx":00A3
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "PrintPreviewNavigateForm.frx":0449
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PrintPreviewNavigateForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim isDirty

Private Sub Form_Load()
  ChartPageNavigator1.Chart = TChart1
  With TChart1
    .AddSeries scArea
    .Series(0).FillSampleValues 100
    .Page.MaxPointsPerPage = 10
    TeePreviewPanel1.Chart = TChart1
    TeePreviewPanel1.Orientation = ppoPortrait
  End With
  isDirty = False
  TeePreviewPanel1.Visible = False
End Sub

Private Sub TChart1_OnAfterDraw()
  TeePreviewPanel1.Repaint
  If TeePreviewPanel1.Visible = False Then
    TeePreviewPanel1.Visible = True
    DoEvents
  End If
End Sub

Private Sub TeePreviewPanel1_GotFocus()
 updateForm
End Sub

Private Sub TeePreviewPanel1_LostFocus()
  updateForm
End Sub

Private Sub TeePreviewPanel1_OnAfterDraw()
  isDirty = True
End Sub

Private Sub updateForm()
 If isDirty = True Then
   isDirty = False
   DoEvents
 End If
End Sub

