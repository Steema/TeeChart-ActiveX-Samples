VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PolarRadar_Transparency 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3495
   ClientTop       =   2415
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.VScrollBar VScroll3 
      Height          =   285
      LargeChange     =   5
      Left            =   5160
      Max             =   0
      Min             =   100
      SmallChange     =   5
      TabIndex        =   8
      Top             =   900
      Value           =   30
      Width           =   225
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4410
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   900
      Width           =   735
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      LargeChange     =   5
      Left            =   3900
      Max             =   0
      Min             =   100
      SmallChange     =   5
      TabIndex        =   6
      Top             =   900
      Value           =   30
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3150
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   900
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1890
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   900
      Width           =   735
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   5
      Left            =   2640
      Max             =   0
      Min             =   100
      SmallChange     =   5
      TabIndex        =   3
      Top             =   900
      Value           =   30
      Width           =   225
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5625
      Left            =   0
      TabIndex        =   1
      Top             =   1290
      Width           =   11505
      Base64          =   $"PolarRadar_Transparency.frx":0000
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"PolarRadar_Transparency.frx":0A4E
      Height          =   795
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:"
      Height          =   195
      Left            =   630
      TabIndex        =   0
      Top             =   930
      Width           =   1020
   End
End
Attribute VB_Name = "PolarRadar_Transparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 10
    .Series(1).FillSampleValues 10
    .Series(2).FillSampleValues 10
  End With
  
  VScroll1.Value = 30
  VScroll2.Value = 30
  VScroll3.Value = 30
End Sub

Private Sub Label1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text1_Confirm()
  If Not IsNumeric(Text1.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Transparency"
  Else
    If (val(Text1.Text) > 100 Or val(Text1.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Transparency"
    Else
      TChart1.Series(0).asPolar.Transparency = val(Text1.Text)
      VScroll1.Value = val(Text1.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text1.Text = Str$(VScroll1.Value)
  Text1_Confirm
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Transparency"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Transparency"
    Else
      TChart1.Series(1).asPolar.Transparency = val(Text2.Text)
      VScroll2.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text2.Text = Str$(VScroll2.Value)
  Text2_Confirm
End Sub

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Transparency"
  Else
    If (val(Text3.Text) > 100 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Transparency"
    Else
      TChart1.Series(2).asPolar.Transparency = val(Text3.Text)
      VScroll3.Value = val(Text3.Text)
    End If
  End If
End Sub

Private Sub VScroll3_Change()
  VScroll3_Scroll
End Sub

Private Sub VScroll3_Scroll()
  Text3.Text = Str$(VScroll3.Value)
  Text3_Confirm
End Sub
