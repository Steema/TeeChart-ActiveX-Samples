VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form WallTransparencyForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"WallTransparencyForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1260
      Max             =   100
      TabIndex        =   2
      Top             =   1230
      Value           =   40
      Width           =   1995
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "WallTransparencyForm.frx":07EA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "40%"
      Height          =   195
      Left            =   3360
      TabIndex        =   4
      Top             =   1260
      Width           =   300
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1260
      Width           =   1020
   End
End
Attribute VB_Name = "WallTransparencyForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Example of complex surface
Private Function Calc(ByVal X As Double, ByVal Y As Double) As Double
Dim a As Double, b As Double, c As Double, d As Double
  a = 3
  b = 10
  c = 5
  d = 1

  X = X / 3#
  Y = Y / 3#
  Calc = a * (d - X) ^ 2 * Exp(-(X * X) - (Y + d) ^ 2) _
         - b * (X / c - (X * X * X) - (Y * Y * Y * Y * Y)) * Exp(-(X * X) - (Y * Y)) _
         - (d / a) * Exp(-((X + d) ^ 2) - (Y * Y))
End Function

Private Sub Form_Load()
Dim X As Integer, z As Integer
'  TChart1.Series(0).FillSampleValues 50
'  For x = -10 To 10
'    For z = -10 To 10
'      TChart1.Series(0).asSurface.AddXYZ x, Calc(x, z), z, " ", 0
'    Next z
'  Next x
Dim CountVal As Integer, i As Integer, j As Integer
Dim XArray(21 * 21) As Double
Dim YArray(21 * 21) As Double
Dim ZArray(21 * 21) As Double

'   Fill X, Y, Z arrays
  CountVal = 0
  For i = 0 To 20
    For j = 0 To 20
      X = i - 10
      z = j - 10
      XArray(CountVal + j) = X
      ZArray(CountVal + j) = z
      YArray(CountVal + j) = Calc(X, z)
    Next j
    CountVal = (i + 1) * 21
  Next i

'   Fill surface
  TChart1.Series(0).asSurface.AddArrayXYZ XArray, YArray, ZArray
End Sub

Private Sub HScroll1_Change()
  Label3.Caption = Str(HScroll1.Value) + "%"
  ' Set transparency to all walls
  TChart1.Walls.Left.Transparency = HScroll1.Value
  TChart1.Walls.Right.Transparency = HScroll1.Value
  TChart1.Walls.Bottom.Transparency = HScroll1.Value
  TChart1.Walls.Back.Transparency = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub
