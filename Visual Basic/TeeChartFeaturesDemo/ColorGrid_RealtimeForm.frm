VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorGrid_RealtimeForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"ColorGrid_RealtimeForm.frx":0000
      Begin VB.Timer Timer1 
         Left            =   675
         Top             =   720
      End
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Smooth"
      Height          =   195
      Left            =   3735
      TabIndex        =   4
      Top             =   1260
      Width           =   1140
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Reuse GridIndex"
      Height          =   195
      Left            =   1575
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   2040
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animation"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1260
      Width           =   1140
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorGrid_RealtimeForm.frx":042E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Size :"
      Height          =   195
      Left            =   5085
      TabIndex        =   5
      Top             =   1275
      Width           =   390
   End
End
Attribute VB_Name = "ColorGrid_RealtimeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public DemoPoints, X As Integer


Private Sub UpdateTheChart()
Dim Y, z, Index As Double
With TChart1
  Index = .Series(0).Count
  'ColorGrid.BeginUpdate;
  X = X + 1
  For z = 0 To DemoPoints - 1
      Y = random * 100
      .Series(0).asColorGrid.AddXYZ X, Y, z, "", RGB(Rnd * 255, Rnd * 255, Rnd * 255)
  Next z

 ' BEGIN SPEED OPTIMIZATIONS
  '{$IFNDEF CLR}
 '   TListHack(ColorGrid.XValues).RecalcStats(Index);
 '   TListHack(ColorGrid.YValues).RecalcStats(Index);
 '   TListHack(ColorGrid.ZValues).RecalcStats(Index);
  '{$ENDIF}
  If .Series(0).asColorGrid.ReuseGridIndex Then
       .Series(0).asColorGrid.FillGridIndex (Index)
  End If
  'END SPEED OPTIMIZATIONS

  .Repaint
  '  ColorGrid.EndUpdate;
End With
End Sub


Private Sub Check1_Click()
  If Check1.Value Then
    With TChart1.Series(0)
        .Clear
        .asColorGrid.NumXValues = 0
        .asColorGrid.NumZValues = 0
        X = -1
    End With
  End If
  Timer1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asColorGrid.ReuseGridIndex = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Series(0).asColorGrid.SmoothBitmap = Check3.Value
End Sub

Private Sub Form_Load()
Dim X As Integer
  DemoPoints = 100
  X = -1
  Timer1.Enabled = False
  Timer1.Interval = 1
  ' Remove chart parts to improve drawing speed
  With TChart1
    .AddSeries scColorGrid
    .Aspect.View3D = False
    .Legend.Visible = False
    .ClipPoints = False
    .Axis.Left.GridPen.Visible = False
    .Axis.Bottom.GridPen.Visible = False
    .Series(0).asColorGrid.Pen.Visible = False
    ' Speed tricks:
    .Series(0).asColorGrid.ReuseGridIndex = True
    .Axis.FastCalc = True
  End With
End Sub

Private Sub Timer1_Timer()
  UpdateTheChart
  Label1.Caption = "Size: " & TChart1.Series(0).asColorGrid.NumXValues & " x " & TChart1.Series(0).asColorGrid.NumZValues
End Sub
