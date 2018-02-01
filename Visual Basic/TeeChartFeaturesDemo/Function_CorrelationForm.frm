VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_CorrelationForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5820
      Left            =   0
      TabIndex        =   0
      Top             =   1095
      Width           =   11505
      Base64          =   $"Function_CorrelationForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Trend"
      Height          =   285
      Left            =   225
      TabIndex        =   3
      Top             =   675
      Width           =   1500
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   570
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Function_CorrelationForm.frx":0450
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "New random points"
      Height          =   375
      Left            =   1980
      TabIndex        =   1
      Top             =   630
      Width           =   2145
   End
End
Attribute VB_Name = "Function_CorrelationForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Series(2).Active = Check1.Value
End Sub

Private Sub Command1_Click()
    TChart1.Series(0).FillSampleValues (25)
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .AddSeries scPoint
    .Series(0).FillSampleValues (25)
    .AddSeries scLine
    .Series(1).SetFunction tfCorrelation
    .Series(1).DataSource = .Series(0)
    .Series(1).CheckDataSource
    .Series(1).Title = "Correlation"
    .Series(1).VerticalAxis = aRightAxis
    .Series(1).Pen.Width = 3
    .AddSeries scLine
    .Series(2).SetFunction tfTrend
    .Series(2).DataSource = .Series(0)
    .Series(2).CheckDataSource
    .Series(2).Title = "Trend"
    .Series(2).Active = False
    .Series(2).Pen.Width = 3
    .Legend.LegendStyle = lsSeries
End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub


