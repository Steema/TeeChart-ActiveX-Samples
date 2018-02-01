VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Export_OpenDocument 
   BackColor       =   &H80000005&
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
   Begin VB.CheckBox Check1 
      BackColor       =   &H80000005&
      Caption         =   "Include Point index"
      Height          =   255
      Left            =   4890
      TabIndex        =   4
      Top             =   1050
      Value           =   1  'Checked
      Width           =   1935
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4260
      Top             =   900
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Show &Export dialog..."
      Height          =   465
      Left            =   2190
      TabIndex        =   3
      Top             =   930
      Width           =   1965
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Save to file..."
      Height          =   465
      Left            =   150
      TabIndex        =   2
      Top             =   930
      Width           =   1995
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"Export_OpenDocument.frx":0000
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   735
      Left            =   150
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Export_OpenDocument.frx":2438
      Top             =   90
      Width           =   11175
   End
End
Attribute VB_Name = "Export_OpenDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Export.asOpenDocument.IncludeIndex = Check1.Value
End Sub

Private Sub Command1_Click()
  With TChart1.Export.asOpenDocument
  CommonDialog1.Filter = "JSON (*.odt)| *.odt"
  CommonDialog1.ShowSave
     If CommonDialog1.FileName <> "" Then
       .IncludeIndex = Check1.Value
       .SaveToFile CommonDialog1.FileName
     End If
  End With
End Sub

Private Sub Command3_Click()
  TChart1.Export.ShowExport
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub



