VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form XYZGriddingForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"XYZGriddingForm.frx":0000
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Surface"
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   1200
      Value           =   -1  'True
      Width           =   1455
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Original XYZ"
      Height          =   375
      Left            =   1560
      TabIndex        =   2
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "XYZGriddingForm.frx":08D8
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "View:"
      Height          =   195
      Left            =   795
      TabIndex        =   4
      Top             =   1275
      Width           =   390
   End
End
Attribute VB_Name = "XYZGriddingForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MaxDistance As Double

Private Sub Gridding(ByVal GridSize As Integer)
Dim X As Integer, z As Integer
Dim tmpX As Double, tmpZ As Double, tmpMinX As Double, tmpMinZ As Double
Dim tmpXFactor As Double, tmpZFactor As Double
  tmpMinX = TChart1.Series(0).XValues.Minimum
  tmpMinZ = TChart1.Series(0).asPoint3D.ZValues.Minimum

  tmpXFactor = (TChart1.Series(0).XValues.Maximum - tmpMinX) / GridSize
  tmpZFactor = (TChart1.Series(0).asPoint3D.ZValues.Maximum - tmpMinZ) / GridSize

  With TChart1.Series(1).asSurface
    TChart1.Series(1).Clear
    .NumXValues = GridSize
    .NumZValues = GridSize

    ' loop all grid cells
    For X = 1 To GridSize
      tmpX = tmpMinX + ((X - 1) * tmpXFactor)

      For z = 1 To GridSize
        tmpZ = tmpMinZ + ((z - 1) * tmpZFactor)

        .AddXYZ X, ClosestValue(tmpX, tmpZ), z, "", clTeeColor
'        Value[x,z]:=ClosestValue(Source,tmpX,tmpZ); // calculate
      Next z
    Next X
  End With
End Sub

Private Function ClosestValue(ByVal X As Double, z As Double) As Double
Dim Closer As Long, t As Long
Dim tmpX As Double, tmpZ As Double, dist As Double
Dim MaxDist As Double, result As Double
  MaxDist = MaxDistance
  Closer = -1
  result = 0

  With TChart1.Series(0)
  For t = 0 To .Count - 1
    tmpX = .XValues.Value(t) - X
    tmpZ = .asPoint3D.ZValues.Value(t) - z
    dist = Sqr(tmpX ^ 2 + tmpZ ^ 2)
    If dist < MaxDist Then
      MaxDist = dist
      Closer = t
    End If
  Next t
  End With

  If Closer <> -1 Then result = TChart1.Series(0).YValues.Value(Closer)
  ClosestValue = result
End Function

Private Sub Fill()
' Add many random XYZ points to Series1
Dim tmpX As Double, tmpZ As Double
Dim m As Integer, X As Integer, z As Integer
  
  With TChart1.Series(0)
    .Clear
    m = 10
    For X = -m To m
      tmpX = (X / 30) ^ 2
      For z = -m To m
        tmpZ = (z / 30) ^ 2
        tmpZ = Sqr(tmpX + tmpZ)
        .asPoint3D.AddXYZ X, 4 * Cos(3 * tmpZ) * Exp(-0.5 * tmpZ), z, "", clTeeColor
      Next z
    Next X
  End With
End Sub

Private Sub Form_Load()
  MaxDistance = 1E+300
  Fill
  TChart1.Series(0).Active = False
  Gridding 15
End Sub

Private Sub Option1_Click()
  TChart1.Series(0).Active = Option1.Value
  TChart1.Series(1).Active = Option2.Value
End Sub

Private Sub Option2_Click()
  TChart1.Series(0).Active = Option1.Value
  TChart1.Series(1).Active = Option2.Value
End Sub
