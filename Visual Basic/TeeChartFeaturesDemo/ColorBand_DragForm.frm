VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorBand_DragForm 
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
      Height          =   5100
      Left            =   0
      TabIndex        =   3
      Top             =   1815
      Width           =   11505
      Base64          =   $"ColorBand_DragForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1290
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "ColorBand_DragForm.frx":00FA
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "End Pen..."
      Height          =   345
      Left            =   1665
      TabIndex        =   1
      Top             =   1350
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start Pen..."
      Height          =   345
      Left            =   180
      TabIndex        =   0
      Top             =   1350
      Width           =   1395
   End
End
Attribute VB_Name = "ColorBand_DragForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
TChart1.Tools.Items(0).asColorband.StartLinePen.ShowEditor
End Sub

Private Sub Command2_Click()
TChart1.Tools.Items(0).asColorband.EndLinePen.ShowEditor
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .AddSeries scLine
    .Series(0).FillSampleValues (5)
    .Axis.Left.SetMinMax 0, 100
    .Tools.Add tcColorband
    .Tools.Items(0).asColorband.Axis = .Axis.Left
    .Tools.Items(0).asColorband.StartValue = 25
    .Tools.Items(0).asColorband.EndValue = 75
    .Series(0).Active = False
    .Tools.Items(0).asColorband.ResizeStart = True
    .Tools.Items(0).asColorband.ResizeEnd = True
End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
