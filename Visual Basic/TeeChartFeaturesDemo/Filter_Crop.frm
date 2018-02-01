VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Crop 
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
      LargeChange     =   10
      Left            =   4710
      Max             =   0
      Min             =   10000
      SmallChange     =   10
      TabIndex        =   8
      Top             =   1080
      Value           =   10000
      Width           =   255
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   10
      Left            =   2850
      Max             =   0
      Min             =   10000
      SmallChange     =   10
      TabIndex        =   7
      Top             =   1080
      Value           =   10000
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4080
      TabIndex        =   6
      Text            =   "Text3"
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2220
      TabIndex        =   5
      Text            =   "Text2"
      Top             =   1080
      Width           =   615
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Active"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1110
      Value           =   1  'Checked
      Width           =   975
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   1
      Top             =   1470
      Width           =   11505
      Base64          =   $"Filter_Crop.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_Crop.frx":0406
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Height:"
      Height          =   195
      Left            =   3510
      TabIndex        =   4
      Top             =   1110
      Width           =   510
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Width:"
      Height          =   195
      Left            =   1680
      TabIndex        =   3
      Top             =   1110
      Width           =   465
   End
End
Attribute VB_Name = "Filter_Crop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(0).Active = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Tools.Items(0).asAntiAlias.Filters.Add fcCrop
  
  With TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asCrop
    .Width = 250
    .Height = 200
    VScroll1.Value = .Width
    VScroll2.Value = .Height
  End With
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Width"
  Else
    If (val(Text2.Text) > 10000 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 10000", , "Width"
    Else
      TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asCrop.Width = val(Text2.Text)
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
    MsgBox "Please insert a numeric value", , "Height"
  Else
    If (val(Text3.Text) > 10000 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 10000", , "Height"
    Else
      TChart1.Tools.Items(0).asAntiAlias.Filters.Item(0).asCrop.Height = val(Text3.Text)
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

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
