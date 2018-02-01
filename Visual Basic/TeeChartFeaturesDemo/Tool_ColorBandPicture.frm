VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_ColorBandPicture 
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
   Begin VB.CommandButton Command4 
      Caption         =   "Edit"
      Height          =   345
      Left            =   5640
      TabIndex        =   7
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Filters"
      Height          =   345
      Left            =   4320
      TabIndex        =   6
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Load"
      Enabled         =   0   'False
      Height          =   345
      Left            =   3240
      TabIndex        =   5
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      Caption         =   "..."
      Height          =   285
      Left            =   2520
      TabIndex        =   4
      Top             =   1245
      Width           =   375
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   720
      TabIndex        =   3
      Top             =   1245
      Width           =   1815
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool_ColorBandPicture.frx":0000
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   1200
         Top             =   2640
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_ColorBandPicture.frx":13B8E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Picture:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1260
      Width           =   540
   End
End
Attribute VB_Name = "Tool_ColorBandPicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  CommonDialog1.ShowOpen
  If CommonDialog1.FileName <> "" Then
        
    Text2.Text = CommonDialog1.FileName
    Command2.Enabled = True
  End If
End Sub

Private Sub Command2_Click()
  If FileExists(Text2.Text) = True Then
    TChart1.Tools.Items(0).asColorband.Picture.LoadImage (Text2.Text)
    TChart1.Repaint
    Command2.Enabled = False
  Else
    MsgBox "Not a valid filename: " + Text2.Text
  End If
End Sub

Private Sub Command3_Click()
  If TChart1.Tools.Items(0).asColorband.Picture.ShowFiltersEditor Then
    TChart1.Repaint
  End If
End Sub

Private Sub Command4_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Function FileExists(FileName As String) As Boolean
On Error GoTo ErrorHandler
  FileExists = (GetAttr(FileName) And vbDirectory) = 0
ErrorHandler:
End Function
