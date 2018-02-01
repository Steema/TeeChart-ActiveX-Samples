VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TitleCustomPosForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2745
   ClientTop       =   2010
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"TitleCustomPosForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "TitleCustomPosForm.frx":01EC
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom position"
      Height          =   195
      Left            =   60
      TabIndex        =   5
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      LargeChange     =   5
      Left            =   4440
      Max             =   1000
      SmallChange     =   2
      TabIndex        =   2
      Top             =   1080
      Value           =   90
      Width           =   1755
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   5
      Left            =   2160
      Max             =   1000
      SmallChange     =   2
      TabIndex        =   1
      Top             =   1080
      Value           =   90
      Width           =   1755
   End
   Begin VB.Label Label2 
      Caption         =   "Top"
      Height          =   255
      Left            =   4080
      TabIndex        =   4
      Top             =   1080
      Width           =   315
   End
   Begin VB.Label Label1 
      Caption         =   "Left"
      Height          =   255
      Left            =   1800
      TabIndex        =   3
      Top             =   1080
      Width           =   315
   End
End
Attribute VB_Name = "TitleCustomPosForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim FirstRepaint As Boolean

Private Sub Check1_Click()
  TChart1.Header.CustomPosition = Check1.Value
  TChart1.Repaint
  HScroll1.Value = TChart1.Header.Left
  HScroll2.Value = TChart1.Header.Top
  HScroll1.Enabled = Check1.Value
  HScroll2.Enabled = Check1.Value
End Sub

Private Sub Form_Load()
  FirstRepaint = False
  TChart1.Header.CustomPosition = True
  TChart1.Header.Left = 90
  TChart1.Header.Top = 90
End Sub

Private Sub HScroll1_Change()
  TChart1.Header.Left = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  TChart1.Header.Top = HScroll2.Value
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

Private Sub TChart1_OnAfterDraw()
  If FirstRepaint = False Then
    FirstRepaint = True
    HScroll1.Max = TChart1.Canvas.Width - TChart1.Canvas.TextWidth(TChart1.Header.Text.Item(0) & "    ")
    HScroll2.Max = TChart1.Canvas.Height - TChart1.Canvas.TextHeight("T")
  End If
End Sub
