VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxesGridBandsForm 
   BorderStyle     =   0  'None
   Caption         =   "Animate !"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
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
      Base64          =   $"AxesGridBandsForm.frx":0000
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Grid..."
      Height          =   345
      Left            =   4935
      TabIndex        =   5
      Top             =   900
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View 3D"
      Height          =   195
      Left            =   3135
      TabIndex        =   4
      Top             =   960
      Width           =   1695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Band 2..."
      Height          =   345
      Left            =   1695
      TabIndex        =   3
      Top             =   900
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Band 1..."
      Height          =   345
      Left            =   255
      TabIndex        =   2
      Top             =   900
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxesGridBandsForm.frx":040E
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "AxesGridBandsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).asGridBand.Band1.ShowEditor
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).asGridBand.Band2.ShowEditor
End Sub

Private Sub Command3_Click()
  TChart1.Axis.Left.GridPen.ShowEditor
End Sub

Private Sub Check1_Click()
  TChart1.Aspect.View3D = Check1.Value = 1
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 25
  TChart1.Series(0).asLine.LinePen.Width = 2

  ' Create GridBandTool...
  TChart1.Tools.Add tcGridBand
  TChart1.Tools.Items(0).asGridBand.Axis = TChart1.Axis.Left

  ' cosmetic examples:
  With TChart1.Tools.Items(0).asGridBand
    'GetTeeBrush(0,Band1.Image.Bitmap);
    .Band1.Style = bsBackCrossSmall
    .Band1.Color = vbBlue
    
    .Band2.Style = bsCross
    .Band2.Color = vbWhite
  End With

  ' Change Left axis grid
  TChart1.Axis.Left.GridPen.Color = vbRed
  TChart1.Axis.Left.GridPen.Style = psSolid

  ' set 2D
  TChart1.Aspect.View3D = False
End Sub
