VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SurfaceNearestForm 
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
      Height          =   5790
      Left            =   0
      TabIndex        =   0
      Top             =   1125
      Width           =   11505
      Base64          =   $"Tool_SurfaceNearestForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   570
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Tool_SurfaceNearestForm.frx":049A
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit tool..."
      Height          =   345
      Left            =   45
      TabIndex        =   1
      Top             =   660
      Width           =   1515
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   240
      Left            =   1800
      TabIndex        =   3
      Top             =   720
      Width           =   2310
   End
End
Attribute VB_Name = "Tool_SurfaceNearestForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim NumX, NumZ

Private Sub Command1_Click()
TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
Dim X, z As Integer
NumX = 50
NumZ = 30
Label1.Caption = ""
With TChart1
    .Series(0).asSurface.NumXValues = NumX
    .Series(0).asSurface.NumZValues = NumZ
    For X = 1 To NumX
        For z = 1 To NumZ
            .Series(0).asSurface.AddXYZ X, Cos(0.14 * X) * Cos(0.25 * z) _
            + 0.01 * (X - (NumX / 2)) * (z - (NumZ / 2)), z, "", clTeeColor
        Next z
    Next X
    .Tools.Add tcSurfaceNearest
    .Tools.Items(0).asSurfaceNearest.Series = .Series(0)
    .Tools.Items(0).asSurfaceNearest.CellColor = vbRed
    .Tools.Items(0).asSurfaceNearest.ColumnColor = vbBlue
    .Tools.Items(0).asSurfaceNearest.RowColor = vbGreen
End With
End Sub

Private Sub TChart1_OnSurfaceNearestToolSelectCell()
Dim tmp As Integer
Dim tmpRow, tmpCol As Double
  tmp = TChart1.Tools.Items(0).asSurfaceNearest.SelectedCell

  If tmp = -1 Then
    Label1.Caption = ""
  Else
    tmpRow = TChart1.Tools.Items(0).asSurfaceNearest.GetRow
    tmpCol = TChart1.Tools.Items(0).asSurfaceNearest.GetCol
    Label1.Caption = "Row: " & tmpRow & " Column: " & tmpCol
  End If
End Sub
