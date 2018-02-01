VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TeeEmboss 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   10680
      Top             =   1500
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   5745
      Max             =   1
      Min             =   100
      TabIndex        =   8
      Top             =   1515
      Value           =   3
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5280
      TabIndex        =   7
      Text            =   "3"
      Top             =   1500
      Width           =   435
   End
   Begin VB.CheckBox CBShadow 
      Caption         =   "Shadow Visible"
      Height          =   315
      Left            =   8730
      TabIndex        =   6
      Top             =   1530
      Value           =   1  'Checked
      Width           =   1545
   End
   Begin VB.CheckBox CBEmbossSmoothClick 
      Caption         =   "Emboss Smooth"
      Height          =   315
      Left            =   6780
      TabIndex        =   5
      Top             =   1530
      Value           =   1  'Checked
      Width           =   1755
   End
   Begin VB.CommandButton BColor 
      Caption         =   "Emboss Color..."
      Height          =   405
      Left            =   2340
      TabIndex        =   3
      Top             =   1470
      Width           =   1605
   End
   Begin VB.CheckBox CBVisible 
      Caption         =   "Emboss Visible"
      Height          =   285
      Left            =   150
      TabIndex        =   2
      Top             =   1530
      Value           =   1  'Checked
      Width           =   1995
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4995
      Left            =   0
      TabIndex        =   0
      Top             =   1920
      Width           =   11505
      Base64          =   $"TeeEmboss.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1395
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "TeeEmboss.frx":13C0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Emboss Size:"
      Height          =   225
      Left            =   4140
      TabIndex        =   4
      Top             =   1560
      Width           =   1095
   End
End
Attribute VB_Name = "TeeEmboss"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub BColor_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> TChart1.Legend.Emboss.Color Then
    TChart1.Legend.Emboss.Color = CommonDialog1.Color
    TChart1.Series(0).Marks.Emboss.Color = CommonDialog1.Color
    TChart1.Series(0).asBar.Emboss.Color = CommonDialog1.Color
  End If
End Sub

Private Sub CBEmbossSmoothClick_Click()
  TChart1.Legend.Emboss.Smooth = CBEmbossSmoothClick.Value
  TChart1.Series(0).asBar.Emboss.Smooth = CBEmbossSmoothClick.Value
  TChart1.Series(0).Marks.Emboss.Smooth = CBEmbossSmoothClick.Value
End Sub

Private Sub CBShadow_Click()
  TChart1.Legend.Shadow.Visible = CBShadow.Value
  TChart1.Series(0).asBar.Shadow.Visible = CBShadow.Value
  TChart1.Series(0).Marks.Shadow.Visible = CBShadow.Value
End Sub

Private Sub CBVisible_Click()
  TChart1.Legend.Emboss.Visible = CBVisible.Value
  TChart1.Series(0).asBar.Emboss.Visible = CBVisible.Value
  TChart1.Series(0).Marks.Emboss.Visible = CBVisible.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues
    .Series(0).asBar.Shadow.HorizSize = 3
    .Series(0).asBar.Shadow.VertSize = 3
    .Series(0).asBar.Shadow.Visible = True
    .ApplyPalette cpOpera
    
    .Series(0).asBar.Emboss.Color = vbRed
    .Legend.Emboss.Color = vbRed
    .Series(0).Marks.Emboss.Color = vbRed
    
    .Series(0).Marks.Emboss.Visible = True
    .Series(0).asBar.Emboss.Visible = True
    .Legend.Emboss.Visible = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Legend.Emboss.HorizSize = VScroll1.Value
  TChart1.Legend.Emboss.VertSize = VScroll1.Value
  TChart1.Series(0).asBar.Emboss.HorizSize = VScroll1.Value
  TChart1.Series(0).asBar.Emboss.VertSize = VScroll1.Value
  TChart1.Series(0).Marks.Emboss.HorizSize = VScroll1.Value
  TChart1.Series(0).Marks.Emboss.VertSize = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub


