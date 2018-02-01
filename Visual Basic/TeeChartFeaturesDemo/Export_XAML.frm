VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Export_XAML 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6240
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   "xaml"
      Filter          =   "*.xaml"
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Show Export dialog..."
      Height          =   345
      Left            =   2130
      TabIndex        =   3
      Top             =   1050
      Width           =   2085
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save to XAML..."
      Height          =   345
      Left            =   180
      TabIndex        =   2
      Top             =   1050
      Width           =   1725
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Export_XAML.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Export_XAML.frx":0284
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Export_XAML"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  CommonDialog1.ShowSave
  If CommonDialog1.FileName <> "" Then
    TChart1.Export.asXAML.SaveToFile CommonDialog1.FileName
  End If
End Sub

Private Sub Command2_Click()
  TChart1.Export.ShowExport
End Sub

Private Sub Form_Load()
  With TChart1
    .Panel.Gradient.Visible = True
    .Panel.Gradient.MidColor = RGB(0, 128, 0)
    .Header.Font.Bold = True
  End With

End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
