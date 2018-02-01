VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ContourPointer 
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
      Left            =   4050
      Max             =   1
      Min             =   1000
      TabIndex        =   10
      Top             =   1200
      Value           =   1
      Width           =   255
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   5580
      Max             =   1
      Min             =   1000
      TabIndex        =   9
      Top             =   1200
      Value           =   1
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   5070
      TabIndex        =   8
      Text            =   "1"
      Top             =   1200
      Width           =   465
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3570
      TabIndex        =   7
      Text            =   "1"
      Top             =   1200
      Width           =   465
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   6000
      TabIndex        =   4
      Top             =   1170
      Width           =   885
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Series Pen..."
      Height          =   345
      Left            =   1650
      TabIndex        =   3
      Top             =   1170
      Width           =   1185
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Pointer Visible"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1305
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Series_ContourPointer.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ContourPointer.frx":01AA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Height:"
      Height          =   195
      Left            =   4530
      TabIndex        =   6
      Top             =   1230
      Width           =   510
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Width:"
      Height          =   195
      Left            =   3060
      TabIndex        =   5
      Top             =   1230
      Width           =   465
   End
End
Attribute VB_Name = "Series_ContourPointer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asContour.Pointer.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).Pen.ShowEditor
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scContour
  
  With TChart1.Series(0)
    .ColorEachPoint = False
    .FillSampleValues 45
    .asContour.PaletteStyle = psRainbow
    .asContour.NumLevels = 14
    .Pen.Visible = False
    .asContour.Pointer.Visible = True
    .asContour.Pointer.HorizontalSize = 1
    .asContour.Pointer.VerticalSize = 1
  End With
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
    If (val(Text2.Text) > 1000 Or val(Text2.Text) < 1) Then
      KeepFocus = True
      MsgBox "Please insert a value between 1 and 1000", , "Width"
    Else
      TChart1.Series(0).asContour.Pointer.HorizontalSize = val(Text2.Text)
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
    If (val(Text3.Text) > 1000 Or val(Text3.Text) < 1) Then
      KeepFocus = True
      MsgBox "Please insert a value between 1 and 1000", , "Height"
    Else
      TChart1.Series(0).asContour.Pointer.VerticalSize = val(Text3.Text)
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
