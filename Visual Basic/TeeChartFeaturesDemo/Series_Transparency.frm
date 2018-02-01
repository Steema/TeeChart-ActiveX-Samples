VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Series_Transparency 
   BackColor       =   &H80000005&
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
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Apply to Legend"
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   8730
      TabIndex        =   7
      Top             =   960
      Value           =   1  'Checked
      Width           =   2115
   End
   Begin ComctlLib.Slider Slider1 
      Height          =   285
      Left            =   5310
      TabIndex        =   6
      Top             =   960
      Width           =   2925
      _ExtentX        =   5159
      _ExtentY        =   503
      _Version        =   327682
      Max             =   100
      TickFrequency   =   5
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5625
      Left            =   0
      TabIndex        =   4
      Top             =   1290
      Width           =   11505
      Base64          =   $"Series_Transparency.frx":0000
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Sides..."
      Height          =   345
      Left            =   2370
      TabIndex        =   1
      Top             =   900
      Width           =   945
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Lines..."
      Height          =   345
      Left            =   1290
      TabIndex        =   3
      Top             =   900
      Width           =   945
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   210
      TabIndex        =   2
      Top             =   900
      Width           =   945
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   735
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_Transparency.frx":0E9E
      Top             =   90
      Width           =   11490
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000005&
      Caption         =   "Transparency :"
      Height          =   225
      Left            =   3450
      TabIndex        =   5
      Top             =   960
      Width           =   1755
   End
End
Attribute VB_Name = "Series_Transparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check_LegendTransparency()
  If Check1.Value Then
    TChart1.Tools.Items(0).asLegendPalette.Chart.Series(0).Transparency = Slider1.Value
  Else
    TChart1.Tools.Items(0).asLegendPalette.Chart.Series(0).Transparency = 0
  End If
End Sub
Private Sub Check1_Click()
  Check_LegendTransparency
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Command2_Click()
  TChart1.Series(0).asIsoSurface.BandPen.ShowEditor
End Sub

Private Sub Command3_Click()
  TChart1.Series(0).asIsoSurface.SideLines.ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scIsoSurface
    .Series(0).FillSampleValues
    With .Series(0).asIsoSurface
      .UseColorRange = False
      .UsePalette = True
      .PaletteStyle = psRainbow
    End With
  End With

  TChart1.Tools.Items(0).asLegendPalette.Series = TChart1.Series(0)
  TChart1.Series(0).Transparency = 70
  Slider1.Value = TChart1.Series(0).Transparency
End Sub

Private Sub Slider1_Change()
  TChart1.Series(0).Transparency = Slider1.Value
  Check_LegendTransparency
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
