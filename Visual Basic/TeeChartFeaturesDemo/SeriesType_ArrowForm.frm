VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_ArrowForm 
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
      Height          =   5925
      Left            =   0
      TabIndex        =   0
      Top             =   990
      Width           =   11505
      Base64          =   $"SeriesType_ArrowForm.frx":0000
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   1350
         Top             =   1125
      End
   End
   Begin VB.CheckBox Check3 
      Caption         =   "3D"
      Height          =   195
      Left            =   3735
      TabIndex        =   4
      Top             =   645
      Value           =   1  'Checked
      Width           =   1545
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Animate"
      Height          =   195
      Left            =   2025
      TabIndex        =   3
      Top             =   645
      Width           =   1545
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Color each"
      Height          =   195
      Left            =   315
      TabIndex        =   2
      Top             =   645
      Value           =   1  'Checked
      Width           =   1545
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   525
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesType_ArrowForm.frx":0468
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesType_ArrowForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).ColorEachPoint = Check1.Value
End Sub

Private Sub Check2_Click()
  Timer1.Enabled = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Aspect.View3D = Check3.Value
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scArrow
    .Series(0).asArrow.ArrowWidth = 32
    .Series(0).asArrow.ArrowHeight = 24
    .Series(0).XValues.DateTime = False
    .Series(0).YValues.DateTime = False
    .Series(0).VerticalAxis = aBothVertAxis
    .Series(0).HorizontalAxis = aBothHorizAxis
    .Legend.Visible = False
    AddArrows
End With
End Sub

Private Sub AddArrows()
Dim X0, Y0, X1, Y1 As Double
Dim t As Integer

With TChart1.Series(0)
    .Clear
    For t = 1 To 40
      X0 = Rnd * 1000
      Y0 = Rnd * 1000
      X1 = (Rnd * 300) - 150#
      If X1 < 50 Then
        X1 = 50
      End If
      X1 = X1 + X0
      Y1 = (Rnd * 300) - 150#
      If Y1 < 50 Then
        Y1 = 50
      End If
      Y1 = Y1 + Y0
      .asArrow.AddArrow X0, Y0, X1, Y1, "", clTeeColor
    Next t
    .ColorEachPoint = True
End With
End Sub

Private Sub Timer1_Timer()
Dim t As Integer
  Timer1.Enabled = False
  With TChart1.Series(0)
    For t = 0 To .Count - 1
        .asArrow.StartXValues.Value(t) = .asArrow.StartXValues.Value(t) + (Rnd * 100) - 50#
        .asArrow.StartYValues.Value(t) = .asArrow.StartYValues.Value(t) + (Rnd * 100) - 50#
        .asArrow.EndXValues.Value(t) = .asArrow.EndXValues.Value(t) + (Rnd * 100) - 50#
        .asArrow.EndYValues.Value(t) = .asArrow.EndYValues.Value(t) + (Rnd * 100) - 50#
    Next t
    .RefreshSeries
  End With
  Timer1.Enabled = True
End Sub
