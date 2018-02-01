VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CanvasPolygon 
   BorderStyle     =   0  'None
   Caption         =   "CanvasPolygon"
   ClientHeight    =   6915
   ClientLeft      =   2385
   ClientTop       =   2235
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   465
      Left            =   0
      OleObjectBlob   =   "CanvasPolygon.frx":0000
      TabIndex        =   1
      Top             =   990
      Width           =   7395
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   2
      Top             =   1470
      Width           =   11505
      Base64          =   $"CanvasPolygon.frx":004C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "CanvasPolygon.frx":047E
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "CanvasPolygon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
TeeCommander1.Chart = TChart1
With TChart1
    .Aspect.Chart3DPercent = 50
    .Aspect.Zoom = 100
    .Aspect.Orthogonal = False
    .Aspect.OpenGL.Active = True
    .AddSeries scPoint3D
    .Series(0).FillSampleValues 20
    .Axis.Depth.Visible = True
    .Legend.Symbol.Squared = True
End With
End Sub

Private Sub TChart1_OnAfterDraw()
Dim XArray(4), YArray(4) As Variant
Dim Count As Integer
With TChart1
    .Canvas.Brush.Color = vbCyan
    
    XArray(0) = .Series(0).CalcXPos(5)
    YArray(0) = .Axis.Bottom.Position
    
    For i = 1 To 3
        XArray(i) = .Series(0).CalcXPos(i + 4)
        YArray(i) = .Series(0).CalcYPos(i + 4)
    Next i
    
    XArray(4) = .Series(0).CalcXPos(8)
    YArray(4) = .Axis.Bottom.Position
    
   .Canvas.PolygonWithZ 5, XArray, YArray, 40
End With
End Sub



