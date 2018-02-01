VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PostScript_DemoForm 
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
      Height          =   5670
      Left            =   0
      TabIndex        =   0
      Top             =   1245
      Width           =   11505
      Base64          =   $"PostScript_DemoForm.frx":0000
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5265
      Top             =   810
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   "eps"
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "PostScript_DemoForm.frx":00F2
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Export to PostScript..."
      Height          =   345
      Left            =   120
      TabIndex        =   1
      Top             =   795
      Width           =   2550
   End
End
Attribute VB_Name = "PostScript_DemoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
CommonDialog1.Filter = "EPS (*.eps)"
CommonDialog1.ShowSave
If CommonDialog1.FileName <> "" Then
TChart1.Export.asEPS.SaveToFile CommonDialog1.FileName
End If
End Sub

Private Sub Form_Load()
  With TChart1
    .Panel.BevelInner = bvNone
    .Panel.BevelOuter = bvNone
    For i = 0 To 2
        .AddSeries scLine
        .Series(i).FillSampleValues (10)
    Next i
    .Aspect.View3D = False
  End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub
