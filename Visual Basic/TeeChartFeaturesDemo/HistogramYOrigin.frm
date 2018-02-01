VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form HistogramYOrigin 
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
      Left            =   6795
      Top             =   1395
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   960
      Left            =   135
      TabIndex        =   4
      Top             =   1215
      Width           =   3480
      Begin VB.VScrollBar VScroll1 
         Height          =   270
         Left            =   1650
         Max             =   1
         Min             =   100
         TabIndex        =   7
         Top             =   555
         Value           =   20
         Width           =   255
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1185
         TabIndex        =   6
         Text            =   "0"
         Top             =   540
         Width           =   435
      End
      Begin VB.CheckBox Check1 
         Caption         =   "&Use Origin"
         Height          =   195
         Left            =   225
         TabIndex        =   5
         Top             =   180
         Value           =   1  'Checked
         Width           =   1905
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "&Origin:"
         Height          =   195
         Left            =   585
         TabIndex        =   8
         Top             =   585
         Width           =   450
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Down to Value"
      Height          =   285
      Left            =   4410
      TabIndex        =   3
      Top             =   1755
      Width           =   1320
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Up to Value"
      Height          =   285
      Left            =   4455
      TabIndex        =   2
      Top             =   1350
      Width           =   1275
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4665
      Left            =   0
      TabIndex        =   0
      Top             =   2250
      Width           =   11505
      Base64          =   $"HistogramYOrigin.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "HistogramYOrigin.frx":11F8
      Top             =   0
      Width           =   11730
   End
   Begin VB.Shape Shape2 
      FillStyle       =   0  'Solid
      Height          =   240
      Left            =   4050
      Top             =   1755
      Width           =   330
   End
   Begin VB.Shape Shape1 
      FillStyle       =   0  'Solid
      Height          =   240
      Left            =   4050
      Top             =   1350
      Width           =   330
   End
End
Attribute VB_Name = "HistogramYOrigin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asHistogram.UseYOrigin = Check1.Value
  VScroll1.Enabled = Check1.Enabled
  Text2.Enabled = Check1.Value
  RefreshColors
End Sub

Private Sub RefreshColors()
Dim i As Integer
    For i = 0 To TChart1.Series(0).Count - 1
    If TChart1.Series(0).asHistogram.UseYOrigin Then
      If (TChart1.Series(0).YValues.Value(i) >= TChart1.Series(0).asHistogram.YOrigin) Then
        TChart1.Series(0).PointColor(i) = Shape1.FillColor
      Else
        TChart1.Series(0).PointColor(i) = Shape2.FillColor
      End If
    Else
      TChart1.Series(0).PointColor(i) = Shape1.FillColor
    End If
    Next i
End Sub

Private Sub Command1_Click()
    CommonDialog1.ShowColor
    If CommonDialog1.Color > 0 Then
      Shape1.FillColor = CommonDialog1.Color
      Colorset = True
    End If
    RefreshColors
End Sub

Private Sub Command2_Click()
    CommonDialog1.ShowColor
    If CommonDialog1.Color > 0 Then
      Shape2.FillColor = CommonDialog1.Color
      Colorset = True
    End If
    RefreshColors
End Sub

Private Sub Form_Load()
  Shape1.FillColor = vbGreen
  Shape2.FillColor = vbRed
  
  a = Array(100, -200, -50, 50, 150, 350, 200, -100, -300, -150, -50, 10, 100, 300, 350, 500)
  TChart1.Series(0).AddArray 16, a
 
  With TChart1
    .Series(0).asHistogram.UseYOrigin = Check1.Value
    .Series(0).asHistogram.YOrigin = 0
  End With
  RefreshColors
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(0).asHistogram.YOrigin = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub
