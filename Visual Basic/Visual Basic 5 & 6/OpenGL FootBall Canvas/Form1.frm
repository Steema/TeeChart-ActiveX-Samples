VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro 4 ActiveX -- Team's League positions"
   ClientHeight    =   5970
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9090
   LinkTopic       =   "Form1"
   ScaleHeight     =   5970
   ScaleWidth      =   9090
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   1  'Align Top
      Height          =   525
      Left            =   0
      OleObjectBlob   =   "Form1.frx":0000
      TabIndex        =   1
      Top             =   0
      Width           =   9090
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5250
      Left            =   105
      TabIndex        =   0
      Top             =   600
      Width           =   7050
      Base64          =   $"Form1.frx":004C
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&View Chart"
      Height          =   375
      Left            =   7560
      TabIndex        =   9
      Top             =   5280
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Animate !"
      Height          =   375
      Left            =   7560
      TabIndex        =   8
      Top             =   4800
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   7800
      Top             =   600
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   390
      LargeChange     =   100
      Left            =   7335
      Max             =   300
      Min             =   -300
      SmallChange     =   10
      TabIndex        =   4
      Top             =   4080
      Value           =   10
      Width           =   1710
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   405
      LargeChange     =   100
      Left            =   7335
      Max             =   300
      Min             =   -300
      SmallChange     =   10
      TabIndex        =   3
      Top             =   1050
      Value           =   -10
      Width           =   1725
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   2145
      LargeChange     =   100
      Left            =   8040
      Max             =   300
      Min             =   -300
      SmallChange     =   10
      TabIndex        =   2
      Top             =   1635
      Width           =   420
   End
   Begin VB.Label Label4 
      Caption         =   "Y"
      Height          =   285
      Left            =   7680
      TabIndex        =   7
      Top             =   2520
      Width           =   270
   End
   Begin VB.Label Label3 
      Caption         =   "Z"
      Height          =   240
      Left            =   7320
      TabIndex        =   6
      Top             =   3825
      Width           =   285
   End
   Begin VB.Label Label2 
      Caption         =   "X"
      Height          =   195
      Left            =   7320
      TabIndex        =   5
      Top             =   855
      Width           =   285
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const NumPlayers = 6
Dim PlayersX(NumPlayers - 1), PlayersY(NumPlayers - 1) As Integer
Dim DeltaPlayersX(NumPlayers - 1), DeltaPlayersY(NumPlayers - 1) As Integer
Dim DeltaElev, DeltaZoom, BallX, BallY, DeltaBallX, DeltaBallY As Integer

Private Sub FillData()
  With TChart1.Series(0)
    .Add 9, "Sep", clTeeColor
    .Add 5, "Oct", clTeeColor
    .Add 5, "Nov", clTeeColor
    .Add 4, "Dec", clTeeColor
    .Add 2, "Jan", clTeeColor
    .Add 1, "Feb", clTeeColor
    .Add 3, "Mar", clTeeColor
    .Add 2, "Apr", clTeeColor
    .Add 1, "May", clTeeColor
  End With
End Sub
  
Private Sub Check1_Click()
  Timer1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
    FillData
  Else
    TChart1.Series(0).Clear
  End If
  TChart1.Axis.Visible = Check2.Value
  TChart1.Header.Visible = Check2.Value
  TChart1.Footer.Visible = Check2.Value
End Sub

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  TChart1.Aspect.OpenGL.Active = True
  
  With TChart1.Aspect.OpenGL.LightPosition
   .x = HScroll1.Value
   .z = HScroll2.Value
   .y = VScroll2.Value
  End With
  
  FillData
  
  For t = 0 To NumPlayers - 1
    PlayersX(t) = 200 * Rnd(1) - 100
    PlayersY(t) = 100 * Rnd(1) - 50
    DeltaPlayersX(t) = 0
    DeltaPlayersY(t) = 0
  Next
  
  DeltaBallX = 2
  DeltaBallY = 3
  DeltaZoom = 1 '%
  DeltaElev = 1
  BallX = -20
  BallY = 20
End Sub


Private Sub MovePoint(ByRef APointX, APointY, ADeltaX, ADeltaY As Integer)
  APointX = APointX + ADeltaX
  If (APointX < -210) Or (APointX > 210) Then ADeltaX = -ADeltaX
  APointY = APointY + ADeltaY
  If (APointY < -100) Or (APointY > 100) Then ADeltaY = -ADeltaY
End Sub

Private Sub HScroll1_Change()
  HScroll1_Scroll
End Sub

Private Sub HScroll2_Change()
  HScroll2_Scroll
End Sub

Private Sub Timer1_Timer()
Dim t As Integer
  
  ' move the ball...
  MovePoint BallX, BallY, DeltaBallX, DeltaBallY
  
  ' move the players...
  For t = 0 To NumPlayers - 1
  
    If Rnd(1) < 0.05 Then
      DeltaPlayersX(t) = 0
      DeltaPlayersY(t) = 0
    Else
      If DeltaPlayersX(t) = 0 Then
         If Rnd(1) < 0.1 Then
            DeltaPlayersX(t) = 2
         Else
         If Rnd(1) < 0.1 Then DeltaPlayersX(t) = -2
         End If
      End If
      If DeltaPlayersY(t) = 0 Then
         If Rnd(1) < 0.1 Then DeltaPlayersY(t) = 2
         Else
         If Rnd(1) < 0.1 Then DeltaPlayersY(t) = -2
      End If
      MovePoint PlayersX(t), PlayersY(t), DeltaPlayersX(t), DeltaPlayersY(t)
    End If
  Next

  ' rotate the field...
  With TChart1.Aspect
    .Rotation = .Rotation + 2
    If Rnd(1) < 0.1 Then
      .Elevation = .Elevation + DeltaElev
      If (.Elevation < 300) Or (.Elevation > 350) Then DeltaElev = -DeltaElev
    End If
    .Zoom = .Zoom + DeltaZoom * .Zoom / 100#
    If (.Zoom < 60) Or (.Zoom > 1000) Then DeltaZoom = -DeltaZoom
    If .VertOffset > -150 Then .VertOffset = .VertOffset - 1
  End With
 
End Sub

Private Sub VScroll2_Change()
 VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  TChart1.Aspect.OpenGL.LightPosition.y = VScroll2.Value
End Sub

Private Sub HScroll1_Scroll()
  TChart1.Aspect.OpenGL.LightPosition.x = HScroll1.Value
End Sub

Private Sub HScroll2_Scroll()
  TChart1.Aspect.OpenGL.LightPosition.z = HScroll2.Value
End Sub

Private Sub TChart1_OnAfterDraw()

 With TChart1.Canvas
   .Font.Color = vbWhite
   .Font.Size = 16
   .TextOut3D .Left + (.Width / 2) - 120, 50, 0, "Team's performance"
   DrawPitch
 End With
 
End Sub

 Private Sub DrawPlayer(x, y, z As Integer, BodyColor, ArmColor, PantsColor, LegsColor As Long)
 Dim clSkin As Long
 
   clSkin = RGB(241, 226, 190)

   With TChart1.Canvas
   
     .Pen.Style = psClear

     ' head
     .Brush.Color = clSkin
     .Sphere x, y - 20, z, 2.5

     ' neck
     .Cylinder True, x - 1, y - 18, x + 1, y - 16, z - 1, z + 1, True

     ' eyes
     .Brush.Color = clBlack
     .Sphere x - 3, y - 21, z - 1, 0.5
     .Sphere x - 3, y - 21, z + 1, 0.5

     ' body
     .Brush.Color = BodyColor
     .Cube x - 2, x + 2, y - 16, y - 8, z - 3, z + 3, True

     ' arms
     .Brush.Color = ArmColor
     .Cylinder True, x - 1, y - 16, x + 2, y - 10, z - 5, z - 3, True
     .Cylinder True, x - 1, y - 16, x + 2, y - 10, z + 5, z + 3, True

     ' bottom arms
     .Brush.Color = clSkin
     .Cylinder True, x - 1, y - 10, x + 2, y - 5, z - 5, z - 3, True
     .Cylinder True, x - 1, y - 10, x + 2, y - 5, z + 5, z + 3, True

     ' pants
     .Brush.Color = PantsColor
     .Cube x - 2, x + 2, y - 8, y - 4, z - 3, z + 3, True

     ' legs
     .Brush.Color = clSkin
     .Cylinder True, x - 1, y - 4, x + 2, y, z - 4, z, True
     .Cylinder True, x - 1, y - 4, x + 2, y, z + 4, z, True

     ' bottom legs
     .Brush.Color = LegsColor
     .Cylinder True, x - 2, y, x + 2, y + 8, z - 3, z, True
     .Cylinder True, x - 2, y, x + 2, y + 8, z + 4, z + 1, True

     ' feet
     .Brush.Color = clBlack
     .Cube x - 3, x + 2, y + 8, y + 10, z - 2, z - 1, True
     .Cube x - 3, x + 2, y + 8, y + 10, z + 2, z + 1, True
   End With
 End Sub


 Private Sub DrawGateArea(x1, y, w, zSize)
  With TChart1.Canvas
    .MoveTo3D x1, y, 50 - zSize
    .LineTo3D x1 + w, y, 50 - zSize
    .LineTo3D x1 + w, y, 50 + zSize
    .LineTo3D x1, y, 50 + zSize
  End With
End Sub
 

