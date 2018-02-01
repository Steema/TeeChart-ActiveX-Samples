VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksShadowForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3225
   ClientTop       =   3060
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"MarksShadowForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   7
      Text            =   "MarksShadowForm.frx":0454
      Top             =   0
      Width           =   11490
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   3840
      Top             =   1200
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   5160
      Max             =   0
      Min             =   25
      TabIndex        =   5
      Top             =   1320
      Value           =   2
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Marks shadow"
      Height          =   195
      Left            =   150
      TabIndex        =   1
      Top             =   1380
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.Label Label5 
      Height          =   255
      Left            =   5580
      TabIndex        =   6
      Top             =   1350
      Width           =   555
   End
   Begin VB.Label Label4 
      Caption         =   "Size:"
      Height          =   195
      Left            =   4740
      TabIndex        =   4
      Top             =   1380
      Width           =   435
   End
   Begin VB.Label Label3 
      Caption         =   "Color:"
      Height          =   195
      Left            =   1980
      TabIndex        =   3
      Top             =   1380
      Width           =   435
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   315
      Left            =   2460
      TabIndex        =   2
      Top             =   1320
      Width           =   315
   End
End
Attribute VB_Name = "MarksShadowForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If Check1.Value = 0 Then
    TChart1.Series(0).Marks.ShadowSize = 0
  Else
    VScroll1_Change
  End If
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scBar
    .Series(0).FillSampleValues 6
    Label2.BackColor = .Series(0).Marks.ShadowColor
  End With
  VScroll1_Change
End Sub

Private Sub Label2_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color > 0 Then
    TChart1.Series(0).Marks.ShadowColor = CommonDialog1.Color
    Label2.BackColor = CommonDialog1.Color
    Colorset = True
  End If
End Sub

Private Sub VScroll1_Change()
  If Check1.Value <> 0 Then
    TChart1.Series(0).Marks.ShadowSize = VScroll1.Value
  Else
    TChart1.Series(0).Marks.ShadowSize = 0
  End If
  Label5.Caption = Str$(VScroll1.Value)
End Sub
