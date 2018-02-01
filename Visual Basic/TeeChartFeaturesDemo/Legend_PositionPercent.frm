VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Legend_PositionPercent 
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
   Begin VB.CheckBox Check2 
      Caption         =   "Percent"
      Height          =   225
      Left            =   5430
      TabIndex        =   9
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1065
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   4710
      Max             =   0
      Min             =   1000
      TabIndex        =   8
      Top             =   1200
      Value           =   5
      Width           =   225
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3150
      Max             =   0
      Min             =   1000
      TabIndex        =   7
      Top             =   1200
      Value           =   5
      Width           =   225
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4230
      TabIndex        =   6
      Text            =   "5"
      Top             =   1200
      Width           =   465
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2670
      TabIndex        =   5
      Text            =   "5"
      Top             =   1200
      Width           =   465
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom Position"
      Height          =   225
      Left            =   240
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Legend_PositionPercent.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Legend_PositionPercent.frx":09A2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Top:"
      Height          =   195
      Left            =   3870
      TabIndex        =   4
      Top             =   1260
      Width           =   330
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Left:"
      Height          =   195
      Left            =   2310
      TabIndex        =   3
      Top             =   1260
      Width           =   315
   End
End
Attribute VB_Name = "Legend_PositionPercent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Legend.CustomPosition = Check1.Value
  Text2.Enabled = Check1.Value
  Text3.Enabled = Check1.Value
  Check2.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
    TChart1.Legend.PositionUnits = puPercent
    VScroll1.Value = TChart1.Legend.LeftPercent
    VScroll2.Value = TChart1.Legend.TopPercent
  Else
    TChart1.Legend.PositionUnits = puPixels
    VScroll1.Value = TChart1.Legend.Left
    VScroll2.Value = TChart1.Legend.Top
  End If
End Sub

Private Sub Form_Load()
TChart1.AddSeries scVolumePipe
TChart1.Series(0).asVolumePipe.Gradient.Visible = False
TChart1.Series(0).FillSampleValues
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
    MsgBox "Please insert a numeric value", , "Left"
  Else
    If (val(Text2.Text) > 1000 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Left"
    Else
      If Check2.Value Then
        TChart1.Legend.LeftPercent = val(Text2.Text)
      Else
        TChart1.Legend.Left = val(Text2.Text)
      End If
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
  MsgBox "Left: " + Str$(TChart1.Legend.Left) + "   LeftPercent: " + Str$(TChart1.Legend.LeftPercent), , "Left"
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
    MsgBox "Please insert a numeric value", , "Top"
  Else
    If (val(Text3.Text) > 1000 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 1000", , "Top"
    Else
      If Check2.Value Then
        TChart1.Legend.TopPercent = val(Text3.Text)
      Else
        TChart1.Legend.Top = val(Text3.Text)
      End If
      VScroll2.Value = val(Text3.Text)
    End If
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
  MsgBox "Top: " + Str$(TChart1.Legend.Top) + "   TopPercent: " + Str$(TChart1.Legend.TopPercent), , "Top"
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text3_Confirm
End Sub
