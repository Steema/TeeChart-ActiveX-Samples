VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form BackWallImageForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2205
   ClientTop       =   2595
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5715
      Left            =   0
      TabIndex        =   0
      Top             =   1200
      Width           =   11505
      Base64          =   $"BackWallImageForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   381
      Object.Left            =   0
      Object.Top             =   80
      Object.Visible         =   -1  'True
      Object.Width           =   767
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   0
      Languaged       =   0
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6210
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select new image"
      Height          =   345
      Left            =   2640
      TabIndex        =   3
      Top             =   780
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "BackWallImageForm.frx":0B6A
      Top             =   0
      Width           =   11475
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Backwall image"
      Height          =   195
      Left            =   180
      TabIndex        =   1
      Top             =   840
      Value           =   1  'Checked
      Width           =   1935
   End
End
Attribute VB_Name = "BackWallImageForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ImageFile As String

Private Sub Check1_Click()
  If Check1.Value = 1 Then
  TChart1.Walls.Back.Gradient.Visible = False
    TChart1.Walls.Back.Brush.LoadImage ImageFile
  Else
   TChart1.Walls.Back.Gradient.Visible = True
    TChart1.Walls.Back.Brush.ClearImage
  End If
End Sub

Private Sub Command1_Click()
  ' load an image to fill Chart background...
    TChart1.Walls.Back.Transparent = False
    TChart1.Walls.Back.Gradient.Visible = False
  CommonDialog1.Filter = "Pictures(*.bmp)|*.bmp"
  CommonDialog1.ShowOpen
  If CommonDialog1.FileName <> "" Then
    ImageFile = CommonDialog1.FileName
  End If
  Check1.Value = 1
  Check1_Click
End Sub

Private Sub Form_Load()
  TChart1.Walls.Back.Transparent = False
  TChart1.Walls.Back.Gradient.Visible = False
  ImageFile = App.Path & "\backimage.bmp"
  TChart1.Walls.Back.Brush.LoadImage ImageFile
End Sub
