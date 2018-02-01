VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_PointsHexagon 
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
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   6330
      Max             =   0
      Min             =   1000
      TabIndex        =   9
      Top             =   1200
      Value           =   10
      Width           =   225
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   5850
      TabIndex        =   8
      Text            =   "10"
      Top             =   1200
      Width           =   465
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   4800
      Max             =   0
      Min             =   1000
      TabIndex        =   7
      Top             =   1200
      Value           =   10
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4320
      TabIndex        =   5
      Text            =   "10"
      Top             =   1200
      Width           =   465
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Pointer Visible"
      Height          =   195
      Left            =   90
      TabIndex        =   3
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1305
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_PointsHexagon.frx":0000
      Left            =   2100
      List            =   "Series_PointsHexagon.frx":002B
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1170
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   1
      Top             =   1560
      Width           =   11505
      Base64          =   $"Series_PointsHexagon.frx":00BA
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_PointsHexagon.frx":0500
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Height: "
      Height          =   195
      Left            =   5250
      TabIndex        =   10
      Top             =   1230
      Width           =   555
   End
   Begin VB.Label Label2 
      Caption         =   "Width: "
      Height          =   195
      Left            =   3780
      TabIndex        =   6
      Top             =   1230
      Width           =   510
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Style:"
      Height          =   195
      Left            =   1650
      TabIndex        =   4
      Top             =   1230
      Width           =   390
   End
End
Attribute VB_Name = "Series_PointsHexagon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asLine.Pointer.Visible = Check1.Value
End Sub

Private Sub Combo1_Change()
  TChart1.Series(0).asLine.Pointer.Style = Combo1.ListIndex
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 12
  TChart1.Series(0).asLine.Pointer.Style = psHexagon
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
    If (val(Text2.Text) > 1000 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Width"
    Else
      TChart1.Series(0).asLine.Pointer.HorizontalSize = val(Text2.Text)
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

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Height"
  Else
    If (val(Text3.Text) > 1000 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Height"
    Else
      TChart1.Series(0).asLine.Pointer.VerticalSize = val(Text3.Text)
      VScroll2.Value = val(Text3.Text)
    End If
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text3_Confirm
End Sub