Private Sub DrawPitch()
Dim y, r, t, z, x1, X2, tmp, ChartXCenter, ChartYCenter As Long

  With TChart1.Canvas
    x1 = 0
    w = 220
    r = 40
  
    ChartXCenter = .Left + (.Width / 2)
    ChartYCenter = .Top + .Height
    
    ' green color
    .Brush.Color = RGB(0, 221, 0)
    .Pen.Color = RGB(0, 128, 0)

    ' bottom base
    tmp = ChartXCenter
    
    .Brush.Color = vbBlack
    .Cube tmp - 230, tmp + 230, ChartYCenter - 2, ChartYCenter + 4, -100, 200, False

    ' bottom carpet
    .Pen.Style = psClear
    .Brush.Color = RGB(0, 221, 0)
    .RectangleY tmp - 220, ChartYCenter - 6, tmp + 220, -90, 190

    y = ChartYCenter - 8

    ' light gray color to draw lines
    .Pen.Style = psSolid
    .Pen.Color = vbWhite

    .Brush.Style = bsClear

    ' big rectangle
    .RectangleY tmp - w + 20, y, tmp + w - 20, -80, 180

    ' center line
    .MoveTo3D tmp, y, -80
    .LineTo3D tmp, y, 180

    ' middle circle
    DrawArc tmp, y, 50, r, 0, 36

    ' left gate area lines
    DrawGateArea tmp - w + 20, y, 60, 70
    DrawArc tmp - w + 20 + 35, y, 50, 40, 22, 32
    DrawGateArea tmp - w + 20, y, 20, 30

    ' left gate and net
    DrawGate tmp - w + 20, y, 18, 50, 20
    DrawGate tmp - w + 10, y, 12, 50, 18
    DrawGateNet tmp - w + 20, y, 10

    ' right gate area lines
    DrawGateArea tmp + w - 20, y, -60, 70
    DrawArc tmp + w - 20 - 35, y, 50, 40, 4, 14
    DrawGateArea tmp + w - 20, y, -20, 30

    ' right gate and net
    DrawGate tmp + w - 20, y, 18, 50, 20
    DrawGate tmp + w - 10, y, 12, 50, 18
    DrawGateNet tmp + w - 20, y, -10

    ' the four corners
    DrawCorner tmp - w + 20, y, -80, 27, 36
    DrawCorner tmp + w - 20, y, -80, 0, 9
    DrawCorner tmp - w + 20, y, 180, 18, 27
    DrawCorner tmp + w - 20, y, 180, 9, 18

    ' the two penalties and center point
    DrawArc tmp - w + 20 + 45, y, 50, 1, 0, 36
    DrawArc tmp + w - 20 - 45, y, 50, 1, 0, 36
    DrawArc tmp, y, 50, 1, 0, 36

    ' the ball
    .Brush.Color = vbWhite
    .Sphere BallX, ChartYCenter - 8, BallY, 2.5

    ' the back public seats
    .Pen.Style = psClear
    x1 = tmp - w + 12
    X2 = tmp + w - 12
    y = y + 6
    For t = 1 To 10
      z = 200 + 16 * (t - 1)
      .Brush.Color = RGB(176, 96, 112)
      .RectangleWithZ x1, y, X2, y - 6, z
      .Brush.Color = RGB(112, 112, 176)
      .RectangleY x1, y - 6, X2, z, z + 16
      y = y - 6
    Next
    
    y = ChartYCenter - 17

    For t = 0 To NumPlayers - 2
      DrawPlayer ChartXCenter + PlayersX(t), y, 50 + PlayersY(t), vbBlue, vbBlue, vbMaroon, RGB(231, 116, 118)
    Next
      
    DrawPlayer ChartXCenter + PlayersX(NumPlayers - 1), y, 50 + PlayersY(NumPlayers - 1), vbWhite, vbLime, vbRed, vbYellow
 
  End With
End Sub

Private Sub DrawGate(x, y, h, z, zSize As Integer)
   
  With TChart1.Canvas
    .MoveTo3D x, y, z - zSize
    .LineTo3D x, y - h, z - zSize
    .LineTo3D x, y - h, z + zSize
    .LineTo3D x, y, z + zSize
  End With
 
End Sub

 Private Sub DrawGateNet(x, y, xSize As Integer)
 Dim t As Integer
 
   With TChart1.Canvas
     .Pen.Style = psDot
     For t = -9 To 9
       .MoveTo3D x, y - 18, 50 + CInt(2.1 * t)
       .LineTo3D x - xSize, y - 12, 50 + 2 * t
     Next
     For t = -9 To 9
       .MoveTo3D x - xSize, y - 12, 50 + 2 * t
       .LineTo3D x - xSize, y, 50 + 2 * t
     Next
     For t = 0 To 6
       .MoveTo3D x, y - CInt(2.2 * t), 50 + 20
       .LineTo3D x - xSize, y - 2 * t, 50 + 18
       .LineTo3D x - xSize, y - 2 * t, 50 - 18
       .LineTo3D x, y - CInt(2.2 * t), 50 - 20
     Next
     .Pen.Style = psSolid
   End With
 End Sub
 

 Private Sub DrawArc(x, y, z, Radius, MinAngle, MaxAngle)
 Dim t As Integer
 Dim s, c, Pi As Double
  
   Pi = 3.14159265358979
 
   With TChart1.Canvas
   For t = MinAngle To MaxAngle
     s = Sin(t * Pi / 18)
     c = Cos(t * Pi / 18)
     If t = MinAngle Then
       .MoveTo3D x - CInt(Radius * s), y, z + CInt(Radius * c)
     Else
       .LineTo3D x - CInt(Radius * s), y, z + CInt(Radius * c)
     End If
   Next
   End With
 End Sub

 Private Sub DrawCorner(x, y, z, MinAngle, MaxAngle As Integer)
   DrawArc x, y, z, 12, MinAngle, MaxAngle
 End Sub



