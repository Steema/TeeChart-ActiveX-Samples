VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Zoom 
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
   Begin VB.Frame Frame1 
      Caption         =   "Region"
      Height          =   585
      Left            =   4140
      TabIndex        =   6
      Top             =   900
      Width           =   5985
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   720
         TabIndex        =   14
         Text            =   "Text2"
         Top             =   210
         Width           =   525
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   2130
         TabIndex        =   13
         Text            =   "Text2"
         Top             =   210
         Width           =   525
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   3360
         TabIndex        =   12
         Text            =   "Text2"
         Top             =   210
         Width           =   525
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   4890
         TabIndex        =   11
         Text            =   "Text2"
         Top             =   210
         Width           =   525
      End
      Begin VB.VScrollBar VScroll1 
         Height          =   285
         Left            =   1230
         Max             =   0
         Min             =   1000
         TabIndex        =   10
         Top             =   210
         Width           =   225
      End
      Begin VB.VScrollBar VScroll2 
         Height          =   285
         Left            =   2640
         Max             =   0
         Min             =   1000
         TabIndex        =   9
         Top             =   210
         Width           =   225
      End
      Begin VB.VScrollBar VScroll3 
         Height          =   285
         Left            =   3870
         Max             =   0
         Min             =   1000
         TabIndex        =   8
         Top             =   210
         Width           =   225
      End
      Begin VB.VScrollBar VScroll4 
         Height          =   285
         Left            =   5400
         Max             =   0
         Min             =   1000
         TabIndex        =   7
         Top             =   210
         Width           =   225
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "Left:"
         Height          =   195
         Left            =   330
         TabIndex        =   18
         Top             =   240
         Width           =   315
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Width:"
         Height          =   195
         Left            =   1620
         TabIndex        =   17
         Top             =   240
         Width           =   465
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Top:"
         Height          =   195
         Left            =   3000
         TabIndex        =   16
         Top             =   240
         Width           =   330
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Height:"
         Height          =   195
         Left            =   4320
         TabIndex        =   15
         Top             =   240
         Width           =   510
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Smooth"
      Height          =   195
      Left            =   2940
      TabIndex        =   5
      Top             =   1110
      Value           =   1  'Checked
      Width           =   915
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1020
      Max             =   100
      TabIndex        =   3
      Top             =   1080
      Value           =   55
      Width           =   1035
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Filter_Zoom.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_Zoom.frx":25C3A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      Height          =   195
      Left            =   2160
      TabIndex        =   4
      Top             =   1110
      Width           =   480
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Percent:"
      Height          =   195
      Left            =   330
      TabIndex        =   2
      Top             =   1110
      Width           =   600
   End
End
Attribute VB_Name = "Filter_Zoom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Walls.Back.Picture.Filters.Item(0).asZoom.Smooth = Check1.Value
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Walls.Back.Picture.Filters.Add fcZoom
  
  With TChart1.Walls.Back.Picture.Filters.Item(0).Region
    .Left = 300
    .Top = 60
    .Width = 200
    .Height = 200
    
    VScroll1.Value = .Left
    VScroll2.Value = .Width
    VScroll3.Value = .Top
    VScroll4.Value = .Height
  End With
  
  With TChart1.Walls.Back.Picture.Filters.Item(0).asZoom
    .Percent = 55
    HScroll1.Value = .Percent
    .Smooth = True
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Walls.Back.Picture.Filters.Item(0).asZoom.Percent = HScroll1.Value
  Label2.Caption = Str$(HScroll1.Value)
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Region Left"
  Else
    If (val(Text2.Text) > 1000 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Region Left"
    Else
      TChart1.Walls.Back.Picture.Filters.Item(0).Region.Left = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
      TChart1.Repaint
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
    MsgBox "Please insert a numeric value", , "Region Width"
  Else
    If (val(Text3.Text) > 1000 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Region Width"
    Else
      TChart1.Walls.Back.Picture.Filters.Item(0).Region.Width = val(Text3.Text)
      VScroll2.Value = val(Text3.Text)
      TChart1.Repaint
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

Private Sub Text4_Change()
  Text4_Confirm
End Sub

Private Sub Text4_Confirm()
  If Not IsNumeric(Text4.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Region Top"
  Else
    If (val(Text4.Text) > 1000 Or val(Text4.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Region Top"
    Else
      TChart1.Walls.Back.Picture.Filters.Item(0).Region.Top = val(Text4.Text)
      VScroll3.Value = val(Text4.Text)
      TChart1.Repaint
    End If
  End If
End Sub

Private Sub VScroll3_Change()
  VScroll3_Scroll
End Sub

Private Sub VScroll3_Scroll()
  Text4.Text = Str$(VScroll3.Value)
  Text4_Confirm
End Sub

Private Sub Text5_Change()
  Text5_Confirm
End Sub

Private Sub Text5_Confirm()
  If Not IsNumeric(Text5.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Region Heigh"
  Else
    If (val(Text5.Text) > 1000 Or val(Text5.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Region Height"
    Else
      TChart1.Walls.Back.Picture.Filters.Item(0).Region.Height = val(Text5.Text)
      VScroll4.Value = val(Text5.Text)
      TChart1.Repaint
    End If
  End If
End Sub

Private Sub VScroll4_Change()
  VScroll4_Scroll
End Sub

Private Sub VScroll4_Scroll()
  Text5.Text = Str$(VScroll4.Value)
  Text5_Confirm
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
