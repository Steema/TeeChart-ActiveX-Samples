VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_PerimeterForm 
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
      Height          =   5895
      Left            =   0
      TabIndex        =   0
      Top             =   1020
      Width           =   11505
      Base64          =   $"Function_PerimeterForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   525
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Function_PerimeterForm.frx":04C6
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "New ramdom points"
      Height          =   345
      Left            =   315
      TabIndex        =   1
      Top             =   585
      Width           =   2325
   End
End
Attribute VB_Name = "Function_PerimeterForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With TChart1
    .Series(0).Clear
    For t = 0 To 99
        .Series(0).AddXY (Rnd * 100) * Rnd * 10, (Rnd * 100) * Rnd * 10, "", clTeeColor
    Next t
    .Environment.InternalRepaint
    .Series(1).FunctionType.Recalculate
End With
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .Panel.Color = vbWhite
    .AddSeries scPoint
    .Series(0).FillSampleValues (100)
    .Series(0).Color = RGB(130, 155, 254)
    .AddSeries scLine
    .Series(1).XValues.Order = loNone
    .Series(1).DataSource = .Series(0)
    .Series(1).SetFunction tfPerimeter
    .Series(1).Title = "Perimeter"
    .Series(1).Color = vbRed
    .Series(1).Pen.Width = 3
    Command1_Click
End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub


