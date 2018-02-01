VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Point3D_BaseLineForm 
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
      Height          =   5475
      Left            =   0
      TabIndex        =   2
      Top             =   1410
      Width           =   11475
      Base64          =   $"Point3D_BaseLineForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   885
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Point3D_BaseLineForm.frx":00B8
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Baseline..."
      Height          =   345
      Left            =   375
      TabIndex        =   0
      Top             =   975
      Width           =   1515
   End
End
Attribute VB_Name = "Point3D_BaseLineForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    TChart1.Series(0).asPoint3D.BaseLine.ShowEditor
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scPoint3D
    .Series(0).FillSampleValues (10)
    .Series(0).asPoint3D.LinePen.Visible = False
    .Series(0).asPoint3D.BaseLine.Visible = True
    .Series(0).asPoint3D.BaseLine.Color = vbBlue
    .Legend.Symbol.Squared = True
End With
End Sub

Private Sub Text1_DblClick()
     TChart1.ShowEditor
End Sub
