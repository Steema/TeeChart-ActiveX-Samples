VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form RotatedEllipseForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
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
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"RotatedEllipseForm.frx":0000
   End
   Begin VB.PictureBox Picture1 
      Height          =   375
      Left            =   6720
      Picture         =   "RotatedEllipseForm.frx":3ED0
      ScaleHeight     =   315
      ScaleWidth      =   915
      TabIndex        =   6
      Top             =   720
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D"
      Height          =   195
      Left            =   3780
      TabIndex        =   5
      Top             =   1275
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1140
      Max             =   360
      TabIndex        =   2
      Top             =   1230
      Value           =   60
      Width           =   1995
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "RotatedEllipseForm.frx":4DA0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "60"
      Height          =   195
      Left            =   3240
      TabIndex        =   4
      Top             =   1260
      Width           =   180
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Ellipse angle:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1260
      Width           =   930
   End
End
Attribute VB_Name = "RotatedEllipseForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Aspect.View3D = (Check1.Value = 1)
End Sub

Private Sub HScroll1_Change()
  Label3.Caption = HScroll1.Value
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub TChart1_OnAfterDraw()
Dim ptX As Variant, ptY As Variant
  TChart1.Canvas.RotatedEllipse 50, 90, 250, 160, 10, HScroll1.Value
  ptX = Array(300, 350, 380, 320, 290)
  ptY = Array(200, 190, 210, 90, 180)
  TChart1.Canvas.Polyline 5, ptX, ptY, 20
  'TChart1.Canvas.Draw 0, 0, Picture1.Picture  'If active, this line draws an image
End Sub
