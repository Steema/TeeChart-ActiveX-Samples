VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Chart appearance"
   ClientHeight    =   8010
   ClientLeft      =   1530
   ClientTop       =   570
   ClientWidth     =   7470
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   8010
   ScaleWidth      =   7470
   StartUpPosition =   2  'CenterScreen
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   495
      Left            =   30
      OleObjectBlob   =   "3DDisplayForm.frx":0000
      TabIndex        =   48
      Top             =   15
      Width           =   7440
   End
   Begin TeeChart.TChart TChart1 
      Height          =   3900
      Left            =   15
      OleObjectBlob   =   "3DDisplayForm.frx":004C
      TabIndex        =   47
      Top             =   540
      Width           =   7455
   End
   Begin VB.Frame Frame1 
      Caption         =   "Display options"
      Height          =   3495
      Left            =   -15
      TabIndex        =   23
      Top             =   4470
      Width           =   4515
      Begin VB.Frame Frame4 
         Height          =   2160
         Left            =   120
         TabIndex        =   45
         Top             =   1200
         Width           =   1275
         Begin VB.Label Label15 
            Alignment       =   2  'Center
            Caption         =   "InChart zooming is still active via left mouse button drag. Scroll with right mouse button."
            Height          =   1575
            Left            =   105
            TabIndex        =   46
            Top             =   375
            Width           =   1065
         End
      End
      Begin VB.CheckBox Check3 
         Caption         =   "ZoomText"
         Height          =   255
         Left            =   150
         TabIndex        =   44
         Top             =   900
         Width           =   1185
      End
      Begin VB.CheckBox Check2 
         Caption         =   "OpenGL"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   150
         TabIndex        =   43
         Top             =   555
         Width           =   1065
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Animate"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   150
         TabIndex        =   42
         Top             =   195
         Width           =   1440
      End
      Begin VB.Frame Frame3 
         Caption         =   "Offset"
         Height          =   1095
         Left            =   1470
         TabIndex        =   33
         Top             =   2280
         Width           =   2895
         Begin VB.HScrollBar HScroll8 
            Height          =   255
            LargeChange     =   100
            Left            =   1080
            Max             =   1500
            Min             =   -1500
            SmallChange     =   10
            TabIndex        =   35
            Top             =   240
            Width           =   1695
         End
         Begin VB.HScrollBar HScroll9 
            Height          =   255
            LargeChange     =   100
            Left            =   1080
            Max             =   1500
            Min             =   -1500
            SmallChange     =   10
            TabIndex        =   34
            Top             =   720
            Width           =   1695
         End
         Begin VB.Label Label12 
            Caption         =   "-1500         0         1500"
            Height          =   180
            Left            =   1095
            TabIndex        =   39
            Top             =   510
            Width           =   1695
         End
         Begin VB.Label Label9 
            Caption         =   "Vertical"
            Height          =   255
            Left            =   360
            TabIndex        =   37
            Top             =   720
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "Horizontal"
            Height          =   375
            Left            =   240
            TabIndex        =   36
            Top             =   240
            Width           =   735
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Rotation"
         Height          =   1095
         Left            =   1470
         TabIndex        =   27
         Top             =   1200
         Width           =   2895
         Begin VB.HScrollBar HScroll6 
            Height          =   255
            LargeChange     =   10
            Left            =   1110
            Max             =   90
            SmallChange     =   2
            TabIndex        =   29
            Top             =   240
            Width           =   1695
         End
         Begin VB.HScrollBar HScroll7 
            Height          =   255
            LargeChange     =   10
            Left            =   1110
            Max             =   90
            SmallChange     =   2
            TabIndex        =   28
            Top             =   720
            Width           =   1695
         End
         Begin VB.Label Label6 
            Caption         =   "360º                       270º"
            Height          =   255
            Left            =   1080
            TabIndex        =   32
            Top             =   510
            Width           =   1695
         End
         Begin VB.Label Label3 
            Caption         =   "Rotation"
            Height          =   255
            Left            =   120
            TabIndex        =   31
            Top             =   240
            Width           =   615
         End
         Begin VB.Label Label4 
            Caption         =   "Elevation"
            Height          =   255
            Left            =   120
            TabIndex        =   30
            Top             =   720
            Width           =   735
         End
      End
      Begin VB.HScrollBar HScroll10 
         Height          =   255
         LargeChange     =   10
         Left            =   2580
         Max             =   100
         SmallChange     =   2
         TabIndex        =   25
         Top             =   735
         Width           =   1695
      End
      Begin VB.HScrollBar HScroll5 
         Height          =   255
         LargeChange     =   10
         Left            =   2565
         Max             =   500
         SmallChange     =   2
         TabIndex        =   24
         Top             =   240
         Value           =   100
         Width           =   1695
      End
      Begin VB.Label Label14 
         Caption         =   "0%                        100%"
         Height          =   255
         Left            =   2595
         TabIndex        =   41
         Top             =   1020
         Width           =   1710
      End
      Begin VB.Label Label13 
         Caption         =   "0%                        500%"
         Height          =   240
         Left            =   2580
         TabIndex        =   40
         Top             =   495
         Width           =   1710
      End
      Begin VB.Label Label10 
         Caption         =   "Perspective"
         Height          =   255
         Left            =   1635
         TabIndex        =   38
         Top             =   750
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "Zoom"
         Height          =   255
         Left            =   1980
         TabIndex        =   26
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.Frame Frame8 
      Caption         =   "Margins"
      Height          =   2055
      Left            =   6120
      TabIndex        =   17
      Top             =   5910
      Width           =   1335
      Begin VB.HScrollBar HScroll3 
         Height          =   375
         Left            =   120
         Max             =   35
         Min             =   3
         TabIndex        =   22
         Top             =   660
         Value           =   3
         Width           =   495
      End
      Begin VB.HScrollBar HScroll4 
         Height          =   375
         Left            =   720
         Max             =   35
         Min             =   3
         TabIndex        =   21
         Top             =   660
         Value           =   5
         Width           =   495
      End
      Begin VB.VScrollBar VScroll3 
         Height          =   375
         Left            =   480
         Max             =   35
         Min             =   3
         TabIndex        =   20
         Top             =   240
         Value           =   3
         Width           =   375
      End
      Begin VB.VScrollBar VScroll4 
         Height          =   375
         Left            =   480
         Max             =   35
         Min             =   3
         TabIndex        =   19
         Top             =   1080
         Value           =   3
         Width           =   375
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Reset"
         Height          =   255
         Left            =   360
         TabIndex        =   18
         Top             =   1635
         Width           =   615
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "3D"
      Height          =   1335
      Left            =   6120
      TabIndex        =   12
      Top             =   4470
      Width           =   1335
      Begin VB.CheckBox Check5 
         Caption         =   "3D Enable"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   285
         Width           =   1095
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   1
         TabIndex        =   13
         Top             =   645
         Value           =   1
         Width           =   1095
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "3D %:"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   1005
         Width           =   615
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   720
         TabIndex        =   15
         Top             =   1005
         Width           =   495
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Walls"
      Height          =   1155
      Left            =   4620
      TabIndex        =   7
      Top             =   6810
      Width           =   1410
      Begin VB.CheckBox Check11 
         Caption         =   "Visible"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   285
         Width           =   855
      End
      Begin VB.HScrollBar HScroll2 
         Height          =   255
         Left            =   120
         Max             =   10
         TabIndex        =   8
         Top             =   600
         Value           =   4
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Size"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   855
         Width           =   375
      End
      Begin VB.Label Label11 
         Height          =   225
         Left            =   720
         TabIndex        =   10
         Top             =   855
         Width           =   375
      End
   End
   Begin VB.Frame AxesFrame 
      Caption         =   "Chart axes"
      Height          =   2295
      Left            =   4620
      TabIndex        =   0
      Top             =   4485
      Width           =   1395
      Begin VB.Frame Frame6 
         Height          =   1335
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   1095
         Begin VB.CheckBox Check10 
            Caption         =   "Right"
            Height          =   255
            Left            =   120
            TabIndex        =   6
            Top             =   960
            Width           =   855
         End
         Begin VB.CheckBox Check9 
            Caption         =   "Bottom"
            Height          =   255
            Left            =   120
            TabIndex        =   5
            Top             =   720
            Width           =   855
         End
         Begin VB.CheckBox Check8 
            Caption         =   "Left"
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Top             =   480
            Width           =   855
         End
         Begin VB.CheckBox Check7 
            Caption         =   "Top"
            Height          =   255
            Left            =   120
            TabIndex        =   3
            Top             =   240
            Width           =   855
         End
      End
      Begin VB.CheckBox Check6 
         Caption         =   "Frame"
         Height          =   255
         Left            =   180
         TabIndex        =   1
         Top             =   1725
         Width           =   855
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog3 
      Left            =   6900
      Top             =   4020
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327681
   End
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   6885
      Top             =   4140
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327681
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6405
      Top             =   4140
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327681
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim DeltaRot, DeltaElev, DeltaZoom As Integer


