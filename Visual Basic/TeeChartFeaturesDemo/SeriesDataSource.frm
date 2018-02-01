VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesDataSource 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   4095
   ClientTop       =   1980
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   1
      Top             =   1470
      Width           =   11505
      Base64          =   $"SeriesDataSource.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Click to see Subtract Function's DataSources"
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   1020
      Width           =   3375
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "SeriesDataSource.frx":00D4
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   3960
      TabIndex        =   3
      Top             =   1065
      Width           =   2895
   End
End
Attribute VB_Name = "SeriesDataSource"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With TChart1
    Label1.Caption = .Series(2).DataSource
End With
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .AddSeries scBar
    .Series(0).FillSampleValues 10
    .Series(0).Marks.Visible = False
    .Series(0).Title = "DataSource One"
    
    .AddSeries scBar
    .Series(1).FillSampleValues 10
    .Series(1).Marks.Visible = False
    .Series(1).Title = "DataSource Two"
    
    .AddSeries scLine
    .Series(2).SetFunction tfSubtract
    .Series(2).DataSource = "Series0,Series1"
    .Series(2).CheckDataSource
    .Series(2).asLine.LinePen.Width = 3
    .Series(2).Title = "Subtract Function"
End With
End Sub

