VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TriSurface_Hiding 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3645
   ClientTop       =   1845
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5145
      Left            =   0
      TabIndex        =   1
      Top             =   1770
      Width           =   11505
      Base64          =   $"TriSurface_Hiding.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Cache Triangles"
      Height          =   195
      Left            =   3720
      TabIndex        =   3
      Top             =   1440
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Hide Triangles"
      Height          =   195
      Left            =   1320
      TabIndex        =   2
      Top             =   1440
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "TriSurface_Hiding.frx":0432
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "TriSurface_Hiding"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  CheckParams
End Sub

Private Sub Check2_Click()
  CheckParams
End Sub

Private Sub Form_Load()
  CheckParams
  Fill
End Sub

Private Sub CheckParams()
  With TChart1.Series(0).asTriSurface
    .HideTriangles = Check1.Value
    .CacheTriangles = Check2.Value
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Function Square(a As Double) As Double
  Square = a * a
End Function

Private Sub Fill()
Dim n, m, X, z

  With TChart1.Series(0)
    .Clear
    n = 0.5
    m = 10
    For X = -m To m
        For z = -m To m
          .asTriSurface.AddXYZ X, _
          4 * Cos(3 * Sqr(Square(X / 3) + Square(z / 3))) * Exp(-n * (Sqr(Square(X / 3) + Square(z / 3)))), _
          z, "", clTeeColor
        Next z
    Next X
  End With
End Sub
