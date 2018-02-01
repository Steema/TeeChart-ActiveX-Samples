VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Export_SVGForm 
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
      Height          =   5490
      Left            =   0
      TabIndex        =   0
      Top             =   1425
      Width           =   11505
      Base64          =   $"Export_SVGForm.frx":0000
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   6165
         Top             =   3195
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         Filter          =   "SVG files (*.svg)"
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Export_SVGForm.frx":0CE0
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Show Export dialog..."
      Height          =   345
      Left            =   1620
      TabIndex        =   2
      Top             =   990
      Width           =   2220
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save to SVG..."
      Height          =   345
      Left            =   45
      TabIndex        =   1
      Top             =   990
      Width           =   1515
   End
   Begin VB.Label Label1 
      Caption         =   "Adobe SVG Viewer"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   4230
      TabIndex        =   4
      Top             =   1080
      Width           =   1410
   End
End
Attribute VB_Name = "Export_SVGForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Const SW_NORMAL = 1

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label1.ForeColor = vbBlue
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label1.ForeColor = vbRed
End Sub

Private Sub Label1_Click()
Dim X
X = ShellExecute(Me.hwnd, "Open", "http://www.adobe.com/svg/viewer/install/main.html", &O0, &O0, SW_NORMAL)
Label1.ForeColor = vbBlue
End Sub

Private Sub Command1_Click()
CommonDialog1.ShowSave
If CommonDialog1.FileName <> "" Then
    TChart1.Export.asSVG.SaveToFile CommonDialog1.FileName
End If
End Sub

Private Sub Command2_Click()
TChart1.Export.ShowExport
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues (10)
    .Series(1).FillSampleValues (10)
    .Series(2).FillSampleValues (10)
End With
End Sub

