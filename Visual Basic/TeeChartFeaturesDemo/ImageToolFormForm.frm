VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ImageToolFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   1650
   ClientTop       =   1545
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"ImageToolFormForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   3960
      TabIndex        =   3
      Top             =   1020
      Width           =   1275
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1440
      Max             =   200
      Min             =   50
      TabIndex        =   2
      Top             =   1080
      Value           =   100
      Width           =   2355
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ImageToolFormForm.frx":1E32A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Zoom:"
      Height          =   195
      Left            =   780
      TabIndex        =   4
      Top             =   1080
      Width           =   555
   End
End
Attribute VB_Name = "ImageToolFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim LastPosition As Integer

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
Dim i
  LastPosition = HScroll1.Value
  With TChart1
    .Series(0).FillSampleValues 20
    .Series(1).Clear
    For i = 0 To 50
      .Series(1).AddXY 1 + (Rnd * 19), 1 + (Rnd * 19), "", clTeeColor
    Next i
  End With
End Sub

Private Sub HScroll1_Change()
  With TChart1.Zoom
    If HScroll1.Value > LastPosition Then
      .ZoomPercent 105
    Else
      .ZoomPercent 95
    End If
    LastPosition = HScroll1.Value
  End With
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub
