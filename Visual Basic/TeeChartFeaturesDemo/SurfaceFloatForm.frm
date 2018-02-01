VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfaceFloatForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3060
   ClientTop       =   3780
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5595
      Left            =   0
      TabIndex        =   0
      Top             =   1320
      Width           =   11505
      Base64          =   $"SurfaceFloatForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "OpenGL"
      Height          =   195
      Left            =   3060
      TabIndex        =   3
      Top             =   990
      Width           =   2175
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Irregular grid"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   990
      Value           =   1  'Checked
      Width           =   2115
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   915
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SurfaceFloatForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asSurface.IrregularGrid = Check1.Value
End Sub

Private Sub Check2_Click()
  With TChart1
    .Aspect.OpenGL.Active = Check2.Value
  End With
End Sub

Private Sub Form_Load()
Dim XVal, ZVal As Variant
Dim X, z As Integer
Dim Y As Double
Dim Pi
  Label1.Caption = "Surface series accept now X,Y and Z values as ""double"" floating point numbers. " _
  & "The IrregularGrid property controls if X and Z values should be equi-distant or not." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).asSurface.AddXYZ -123.456, 321.45, 456.789 "
  XVal = Array(0.1, 0.2, 0.3, 0.5, 0.8, 1.1, 1.5, 2, 2.2, 3)
  ZVal = Array(0.5, 0.6, 0.7, 0.75, 0.8, 1.1, 1.5, 2, 2.2, 5.6)
  Pi = 3.141592
  With TChart1.Series(0)
    'Now add all "Y" points...
    .Clear
    'An irregular grid of 10 x 10 cells
    .asSurface.IrregularGrid = True
    .asSurface.NumXValues = 10
    .asSurface.NumZValues = 10
    For X = 0 To 9 ' = 10 rows
      For z = 0 To 9 ' = 10 columns
        Y = Sin(z * Pi / 10) * Cos(X * Pi / 5) ' example Y value
        .asSurface.AddXYZ XVal(X), Y, ZVal(z), "", clTeeColor
      Next z
    Next X
  End With
End Sub
