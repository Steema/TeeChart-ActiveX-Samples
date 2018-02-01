VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form HighLowFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3705
   ClientTop       =   2685
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5745
      Left            =   0
      TabIndex        =   5
      Top             =   1170
      Width           =   11505
      Base64          =   $"HighLowFormForm.frx":0000
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "HighLowFormForm.frx":06F0
      Top             =   0
      Width           =   11490
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   1080
      TabIndex        =   2
      Top             =   780
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   3840
      TabIndex        =   1
      Top             =   780
      Width           =   255
   End
   Begin VB.CommandButton CHighFill 
      Caption         =   "High fill   "
      Height          =   345
      Left            =   1440
      TabIndex        =   0
      Top             =   720
      Width           =   1335
   End
   Begin VB.CommandButton CLow 
      Caption         =   "Low..."
      Height          =   345
      Left            =   2820
      TabIndex        =   3
      Top             =   720
      Width           =   1335
   End
   Begin VB.CommandButton CHigh 
      Caption         =   "High...     "
      Height          =   345
      Left            =   60
      TabIndex        =   4
      Top             =   720
      Width           =   1335
   End
   Begin VB.CommandButton CLowFill 
      Caption         =   "Low fill  "
      Height          =   345
      Left            =   4200
      TabIndex        =   7
      Top             =   720
      Width           =   1335
   End
   Begin VB.TextBox Text6 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   6660
      TabIndex        =   8
      Top             =   780
      Width           =   255
   End
   Begin VB.CommandButton CLines 
      Caption         =   "Lines "
      Height          =   345
      Left            =   5640
      TabIndex        =   9
      Top             =   720
      Width           =   1335
   End
End
Attribute VB_Name = "HighLowFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub SetPen(Pen As IPen)
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
End Sub

Private Sub CHigh_Click()
Dim Pen As IPen
  Set Pen = TChart1.Series(0).asHighLow.HighPen
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
  Text1.BackColor = Pen.Color
End Sub

Private Sub CHighFill_Click()
  With TChart1.Series(0).asHighLow.HighBrush
    BrushColor = .Color
    BrushStyle = .Style
    BrushForm.Show vbModal
    If BrushCancel = False Then
      .Style = BrushStyle
      .Color = BrushColor
    End If
  End With
End Sub

Private Sub CLines_Click()
Dim Pen As IPen
  Set Pen = TChart1.Series(0).asHighLow.Pen
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
  Text6.BackColor = Pen.Color
End Sub

Private Sub CLow_Click()
Dim Pen As IPen
  Set Pen = TChart1.Series(0).asHighLow.LowPen
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

Private Sub CLowFill_Click()
  With TChart1.Series(0).asHighLow.LowBrush
    BrushColor = .Color
    BrushStyle = .Style
    BrushForm.Show vbModal
    If BrushCancel = False Then
      .Style = BrushStyle
      .Color = BrushColor
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1.Series(0).asHighLow
    .AddHighLow 0, 740, 320, "", clTeeColor
    .AddHighLow 1, 217, 455, "", clTeeColor
    .AddHighLow 2, 300, 319, "", clTeeColor
    .AddHighLow 3, 515, 262, "", clTeeColor
    .AddHighLow 4, 787, 943, "", clTeeColor
    .AddHighLow 5, 711, 680, "", clTeeColor
    .AddHighLow 6, 700, 320, "", clTeeColor
    .AddHighLow 7, 217, 425, "", clTeeColor
    .AddHighLow 8, 340, 319, "", clTeeColor
    .AddHighLow 9, 615, 262, "", clTeeColor
    .AddHighLow 10, 787, 913, "", clTeeColor
    .AddHighLow 11, 711, 680, "", clTeeColor
    .Pen.Color = vbRed
    .HighBrush.Style = bsBDiagonal
    Text2.BackColor = .LowPen.Color
    Text6.BackColor = .Pen.Color
    Text1.BackColor = .HighPen.Color
  End With
End Sub

Private Sub Text3_DblClick()
  TChart1.ShowEditor
End Sub
