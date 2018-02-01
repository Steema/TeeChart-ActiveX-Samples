VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form WaterFallFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   3960
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"WaterFallFormForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   3720
      TabIndex        =   6
      Top             =   990
      Width           =   1335
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   2580
      TabIndex        =   3
      Top             =   1050
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   1140
      TabIndex        =   2
      Top             =   1050
      Width           =   255
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "WaterFallFormForm.frx":0392
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Lines"
      Height          =   345
      Left            =   1560
      TabIndex        =   4
      Top             =   990
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Border    "
      Height          =   345
      Left            =   120
      TabIndex        =   5
      Top             =   990
      Width           =   1335
   End
End
Attribute VB_Name = "WaterFallFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Command2_Click()
Dim Pen As IPen
  Set Pen = TChart1.Series(0).asWaterfall.Pen
  PenColor = Pen.Color
  PenStyle = Pen.Style
  PenVisible = Pen.Visible
  PenWidth = Pen.Width
  PenForm.Show vbModal
  If PenCancel = False Then
    Pen.Color = PenColor
    Pen.Style = PenStyle
    Pen.Visible = PenVisible
    Pen.Width = PenWidth
  End If
  Text2.BackColor = Pen.Color
End Sub

Private Sub Command3_Click()
Dim Pen As IPen
  Set Pen = TChart1.Series(0).asWaterfall.WaterLines
  PenColor = Pen.Color
  PenStyle = Pen.Style
  PenVisible = Pen.Visible
  PenWidth = Pen.Width
  PenForm.Show vbModal
  If PenCancel = False Then
    Pen.Color = PenColor
    Pen.Style = PenStyle
    Pen.Visible = PenVisible
    Pen.Width = PenWidth
  End If
  Text3.BackColor = Pen.Color
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
  Text3.BackColor = TChart1.Series(0).asWaterfall.WaterLines.Color
  Text2.BackColor = TChart1.Series(0).asWaterfall.Pen.Color
End Sub
