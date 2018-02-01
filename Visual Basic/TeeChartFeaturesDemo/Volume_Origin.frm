VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Volume_Origin 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3945
   ClientTop       =   2175
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"Volume_Origin.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   3300
      Max             =   -20
      Min             =   100
      TabIndex        =   4
      Top             =   1110
      Value           =   33
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   2580
      TabIndex        =   3
      Text            =   "33"
      Top             =   1110
      Width           =   735
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Origin"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1170
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Volume_Origin.frx":0232
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Volume_Origin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asVolume.UseYOrigin = Check1.Value
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 50
  TChart1.Series(0).asVolume.YOrigin = val(Text2.Text)
  TChart1.Series(0).asVolume.UseYOrigin = True
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Period"
  Else
    TChart1.Series(0).asVolume.YOrigin = val(Text2.Text)
    VScroll1.Value = val(Text2.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
