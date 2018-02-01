VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_PolarBarForm 
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
      Base64          =   $"Series_PolarBarForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   570
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Series_PolarBarForm.frx":03A6
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   285
      TabIndex        =   1
      Top             =   630
      Width           =   1305
   End
End
Attribute VB_Name = "Series_PolarBarForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
TChart1.EditOneSeries (0)
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .Header.Visible = False
    .Legend.Visible = False
    .AddSeries scPolarBar
    .Series(0).FillSampleValues (25)
    .Series(0).ColorEachPoint = True
    With .Series(0).asPolarBar
        .CircleLabels.Visible = True
        .Pen.Width = 3
        .Pointer.Style = psTriangle
        .Circled = True
    End With
End With
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
