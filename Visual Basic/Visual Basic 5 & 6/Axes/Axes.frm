VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5475
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7080
   LinkTopic       =   "Form1"
   ScaleHeight     =   5475
   ScaleWidth      =   7080
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Height          =   4530
      Left            =   0
      OleObjectBlob   =   "Axes.frx":0000
      TabIndex        =   0
      Top             =   45
      Width           =   5535
   End
   Begin VB.Frame Frame3 
      Height          =   900
      Left            =   0
      TabIndex        =   10
      Top             =   4575
      Width           =   7065
      Begin VB.CommandButton Command2 
         Caption         =   "Create 2 Charts within a Chart"
         Height          =   420
         Left            =   120
         TabIndex        =   11
         Top             =   270
         Width           =   2400
      End
      Begin VB.Label Label3 
         Caption         =   "*Note. This is not multiple independant Axis support. See the Multiple Axes example."
         Height          =   585
         Left            =   2700
         TabIndex        =   12
         Top             =   270
         Width           =   3495
      End
   End
   Begin VB.Frame Frame1 
      Height          =   4635
      Left            =   5550
      TabIndex        =   1
      Top             =   -60
      Width           =   1515
      Begin VB.Frame Frame2 
         Height          =   2445
         Left            =   60
         TabIndex        =   6
         Top             =   2130
         Width           =   1395
         Begin VB.CommandButton Command1 
            Caption         =   "Add Copied LeftAxis"
            Height          =   600
            Left            =   105
            TabIndex        =   9
            Top             =   1755
            Width           =   1200
         End
         Begin VB.CheckBox Check2 
            Caption         =   "Use Multiline Axis Labels"
            Height          =   645
            Left            =   75
            TabIndex        =   8
            Top             =   870
            Width           =   1170
         End
         Begin VB.CheckBox Check1 
            Caption         =   "Use 2 Vertical axes"
            Height          =   555
            Left            =   75
            TabIndex        =   7
            Top             =   165
            Width           =   1245
         End
      End
      Begin VB.VScrollBar VScroll1 
         Height          =   1095
         Left            =   105
         Max             =   100
         TabIndex        =   4
         Top             =   870
         Value           =   100
         Width           =   300
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   270
         Left            =   90
         Max             =   100
         TabIndex        =   2
         Top             =   195
         Width           =   1350
      End
      Begin VB.Label Label2 
         Caption         =   "Move Bottom Axis"
         Height          =   840
         Left            =   555
         TabIndex        =   5
         Top             =   990
         Width           =   675
      End
      Begin VB.Label Label1 
         Caption         =   "Move Left Axis"
         Height          =   240
         Left            =   105
         TabIndex        =   3
         Top             =   510
         Width           =   1305
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ExistsCustomAxis As Boolean

Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Series(0).VerticalAxis = aBothVertAxis
  Else
    TChart1.Series(0).VerticalAxis = aLeftAxis
  End If
  TChart1.Series(1).VerticalAxis = TChart1.Series(0).VerticalAxis
End Sub

Private Sub Check2_Click()
  'Multiline Axis Labels
  If Check2.Value = 1 Then
    TChart1.Axis.Bottom.Labels.MultiLine = True
    'Adjust Bottom margin
    TChart1.Panel.MarginBottom = TChart1.Panel.MarginBottom + 3
  Else
    TChart1.Axis.Bottom.Labels.MultiLine = False
    TChart1.Panel.MarginBottom = TChart1.Panel.MarginBottom - 3
  End If
End Sub

Private Sub Command1_Click()
  Dim tmpAxisPos As Integer
  
  tmpAxisPos = TChart1.Axis.Left.Position + (TChart1.Axis.Right.Position - TChart1.Axis.Left.Position) / 2
  TChart1.Axis.Left.CustomDraw tmpAxisPos - 10, tmpAxisPos, tmpAxisPos, True
  ExistsCustomAxis = True
End Sub

Private Sub Command2_Click()
Dim tmpAxisPos As Integer
  'Reset Bottom Axis
  TChart1.Axis.Bottom.PositionPercent = 0
  'Setup Series(0) with Left Axis
  TChart1.Series(0).VerticalAxis = aLeftAxis
  TChart1.Axis.Left.PositionPercent = 0
  TChart1.Axis.Left.StartPosition = 0
  TChart1.Axis.Left.EndPosition = 45
  'Setup Series(1) with Right Axis
  TChart1.Series(1).VerticalAxis = aRightAxis
  TChart1.Axis.Right.PositionPercent = 0
  TChart1.Axis.Right.StartPosition = 55
  TChart1.Axis.Right.EndPosition = 100
  
  'Disable non-compatible demo feature
  Check1.Enabled = False
End Sub

Private Sub Form_Load()
Dim i
  With TChart1
    For i = 0 To 20
     .Series(0).Add Rnd(30), "", clTeeColor
     .Series(1).Add Rnd(30), "", clTeeColor
    Next i
  End With
  ExistsCustomAxis = False
End Sub

Private Sub HScroll1_Change()
  TChart1.Axis.Left.PositionPercent = HScroll1.Value
End Sub

Private Sub TChart1_OnAfterDraw()
  If ExistsCustomAxis = True Then
    Command1_Click
  End If
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.ShowEditor
End Sub

Private Sub VScroll1_Change()
  TChart1.Axis.Bottom.PositionPercent = 100 - VScroll1.Value
End Sub


