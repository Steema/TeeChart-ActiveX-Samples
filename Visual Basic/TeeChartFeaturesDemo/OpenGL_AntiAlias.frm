VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form OpenGL_AntiAlias 
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
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   10680
      Top             =   1260
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2700
      Max             =   100
      Min             =   1
      TabIndex        =   8
      Top             =   1590
      Value           =   10
      Width           =   1275
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "OpenGL_AntiAlias.frx":0000
      Left            =   3270
      List            =   "OpenGL_AntiAlias.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1020
      Width           =   1155
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Rotate smooth"
      Height          =   195
      Left            =   270
      TabIndex        =   4
      Top             =   1620
      Width           =   1455
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Antialias"
      Height          =   195
      Left            =   270
      TabIndex        =   3
      Top             =   1320
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      Caption         =   "OpenGL"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1035
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4965
      Left            =   0
      TabIndex        =   1
      Top             =   1950
      Width           =   11505
      Base64          =   $"OpenGL_AntiAlias.frx":002C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "OpenGL_AntiAlias.frx":1746
      Top             =   0
      Width           =   11490
   End
   Begin VB.Image Image2 
      Height          =   345
      Left            =   4950
      Picture         =   "OpenGL_AntiAlias.frx":180F
      Stretch         =   -1  'True
      Top             =   1470
      Width           =   495
   End
   Begin VB.Image Image1 
      Height          =   345
      Left            =   4950
      Picture         =   "OpenGL_AntiAlias.frx":11851
      Stretch         =   -1  'True
      Top             =   1050
      Width           =   495
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Speed:"
      Height          =   195
      Left            =   2100
      TabIndex        =   7
      Top             =   1620
      Width           =   510
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Axis Linemode:"
      Height          =   195
      Left            =   2100
      TabIndex        =   5
      Top             =   1050
      Width           =   1065
   End
End
Attribute VB_Name = "OpenGL_AntiAlias"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Aspect.OpenGL.Active = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Aspect.OpenGL.Antialias = Check2.Value
End Sub

Private Sub Check3_Click()
  Timer1.Enabled = Check3.Value
End Sub

Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Axis.Left.AxisPen.LineMode = lmLine
            TChart1.Axis.Bottom.AxisPen.LineMode = lmLine
    Case 1: TChart1.Axis.Left.AxisPen.LineMode = lmCylinder
            TChart1.Axis.Bottom.AxisPen.LineMode = lmCylinder
    Case 2: TChart1.Axis.Left.AxisPen.LineMode = lmRectangle
            TChart1.Axis.Bottom.AxisPen.LineMode = lmRectangle
  End Select
  TChart1.Repaint
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(2).asBar.BarBrush.AssignImage Image1.Picture
    .Series(3).asBar.BarBrush.AssignImage Image2.Picture

    .Aspect.Perspective = 120
    .Aspect.OpenGL.Active = True
    .Aspect.OpenGL.Antialias = True
    
    .Series(3).SetNull 0
  End With
  
  Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Timer1_Timer()
Dim tmp As Double
  
  With TChart1.Aspect
    tmp = HScroll1.Value * 0.01
    .ElevationFloat = .ElevationFloat + tmp
    .RotationFloat = .RotationFloat + tmp
  End With
End Sub
