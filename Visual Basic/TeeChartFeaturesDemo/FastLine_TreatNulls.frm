VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FastLine_TreatNulls 
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
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5370
      TabIndex        =   8
      Text            =   "0"
      Top             =   1140
      Width           =   555
   End
   Begin VB.Frame Frame1 
      Caption         =   "Treat nulls:"
      Height          =   675
      Left            =   120
      TabIndex        =   3
      Top             =   870
      Width           =   3795
      Begin VB.OptionButton Option3 
         Caption         =   "Ignore"
         Height          =   195
         Left            =   2700
         TabIndex        =   6
         Top             =   300
         Value           =   -1  'True
         Width           =   945
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Skip"
         Height          =   195
         Left            =   1530
         TabIndex        =   5
         Top             =   300
         Width           =   735
      End
      Begin VB.OptionButton Option1 
         Caption         =   "DontPaint"
         Height          =   195
         Left            =   210
         TabIndex        =   4
         Top             =   300
         Width           =   1065
      End
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5325
      Left            =   7920
      OleObjectBlob   =   "FastLine_TreatNulls.frx":0000
      TabIndex        =   2
      Top             =   1560
      Width           =   3555
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1560
      Width           =   7920
      Base64          =   $"FastLine_TreatNulls.frx":00DE
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "FastLine_TreatNulls.frx":0192
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Point 30th, Y:"
      Height          =   195
      Left            =   4350
      TabIndex        =   7
      Top             =   1170
      Width           =   960
   End
End
Attribute VB_Name = "FastLine_TreatNulls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.AddSeries scFastLine
  
  TChart1.Axis.Left.SetMinMax -10, 30
  TChart1.Series(0).asFastLine.IgnoreNulls = False
  FillSeries
  ChartGrid1.Chart = TChart1
  ChartGrid1.RecalcDimensions
End Sub

Private Sub FillSeries()
Dim X, Y As Integer
Dim done As Boolean
  done = False
  
  For X = 0 To 100
    If X Mod 2 = 0 Then
      Y = 10
    Else
      Y = 20
    End If
    
    If (X >= 30) And (X <= 70) Then
      If Not done Then
        TChart1.Series(0).AddNullXY X, 0, ""
      End If
      done = True
    Else
      TChart1.Series(0).AddXY X, Y, "", vbRed
    End If
  Next X
End Sub


Private Sub Option1_Click()
  Option2.Value = False
  Option3.Value = False
  TChart1.Series(0).asFastLine.TreatNulls = tnDontPaint
End Sub

Private Sub Option2_Click()
  Option1.Value = False
  Option3.Value = False
  TChart1.Series(0).asFastLine.TreatNulls = tnSkip
End Sub

Private Sub Option3_Click()
  Option1.Value = False
  Option2.Value = False
  TChart1.Series(0).asFastLine.TreatNulls = tnIgnore
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Point 30th, Y:"
  Else
    TChart1.Series(0).YValues.Value(30) = val(Text2.Text)
  End If
  
  ChartGrid1.Chart = TChart1
End Sub
