VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_Bubble3DForm 
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
      Height          =   5985
      Left            =   0
      TabIndex        =   1
      Top             =   930
      Width           =   11505
      Base64          =   $"Series_Bubble3DForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   885
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_Bubble3DForm.frx":03B0
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Series_Bubble3DForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
    .AddSeries scBubble3D
    .Series(0).Clear
    For i = 1 To 4
        .Series(0).asBubble3D.AddBubble i + 1, Rnd(10), Rnd(10), Rnd(5), "", clTeeColor
    Next i
    .Aspect.OpenGL.Active = True
    .Zoom.Enable = False
    .Panel.MarginLeft = 10
    .Panel.MarginRight = 10
       
    .Series(0).asBubble3D.Pointer.Pen.Visible = False
End With
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
