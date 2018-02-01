VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_LineMode 
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
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   5220
      Max             =   0
      Min             =   100
      TabIndex        =   8
      Top             =   900
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4740
      TabIndex        =   7
      Text            =   "10"
      Top             =   900
      Width           =   495
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Axis_LineMode.frx":0000
      Left            =   2670
      List            =   "Axis_LineMode.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   900
      Width           =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Axis_LineMode.frx":0032
      Left            =   600
      List            =   "Axis_LineMode.frx":0042
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   900
      Width           =   855
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5595
      Left            =   0
      TabIndex        =   1
      Top             =   1320
      Width           =   11505
      Base64          =   $"Axis_LineMode.frx":0060
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   825
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Axis_LineMode.frx":09DE
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Width:"
      Height          =   195
      Left            =   4200
      TabIndex        =   6
      Top             =   945
      Width           =   465
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Line Mode:"
      Height          =   195
      Left            =   1800
      TabIndex        =   4
      Top             =   975
      Width           =   795
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Axis:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   975
      Width           =   330
   End
End
Attribute VB_Name = "Axis_LineMode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  With TChart1.Axis
    Select Case Combo1.ListIndex
      Case 0: Combo2.ListIndex = .Left.AxisPen.LineMode
              VScroll1.Value = .Left.AxisPen.Width
      Case 1: Combo2.ListIndex = .Right.AxisPen.LineMode
              VScroll1.Value = .Right.AxisPen.Width
      Case 2: Combo2.ListIndex = .Top.AxisPen.LineMode
              VScroll1.Value = .Top.AxisPen.Width
      Case 3: Combo2.ListIndex = .Bottom.AxisPen.LineMode
              VScroll1.Value = .Bottom.AxisPen.Width
    End Select
  End With
End Sub

Private Sub Combo1_Click()
 Combo1_Change
End Sub

Private Sub Combo2_Change()
  With TChart1.Axis
    Select Case Combo1.ListIndex
      Case 0: .Left.AxisPen.LineMode = Combo2.ListIndex
      Case 1: .Right.AxisPen.LineMode = Combo2.ListIndex
      Case 2: .Top.AxisPen.LineMode = Combo2.ListIndex
      Case 3: .Bottom.AxisPen.LineMode = Combo2.ListIndex
    End Select
  End With
End Sub

Private Sub Combo2_Click()
  Combo2_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 3
  Combo2.ListIndex = 1
  
  With TChart1.Aspect.OpenGL
    .Active = True
    .AmbientLight = 42
    .Shininess = 0.2
    
    .Light.Visible = True
    .Light1.Visible = True
    
    .Light.Color = vbBlack
'    .Light.Direction.z = -1
'    .Light.Position.X = 439
'    .Light.Position.Y = 143
'    .Light.Position.z = -100
'    .Light.SpotDegrees = 180

    .Light1.Color = vbBlack
'    .Light1.Direction.z = -1
'    .Light1.Position.X = -439
'    .Light1.Position.Y = 153
'    .Light1.Position.z = 316
'    .Light1.SpotDegrees = 180
  End With
  
  TChart1.Axis.Bottom.AxisPen.LineMode = lmCylinder
  TChart1.Repaint
End Sub


Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Width"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 1) Then
      KeepFocus = True
      MsgBox "Please insert a value between 1 and 100", , "Width"
    Else
      VScroll1.Value = val(Text2.Text)
      
      With TChart1.Axis
        Select Case Combo1.ListIndex
          Case 0: .Left.AxisPen.Width = VScroll1.Value
          Case 1: .Right.AxisPen.Width = VScroll1.Value
          Case 2: .Top.AxisPen.Width = VScroll1.Value
          Case 3: .Bottom.AxisPen.Width = VScroll1.Value
        End Select
      End With
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
