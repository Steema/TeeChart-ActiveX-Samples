VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendImageForm 
   BorderStyle     =   0  'None
   Caption         =   "LegendImageForm"
   ClientHeight    =   6915
   ClientLeft      =   3255
   ClientTop       =   2400
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5055
      Left            =   0
      TabIndex        =   0
      Top             =   1860
      Width           =   11505
      Base64          =   $"LegendImageForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1395
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "LegendImageForm.frx":03A6
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Display Legend image"
      Height          =   195
      Left            =   300
      TabIndex        =   1
      Top             =   1500
      Value           =   1  'Checked
      Width           =   1935
   End
End
Attribute VB_Name = "LegendImageForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
If Check1.Value = 1 Then
TChart1.Legend.Brush.LoadImage App.Path & "\backimage.bmp"
TChart1.Repaint
Else
TChart1.Legend.Brush.ClearImage
End If
End Sub
Private Sub Form_Load()
TChart1.AddSeries scPolar
TChart1.Series(0).FillSampleValues 8
TChart1.Legend.Brush.LoadImage App.Path & "\backimage.bmp"
End Sub
