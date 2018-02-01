VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Line_Outline 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3975
   ClientTop       =   2175
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Line_Outline.frx":0000
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5175
      Top             =   1215
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   195
      Left            =   2100
      TabIndex        =   5
      Top             =   1080
      Width           =   195
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   195
      Left            =   3660
      TabIndex        =   4
      Top             =   1080
      Width           =   195
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Line pen     "
      Height          =   315
      Left            =   960
      TabIndex        =   3
      Top             =   1020
      Width           =   1395
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Outline pen     "
      Height          =   315
      Left            =   2520
      TabIndex        =   2
      Top             =   1020
      Width           =   1395
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Line_Outline.frx":06C0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Line_Outline"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  With TChart1.Series(0).asLine
    PenColor = .LinePen.Color
    PenStyle = .LinePen.Style
    PenVisible = .LinePen.Visible
    PenWidth = .LinePen.Width
    PenForm.Show vbModal
    If PenCancel = False Then
     .LinePen.Color = PenColor
     .LinePen.Style = PenStyle
     .LinePen.Visible = PenVisible
     .LinePen.Width = PenWidth
     Text4.BackColor = .LinePen.Color
    End If
  End With
End Sub

Private Sub Command2_Click()
  With TChart1.Series(0).asLine
    PenColor = .Outline.Color
    PenStyle = .Outline.Style
    PenVisible = .Outline.Visible
    PenWidth = .Outline.Width
    PenForm.Show vbModal
    If PenCancel = False Then
      .Outline.Color = PenColor
      .Outline.Style = PenStyle
      .Outline.Visible = PenVisible
      .Outline.Width = PenWidth
      Text3.BackColor = .Outline.Color
    End If
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 25
  Text4.BackColor = TChart1.Series(0).asLine.LinePen.Color
  Text3.BackColor = TChart1.Series(0).asLine.Outline.Color
End Sub
