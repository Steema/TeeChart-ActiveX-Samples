VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_InvertPalette 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   7560
      Max             =   100
      TabIndex        =   8
      Top             =   990
      Width           =   1425
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   4950
      Max             =   100
      TabIndex        =   7
      Top             =   990
      Value           =   32
      Width           =   1425
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_InvertPalette.frx":0000
      Left            =   2550
      List            =   "Series_InvertPalette.frx":0034
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   960
      Width           =   1425
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Invert Palette"
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   1305
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5535
      Left            =   0
      TabIndex        =   1
      Top             =   1380
      Width           =   11505
      Base64          =   $"Series_InvertPalette.frx":00BF
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_InvertPalette.frx":066B
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Transp:"
      Height          =   195
      Left            =   6900
      TabIndex        =   6
      Top             =   1020
      Width           =   540
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Steps:"
      Height          =   195
      Left            =   4380
      TabIndex        =   5
      Top             =   1020
      Width           =   450
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Palette:"
      Height          =   195
      Left            =   1950
      TabIndex        =   3
      Top             =   1020
      Width           =   540
   End
End
Attribute VB_Name = "Series_InvertPalette"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  SetPalette
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).asIsoSurface.InvertPalette
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 8

  With TChart1.Series(0).asIsoSurface
    .FastBrush = True
    TChart1.Series(0).FillSampleValues 20
    .Pen.Visible = True
    .BandPen.Visible = False
    .SideBrush.Style = bsSolid
    .SideLines.Visible = True
  End With
  
  SetPalette

  With TChart1
    .Aspect.OrthoAngle = 20
    .ClipPoints = False
    .Axis.FastCalc = True
    .Legend.Visible = False
    .Legend.Symbol.DefaultPen = False
    .Axis.Depth.Visible = True
    .Axis.Visible = False
    .Walls.Visible = False
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Series(0).asIsoSurface.PaletteSteps = HScroll1.Value
  SetPalette
End Sub

Private Sub SetPalette()
  TChart1.Series(0).asIsoSurface.AddCustomPalette Combo1.ListIndex
End Sub

Private Sub HScroll2_Change()
  TChart1.Series(0).asIsoSurface.Transparency = HScroll2.Value
End Sub


Private Sub TChart1_OnSurfaceSeriesGetYValue(ByVal SeriesIndex As Long, ByVal X As Long, ByVal z As Long, Y As Double)
Dim PiPortion, tmpX, tmpZ As Double
  PiPortion = 3.1415926 / TChart1.Series(0).asIsoSurface.NumXValues
  tmpX = X * PiPortion
  tmpZ = z * PiPortion
  Y = Sqr(tmpX * tmpX + tmpZ * tmpZ)
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
