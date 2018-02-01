VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ColorGridPlane3D 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Frame..."
      Height          =   345
      Left            =   5070
      TabIndex        =   8
      Top             =   1170
      Width           =   1125
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_ColorGridPlane3D.frx":0000
      Left            =   660
      List            =   "Series_ColorGridPlane3D.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1170
      Width           =   645
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   255
      Left            =   3000
      Max             =   0
      Min             =   100
      TabIndex        =   5
      Top             =   1200
      Value           =   100
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2520
      TabIndex        =   4
      Top             =   1200
      Width           =   495
   End
   Begin VB.CheckBox Check2 
      Caption         =   "3D"
      Height          =   255
      Left            =   3840
      TabIndex        =   2
      Top             =   1220
      Value           =   1  'Checked
      Width           =   735
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Series_ColorGridPlane3D.frx":001A
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ColorGridPlane3D.frx":0372
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Plane:"
      Height          =   195
      Left            =   150
      TabIndex        =   7
      Top             =   1230
      Width           =   450
   End
   Begin VB.Label Label1 
      Caption         =   "Position:"
      Height          =   255
      Left            =   1800
      TabIndex        =   3
      Top             =   1235
      Width           =   855
   End
End
Attribute VB_Name = "Series_ColorGridPlane3D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check2_Click()
  TChart1.Aspect.View3D = Check2.Value
End Sub

Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Series(0).asColorGrid.DrawPlane3D = cpX
    Case 1: TChart1.Series(0).asColorGrid.DrawPlane3D = cpY
    Case 2: TChart1.Series(0).asColorGrid.DrawPlane3D = cpZ
  End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).asColorGrid.Frame.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues
  Text2.Text = Str$(TChart1.Series(0).asColorGrid.DrawPosition)
  TChart1.Aspect.View3D = Check2.Value
  TChart1.Series(0).asColorGrid.DrawPlane3D = cpY
  Combo1.ListIndex = 1
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
    MsgBox "Please insert a numeric value", , "Position"
  Else
    If (val(Text2.Text) > 10000 Or val(Text2.Text) < -10000) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Position"
    Else
      TChart1.Series(0).asColorGrid.DrawPosition = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
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
