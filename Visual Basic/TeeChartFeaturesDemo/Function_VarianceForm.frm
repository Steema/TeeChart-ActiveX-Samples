VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_VarianceForm 
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
      Height          =   5925
      Left            =   0
      TabIndex        =   0
      Top             =   990
      Width           =   11505
      Base64          =   $"Function_VarianceForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   525
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Function_VarianceForm.frx":044C
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "New random values"
      Height          =   345
      Left            =   195
      TabIndex        =   1
      Top             =   585
      Width           =   2550
   End
End
Attribute VB_Name = "Function_VarianceForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    TChart1.Series(0).FillSampleValues (25)
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .Walls.Back.Transparent = False
    .Walls.Back.Color = vbWhite
    .AddSeries scPoint
    .Series(0).FillSampleValues (25)
    .AddSeries scLine
    .Series(1).SetFunction tfVariance
    .Series(1).DataSource = .Series(0)
    .Series(1).VerticalAxis = aRightAxis
    .Series(1).CheckDataSource
    .Series(1).Title = "Variance"
    .Series(1).Color = vbBlue
    .Legend.LegendStyle = lsSeries
End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub

