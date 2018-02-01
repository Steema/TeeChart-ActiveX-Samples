VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ColorGridTransparency 
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
   Begin VB.CheckBox Check1 
      Caption         =   "No transparency"
      Height          =   195
      Left            =   2310
      TabIndex        =   5
      Top             =   1230
      Width           =   1905
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1320
      TabIndex        =   3
      Top             =   1200
      Width           =   495
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   1800
      Max             =   0
      Min             =   100
      TabIndex        =   2
      Top             =   1200
      Value           =   50
      Width           =   255
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Series_ColorGridTransparency.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ColorGridTransparency.frx":21B0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Transparency:"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1230
      Width           =   1095
   End
End
Attribute VB_Name = "Series_ColorGridTransparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  Text2.Text = Str$(0)
  Text2_Confirm
End Sub

Private Sub Form_Load()
  Text2.Text = Str$(VScroll1.Value)
  TChart1.Series(0).Title = "Contour"
  TChart1.Series(1).Title = "ColorGrid"
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
    MsgBox "Please insert a numeric value", , "Transparency"
  Else
    TChart1.Series(1).asColorGrid.Transparency = val(Text2.Text)
    VScroll1.Value = val(Text2.Text)
    If VScroll1.Value = 0 Then
      Check1.Enabled = False
    Else
      Check1.Enabled = True
      Check1.Value = 0
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
