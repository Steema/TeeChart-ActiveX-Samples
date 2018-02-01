VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ExportPDFForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2460
   ClientTop       =   2205
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   0
      Top             =   1350
      Width           =   11505
      Base64          =   $"ExportPDFForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Show Export dialog"
      Height          =   435
      Left            =   4500
      TabIndex        =   3
      Top             =   840
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save to PDF"
      Height          =   435
      Left            =   60
      TabIndex        =   2
      Top             =   840
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ExportPDFForm.frx":09BA
      Top             =   0
      Width           =   11490
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6300
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "ExportPDFForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  With TChart1.Export.asPDF
    CommonDialog1.Filter = "PDF files(*.pdf)|*.pdf"
    CommonDialog1.ShowSave
     If CommonDialog1.FileName <> "" Then
       .SaveToFile CommonDialog1.FileName
     End If
  End With
End Sub

Private Sub Command2_Click()
  TChart1.Export.ShowExport
End Sub

Private Sub Form_Load()
  TChart1.Panel.Color = vbWhite
  TChart1.Panel.BevelOuter = bvNone
  With TChart1
    .Series(0).FillSampleValues 7
    .Series(1).FillSampleValues 7
    .Series(2).FillSampleValues 7
  End With
End Sub

Private Sub TChart1_OnAfterDraw()
  TChart1.Canvas.Pie 100, 100, 150, 300, 150, 100, 200, 200
End Sub