Private Sub Check1_Click()
  TChart1.TimerEnabled = Check1.Value
  If Check1.Value = 1 Then
    HScroll5.Value = 100
    HScroll6.Value = 20
    HScroll7.Value = 10
  End If
End Sub

Private Sub Check10_Click()
' show / hide Right axis...
  TChart1.Axis.Right.Visible = Check10.Value
End Sub

Private Sub Check11_Click()
' show / hide Walls...
  TChart1.Walls.Visible = Check11.Value
End Sub
Private Sub Check2_Click()
  With TChart1
    .Aspect.OpenGL.Active = Check2.Value
    If Check2.Value = False Then
      .Panel.Gradient.Visible = False
    Else
      .Panel.Gradient.Visible = True
    End If
  End With
End Sub

Private Sub Check3_Click()
  TChart1.Aspect.ZoomText = Check3.Value
End Sub

Private Sub Check5_Click()
' switch 2D / 3D ...
  TChart1.Aspect.View3D = Check5.Value
  HScroll1.Enabled = Check5.Value
End Sub

Private Sub Command1_Click()
    HScroll3.Value = 3
    VScroll3.Value = 3
    HScroll4.Value = 32
    VScroll4.Value = 32
End Sub


Private Sub Check6_Click()
  
  'On top of the Frame are the TChart Axes
  'Therefore you won't see any change unless
  'Axis visible is 'false' on one of the Axes
  
  TChart1.Frame.Visible = Check6.Value
