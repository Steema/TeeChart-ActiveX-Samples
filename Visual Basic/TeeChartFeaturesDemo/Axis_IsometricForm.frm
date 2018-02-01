VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_IsometricForm 
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
      Height          =   5085
      Left            =   0
      TabIndex        =   0
      Top             =   1830
      Width           =   11505
      Base64          =   $"Axis_IsometricForm.frx":0000
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   3120
      TabIndex        =   4
      Text            =   "50"
      Top             =   1440
      Width           =   615
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Text            =   "50"
      Top             =   1440
      Width           =   615
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Axis_IsometricForm.frx":055E
      Top             =   0
      Width           =   11460
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Make axis Isometric"
      Height          =   345
      Left            =   4560
      TabIndex        =   1
      Top             =   1395
      Width           =   2235
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Y Incr.:"
      Height          =   195
      Left            =   2505
      TabIndex        =   6
      Top             =   1470
      Width           =   510
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "X Incr.:"
      Height          =   195
      Left            =   345
      TabIndex        =   5
      Top             =   1470
      Width           =   510
   End
End
Attribute VB_Name = "Axis_IsometricForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Call this function with a Chart or DBChart component
' to adjust the axis scales isometrically:
Private Sub Command1_Click()
  MakeIsoAxis
End Sub

Private Sub Form_Load()
Dim t As Integer
With TChart1
    .Aspect.View3D = False
    .Legend.Visible = False
End With
With TChart1.Axis.Left
    .GridPen.Style = psSolid
    .GridPen.Color = vbBlack
    .Increment = 50
    .Labels.Separation = 0
End With

With TChart1.Axis.Bottom
    .GridPen.Style = psSolid
    .GridPen.Color = vbBlack
    .Increment = 50
    .Labels.Separation = 0
End With
With TChart1
    .Series(0).Clear
    For t = 1 To 100
     .Series(0).Add Rnd(100) * 100, "", clTeeColor
    Next t
End With
End Sub


Private Sub TChart1_OnUndoZoom()
    MakeIsoAxis
End Sub
Private Sub MakeIsoAxis()
  With TChart1.Axis
    .Left.Increment = CInt(Text3.Text)
    .Bottom.Increment = CInt(Text2.Text)
    .SetIsometric .Left.Index, .Bottom.Index
  End With
End Sub

Private Sub TChart1_OnZoom()
    MakeIsoAxis
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
