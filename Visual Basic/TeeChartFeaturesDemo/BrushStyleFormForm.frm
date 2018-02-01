VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form BrushStyleFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3060
   ClientTop       =   2160
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5625
      Left            =   0
      TabIndex        =   0
      Top             =   1290
      Width           =   11505
      Base64          =   $"BrushStyleFormForm.frx":0000
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   10
      Left            =   4320
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   13
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   9
      Left            =   3900
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   12
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   8
      Left            =   3480
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   10
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   7
      Left            =   3060
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   9
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   6
      Left            =   2640
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   8
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   5
      Left            =   2220
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   7
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   4
      Left            =   1800
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   6
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   3
      Left            =   1380
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   5
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   2
      Left            =   960
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   4
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   1
      Left            =   540
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   3
      Top             =   900
      Width           =   235
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   235
      Index           =   0
      Left            =   120
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   2
      Top             =   900
      Width           =   235
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BrushStyleFormForm.frx":05E6
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Click on image to select pattern"
      Height          =   315
      Left            =   4680
      TabIndex        =   11
      Top             =   900
      Width           =   2295
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   7560
      Top             =   780
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
End
Attribute VB_Name = "BrushStyleFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim PicIndex

Private Sub Form_Load()
Dim i As Integer
Dim X As ListImage
  'Load images into the ImageList.
  For i = 1 To 11
    Set X = ImageList1.ListImages. _
    Add(, , LoadPicture(App.Path & "\BrushStyles\TeeBrush" & i & ".bmp"))
    Picture1(i - 1).Picture = ImageList1.ListImages.Item(i).Picture
  Next i
  TChart1.Series(0).Clear
  TChart1.Series(0).FillSampleValues 7
  Picture1_Click (0)
End Sub

Private Sub Picture1_Click(Index As Integer)
  PicIndex = Index
  TChart1.Series(0).asBar.BarBrush.AssignImage ImageList1.ListImages.Item(PicIndex + 1).Picture
  TChart1.Repaint
End Sub

Private Sub TChart1_OnAfterDraw()
  With TChart1
    .Canvas.Brush.AssignImage ImageList1.ListImages.Item(PicIndex + 1).Picture
    ' The first nine patterns in the list are standard TeeChart
    ' brush styles (starting at BrushStyle 8) and could be selected
    ' in a more conventional way. eg below:
    ' if PicIndex < 10 then  'except last 2 images
    '   .Canvas.Brush.Style = PicIndex + 8
    ' end if
    .Canvas.Rectangle .Axis.Right.Position - 120, 40, .Axis.Right.Position - 10, 100
    '.Canvas.Brush.Color =
    .Canvas.TextOut .Axis.Right.Position - 115, 45, "Canvas rectangle"
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