End Sub


Private Sub Check7_Click()
' show / hide Top axis...
 TChart1.Axis.Top.Visible = Check7.Value
End Sub

Private Sub Check8_Click()
' show / hide Left axis...
 TChart1.Axis.Left.Visible = Check8.Value
End Sub


Private Sub Check9_Click()
' show / hide Bottom axis...
 TChart1.Axis.Bottom.Visible = Check9.Value
End Sub



Private Sub Form_Load()
    TeeCommander1.Chart = TChart1
    TChart1.TimerInterval = 100
    DeltaRot = 2
    DeltaElev = 2
    DeltaZoom = 2
    'ZoomText True
    Check3.Value = 1
    Check5.Value = 1
    'Frame on
    Check6.Value = 1
    HScroll1.Value = 80
    HScroll6.Value = 20
    HScroll7.Value = 10
    HScroll10.Value = 50
    'Light for OpenGL
    With TChart1.Aspect.OpenGL.LightPosition
      .X = -90
      .Y = -110
      .Z = -120
    End With
    'Panel colour when OpenGL
    TChart1.Panel.Color = RGB(128, 128, 200)

    'right and bottom margin
    HScroll4.Value = 32
    VScroll4.Value = 32
    'wall size and visible
    TChart1.Walls.Back.Transparent = False
    TChart1.Walls.Back.Brush.Color = vbGreen
    HScroll2.Value = 4
    Check11.Value = 1
    'Axes visible
    Check7.Value = 1
    Check8.Value = 1
    Check9.Value = 1
    Check10.Value = 1
    TChart1.Series(0).FillSampleValues 10
    TChart1.Series(1).FillSampleValues 10


End Sub

Private Sub HScroll1_Change()
' change 3D percent effect...
  TChart1.Aspect.Chart3DPercent = HScroll1.Value
  Label8.Caption = Str$(HScroll1.Value)
End Sub

Private Sub HScroll10_Change()
  TChart1.Aspect.Perspective = HScroll10.Value
End Sub

Private Sub HScroll2_Change()
' change Walls size...
  TChart1.Walls.Left.Size = HScroll2.Value
  TChart1.Walls.Bottom.Size = HScroll2.Value
  TChart1.Walls.Back.Size = HScroll2.Value
  Label11.Caption = Str$(HScroll2.Value)
End Sub


Private Sub Hscroll3_Change()
  TChart1.Panel.MarginLeft = HScroll3.Value
End Sub

Private Sub HScroll4_Change()
  TChart1.Panel.MarginRight = 38 - HScroll4.Value
End Sub

Private Sub Option1_Click()
  With TChart1.Panel.Gradient
    If Option1.Value = True Then
      .Direction = gdLeftRight
    End If
  End With
  Option2.Value = False
  Option3.Value = False
  Option4.Value = False
End Sub

Private Sub Option10_Click()
  With TChart1.Panel
    If Option10.Value = True Then
      .BevelInner = bvRaised
    End If
  End With
  Option8.Value = False
  Option9.Value = False
End Sub

