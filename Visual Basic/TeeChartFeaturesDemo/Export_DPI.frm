VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Export_DPI 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   8730
      Top             =   1350
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   1290
      Max             =   1
      Min             =   10000
      TabIndex        =   6
      Top             =   1275
      Value           =   300
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   825
      TabIndex        =   5
      Text            =   "300"
      Top             =   1305
      Width           =   435
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Show &Export dialog..."
      Height          =   375
      Left            =   5670
      TabIndex        =   4
      Top             =   1260
      Width           =   1725
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save to &JPEG..."
      Height          =   375
      Left            =   3825
      TabIndex        =   3
      Top             =   1260
      Width           =   1725
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Save to &Bitmap..."
      Height          =   375
      Left            =   2025
      TabIndex        =   2
      Top             =   1260
      Width           =   1725
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Export_DPI.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Export_DPI.frx":1E4E
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "DPI:"
      Height          =   240
      Left            =   450
      TabIndex        =   7
      Top             =   1335
      Width           =   315
   End
End
Attribute VB_Name = "Export_DPI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  CommonDialog1.Filter = "Bitmap (*.bmp)| *.bmp"
  CommonDialog1.ShowSave
  If CommonDialog1.FileName <> "" Then
       TChart1.Export.SaveToBitmapFile CommonDialog1.FileName, _
       VScroll1.Value
  End If
End Sub

Private Sub Command2_Click()
  CommonDialog1.Filter = "JPEG (*.jpg) | *.jpg"
  CommonDialog1.ShowSave
  If CommonDialog1.FileName <> "" Then
     TChart1.Export.SaveToJPEGFile CommonDialog1.FileName, False, jpegBestQuality, 100, TChart1.Width, TChart1.Height, _
       VScroll1.Value
  End If
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



