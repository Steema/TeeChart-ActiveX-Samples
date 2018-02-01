VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Canvas_FontPicture 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6720
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   3390
      Max             =   100
      TabIndex        =   4
      Top             =   1080
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Browse..."
      Height          =   345
      Left            =   810
      TabIndex        =   2
      Top             =   1050
      Width           =   1065
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"Canvas_FontPicture.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Canvas_FontPicture.frx":0784
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   195
      Left            =   5640
      TabIndex        =   5
      Top             =   1110
      Width           =   90
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Zoom Filter % :"
      Height          =   195
      Left            =   2250
      TabIndex        =   3
      Top             =   1110
      Width           =   1035
   End
   Begin VB.Image Image1 
      Height          =   435
      Left            =   210
      Picture         =   "Canvas_FontPicture.frx":0833
      Stretch         =   -1  'True
      Top             =   990
      Width           =   435
   End
End
Attribute VB_Name = "Canvas_FontPicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  CommonDialog1.ShowOpen
  If CommonDialog1.FileName <> "" Then
    Image1.Picture = LoadPicture(CommonDialog1.FileName)
    TChart1.Header.Font.Picture.AssignImage Image1.Picture
  End If
End Sub

Private Sub Form_Load()
  With TChart1.Panel.Gradient
    .Visible = True
    .EndColor = vbRed
  End With
  
  With TChart1.Header.Font
    .Size = 48
    .Picture.AssignImage Image1.Picture
    .Outline.Visible = True
    .Picture.Filters.Add fcZoom
  End With
  
  TChart1.Aspect.FontZoom = 160
  TChart1.Aspect.Chart3DPercent = 50
  
  TChart1.Series(0).asPie.Gradient.Visible = True
  TChart1.Series(0).Marks.Callout.Length = 50
End Sub

Private Sub HScroll1_Change()
  Label2.Caption = Str$(HScroll1.Value)
  TChart1.Header.Font.Picture.Filters.Item(0).asZoom.Percent = HScroll1.Value
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