Private Sub Option11_Click()
  With TChart1.Panel
    If Option11.Value = True Then
      .BevelOuter = bvNone
    End If
  End With
  Option12.Value = False
  Option13.Value = False
End Sub

Private Sub Option12_Click()
  With TChart1.Panel
    If Option12.Value = True Then
      .BevelOuter = bvLowered
    End If
  End With
  Option11.Value = False
  Option13.Value = False
End Sub

Private Sub Option13_Click()
  With TChart1.Panel
    If Option13.Value = True Then
      .BevelOuter = bvRaised
    End If
  End With
  Option11.Value = False
  Option12.Value = False
End Sub

Private Sub Option2_Click()
  With TChart1.Panel.Gradient
    If Option2.Value = True Then
      .Direction = gdRightLeft
    End If
  End With
  Option1.Value = False
  Option3.Value = False
  Option4.Value = False
End Sub


Private Sub Option3_Click()
  With TChart1.Panel.Gradient
    If Option3.Value = True Then
      .Direction = gdTopBottom
    End If
  End With
  Option1.Value = False
  Option2.Value = False
  Option4.Value = False
End Sub


Private Sub Option4_Click()
  With TChart1.Panel.Gradient
    If Option4.Value = True Then
      .Direction = gdBottomTop
    End If
  End With
  Option1.Value = False
  Option2.Value = False
  Option3.Value = False
End Sub


Private Sub Option5_Click()
  With TChart1.Panel
    If Option5.Value = True Then
      .BackImageMode = pbmStretch
    End If
  End With
  Option6.Value = False
  Option7.Value = False
End Sub

Private Sub Option6_Click()
  With TChart1.Panel
    If Option6.Value = True Then
      .BackImageMode = pbmTile
    End If
  End With
  Option5.Value = False
  Option7.Value = False
End Sub


Private Sub Option7_Click()
  With TChart1.Panel
    If Option7.Value = True Then
      .BackImageMode = pbmCenter
    End If
  End With
  Option5.Value = False
  Option6.Value = False
End Sub


Private Sub Option8_Click()
  With TChart1.Panel
    If Option8.Value = True Then
      .BevelInner = bvNone
    End If
  End With
  Option9.Value = False
  Option10.Value = False
End Sub


Private Sub Option9_Click()
  With TChart1.Panel
    If Option9.Value = True Then
      .BevelInner = bvLowered
    End If
  End With
  Option8.Value = False
  Option10.Value = False
End Sub

Private Sub VScroll1_Change()
  TChart1.Panel.BevelOffset = VScroll1.Value
End Sub


Private Sub VScroll2_Change()
  TChart1.Panel.BevelWidth = VScroll2.Value
End Sub


Private Sub HScroll5_Change()
  TChart1.Aspect.Zoom = HScroll5.Value
End Sub

Private Sub HScroll6_Change()
  TChart1.Aspect.Rotation = 360 - HScroll6.Value
End Sub

Private Sub HScroll7_Change()
  TChart1.Aspect.Elevation = 360 - HScroll7.Value
End Sub

Private Sub HScroll8_Change()
  TChart1.Aspect.HorizOffset = HScroll8.Value
End Sub

Private Sub HScroll9_Change()
  TChart1.Aspect.VertOffset = HScroll9.Value
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.ShowEditor
  TChart1.StopMouse
End Sub

Private Sub TChart1_OnTimer()
  If Check2.Value = False Then
    HScroll6.Value = HScroll6.Value + DeltaRot
    If (HScroll6.Value <= HScroll6.Min + 5) Or (HScroll6.Value >= HScroll6.Max - 5) Then
       DeltaRot = -DeltaRot
    End If
    HScroll7.Value = HScroll7.Value + DeltaElev
    If (HScroll7.Value <= HScroll7.Min + 5) Or (HScroll7.Value >= HScroll7.Max - 5) Then
       DeltaElev = -DeltaElev
    End If
   Else
    With TChart1.Aspect
     .Rotation = .Rotation + DeltaRot
     .Elevation = .Elevation + DeltaElev
    End With
   End If
  HScroll5.Value = HScroll5.Value + DeltaZoom
  If (HScroll5.Value <= 40) Or (HScroll5.Value >= 280) Then
     DeltaZoom = -DeltaZoom
  End If
End Sub

Private Sub VScroll3_Change()
  TChart1.Panel.MarginTop = VScroll3.Value
End Sub


Private Sub VScroll4_Change()
  TChart1.Panel.MarginBottom = 38 - VScroll4.Value
End Sub




