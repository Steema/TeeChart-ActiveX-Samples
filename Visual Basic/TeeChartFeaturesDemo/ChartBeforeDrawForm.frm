VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartBeforeDrawForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3150
   ClientTop       =   3120
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5805
      Left            =   0
      TabIndex        =   0
      Top             =   1110
      Width           =   11505
      Base64          =   $"ChartBeforeDrawForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   5
      Text            =   "ChartBeforeDrawForm.frx":044C
      Top             =   0
      Width           =   11460
   End
   Begin VB.OptionButton Option1 
      Caption         =   "After Chart"
      Height          =   195
      Index           =   3
      Left            =   4680
      TabIndex        =   4
      Top             =   780
      Width           =   1275
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Before Series"
      Height          =   195
      Index           =   2
      Left            =   3300
      TabIndex        =   3
      Top             =   780
      Width           =   1275
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Before Axes"
      Height          =   195
      Index           =   1
      Left            =   1920
      TabIndex        =   2
      Top             =   780
      Width           =   1275
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Before Chart"
      Height          =   195
      Index           =   0
      Left            =   540
      TabIndex        =   1
      Top             =   780
      Value           =   -1  'True
      Width           =   1275
   End
End
Attribute VB_Name = "ChartBeforeDrawForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim BeforeChart, BeforeAxes, BeforeSeries, AfterDraw

Private Sub Form_Load()
  With TChart1
    .AddSeries scBar
    .Series(0).FillSampleValues 6
  End With
  BeforeChart = True
  BeforeAxes = False
  BeforeSeries = False
  AfterDraw = False
End Sub

Private Sub Option1_Click(Index As Integer)
  Select Case Index
    Case 0: BeforeChart = True
    Case 1: BeforeAxes = True
    Case 2: BeforeSeries = True
    Case 3: AfterDraw = True
  End Select
  TChart1.Repaint
End Sub

Private Sub TChart1_OnAfterDraw()
  If AfterDraw = True Then
    DrawShape
  End If
  BeforeChart = False
  BeforeAxes = False
  BeforeSeries = False
  AfterDraw = False
End Sub

Sub DrawShape()
  With TChart1
    .Canvas.Pen.Style = psDot
    .Canvas.Brush.Color = vbYellow
    .Canvas.Ellipse 1, 1, .Canvas.Width - 1, .Canvas.Height - 1
  End With
End Sub

Private Sub TChart1_OnBeforeDrawAxes()
  If BeforeAxes = True Then
    DrawShape
  End If
End Sub

Private Sub TChart1_OnBeforeDrawChart()
  If BeforeChart = True Then
    DrawShape
  End If
End Sub

Private Sub TChart1_OnBeforeDrawSeries()
  If BeforeSeries = True Then
    DrawShape
  End If
End Sub
