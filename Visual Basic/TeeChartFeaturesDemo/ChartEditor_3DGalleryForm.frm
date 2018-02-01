VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartEditor_3DGalleryForm 
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
      Height          =   5565
      Left            =   0
      TabIndex        =   0
      Top             =   1350
      Width           =   11505
      Base64          =   $"ChartEditor_3DGalleryForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   885
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "ChartEditor_3DGalleryForm.frx":0432
      Top             =   0
      Width           =   11460
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Show 3D Gallery..."
      Height          =   345
      Left            =   90
      TabIndex        =   1
      Top             =   945
      Width           =   2325
   End
End
Attribute VB_Name = "ChartEditor_3DGalleryForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  With TChart1.Zoom
    PenColor = .Pen.Color
    PenStyle = .Pen.Style
    PenVisible = .Pen.Visible
    PenWidth = .Pen.Width
    PenForm.Show vbModal
    If PenCancel = False Then
      .Pen.Color = PenColor
      .Pen.Style = PenStyle
      .Pen.Visible = PenVisible
      .Pen.Width = PenWidth
    End If
  End With
End Sub

Private Sub Command2_Click()
  With TChart1.Zoom
    BrushColor = .Brush.Color
    BrushStyle = .Brush.Style
    BrushForm.Show vbModal
    If BrushCancel = False Then
      .Brush.Color = BrushColor
      .Brush.Style = BrushStyle
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    PenColor = vbWhite
    PenVisible = True
    PenWidth = 1
    PenStyle = 0
    .AddSeries scLine
    .Series(0).FillSampleValues 200
  End With
End Sub
