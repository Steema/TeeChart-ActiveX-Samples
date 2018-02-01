VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ExportEmailFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3270
   ClientTop       =   2475
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"ExportEmailFormForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Send email"
      Height          =   375
      Left            =   1860
      TabIndex        =   3
      Top             =   1020
      Width           =   1275
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Export"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   1020
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ExportEmailFormForm.frx":0788
      Top             =   0
      Width           =   11490
   End
   Begin VB.Frame Frame1 
      Caption         =   "Export format"
      Height          =   555
      Left            =   3300
      TabIndex        =   4
      Top             =   900
      Width           =   3735
      Begin VB.OptionButton Option1 
         Caption         =   "JPEG"
         Height          =   315
         Index           =   2
         Left            =   2640
         TabIndex        =   7
         Top             =   180
         Width           =   855
      End
      Begin VB.OptionButton Option1 
         Caption         =   "PNG"
         Height          =   315
         Index           =   1
         Left            =   1500
         TabIndex        =   6
         Top             =   180
         Width           =   915
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Bitmap"
         Height          =   315
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   180
         Value           =   -1  'True
         Width           =   1095
      End
   End
End
Attribute VB_Name = "ExportEmailFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim OpIndex As Integer

Private Sub Command1_Click()
  TChart1.Export.ShowExport
End Sub

Private Sub Command2_Click()
Dim FileName
 On Error Resume Next

 With TChart1.Export
  Select Case OpIndex
    Case 0
      FileName = "tmp.bmp"
      .asBMP.SaveToFile FileName
    Case 1
      FileName = "tmp.png"
      .asPNG.SaveToFile FileName
    Case 2
      FileName = "tmp.jpg"
      .asJPEG.SaveToFile FileName
  End Select
  .EmailFile FileName
 End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
End Sub

Private Sub Option1_Click(Index As Integer)
  Select Case Index
    Case 0
      OpIndex = 0
    Case 1
      OpIndex = 1
    Case 2
      OpIndex = 2
  End Select
End Sub


