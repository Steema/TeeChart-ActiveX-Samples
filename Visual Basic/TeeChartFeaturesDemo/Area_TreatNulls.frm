VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Area_TreatNulls 
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
      Left            =   4740
      TabIndex        =   8
      Text            =   "0"
      Top             =   1080
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Caption         =   "Treat nulls:"
      Height          =   585
      Left            =   180
      TabIndex        =   3
      Top             =   870
      Width           =   3345
      Begin VB.OptionButton Option3 
         Caption         =   "Ignore"
         Height          =   195
         Left            =   2370
         TabIndex        =   6
         Top             =   240
         Width           =   765
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Skip"
         Height          =   195
         Left            =   1380
         TabIndex        =   5
         Top             =   240
         Width           =   645
      End
      Begin VB.OptionButton Option1 
         Caption         =   "DontPaint"
         Height          =   195
         Left            =   180
         TabIndex        =   4
         Top             =   240
         Value           =   -1  'True
         Width           =   1005
      End
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5385
      Left            =   8310
      OleObjectBlob   =   "Area_TreatNulls.frx":0000
      TabIndex        =   2
      Top             =   1470
      Width           =   3075
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5385
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   8250
      Base64          =   $"Area_TreatNulls.frx":00C6
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Area_TreatNulls.frx":0186
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Point #3,   Y:"
      Height          =   195
      Left            =   3780
      TabIndex        =   7
      Top             =   1110
      Width           =   930
   End
End
Attribute VB_Name = "Area_TreatNulls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.Axis.Left.SetMinMax -10, 30
  
  TChart1.AddSeries scArea
  FillSeries
  
  ChartGrid1.Chart = TChart1
  ChartGrid1.ShowFields = True
  ChartGrid1.ShowLabels = False
  ChartGrid1.ShowColors = True
  ChartGrid1.RecalcDimensions
End Sub

Private Sub FillSeries()
Dim X As Integer
Dim Y As Double
Dim done As Boolean
  done = False

  For X = 0 To 10
    If X Mod 2 = 0 Then
      Y = 10
    Else
      Y = 20
    End If
    
    If (X >= 3) And (X <= 7) Then
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
  TChart1.Series(0).asArea.TreatNulls = tnDontPaint
  Option2.Value = False
  Option3.Value = False
End Sub

Private Sub Option2_Click()
  TChart1.Series(0).asArea.TreatNulls = tnSkip
  Option1.Value = False
  Option3.Value = False
End Sub

Private Sub Option3_Click()
  TChart1.Series(0).asArea.TreatNulls = tnIgnore
  Option1.Value = False
  Option2.Value = False
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Point #3,  Y"
  Else
    TChart1.Series(0).YValues.Value(3) = val(Text2.Text)
    ChartGrid1.Chart = TChart1
  End If
End Sub
