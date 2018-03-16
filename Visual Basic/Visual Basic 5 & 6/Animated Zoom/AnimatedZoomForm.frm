VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Zoom and Scroll"
   ClientHeight    =   5910
   ClientLeft      =   330
   ClientTop       =   1770
   ClientWidth     =   10605
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5910
   ScaleWidth      =   10605
   StartUpPosition =   2  'CenterScreen
   Begin TeeChart.TChart TChart1 
      Height          =   4335
      Left            =   60
      OleObjectBlob   =   "AnimatedZoomForm.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   10455
   End
   Begin VB.CommandButton Command6 
      Caption         =   "How to UnZoom and UnScroll?"
      Height          =   375
      Left            =   5760
      TabIndex        =   15
      Top             =   4620
      Width           =   3015
   End
   Begin VB.CommandButton Command5 
      Caption         =   "How to Scroll?"
      Height          =   375
      Left            =   3060
      TabIndex        =   14
      Top             =   4620
      Width           =   2355
   End
   Begin VB.CommandButton Command4 
      Caption         =   "How to Zoom?"
      Height          =   375
      Left            =   840
      TabIndex        =   13
      Top             =   4620
      Width           =   1935
   End
   Begin VB.Frame Frame2 
      Height          =   735
      Left            =   7080
      TabIndex        =   6
      Top             =   5160
      Width           =   3495
      Begin VB.OptionButton Option1 
         Caption         =   "None"
         Height          =   255
         Index           =   0
         Left            =   1080
         TabIndex        =   10
         Top             =   150
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Horizontal"
         Height          =   255
         Index           =   1
         Left            =   1080
         TabIndex        =   9
         Top             =   390
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Vertical"
         Height          =   255
         Index           =   2
         Left            =   2160
         TabIndex        =   8
         Top             =   150
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Both"
         Height          =   255
         Index           =   3
         Left            =   2160
         TabIndex        =   7
         Top             =   390
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Scrollable direction"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   11
         Top             =   180
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Height          =   735
      Left            =   0
      TabIndex        =   1
      Top             =   5160
      Width           =   6975
      Begin VB.CheckBox Check1 
         Caption         =   "Animated zoom"
         Height          =   495
         Left            =   3840
         TabIndex        =   4
         Top             =   150
         Width           =   975
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         Left            =   5400
         Max             =   25
         Min             =   1
         TabIndex        =   3
         Top             =   180
         Value           =   1
         Width           =   1335
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Enable Zoom"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   720
         TabIndex        =   2
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Height          =   255
         Left            =   6360
         TabIndex        =   12
         Top             =   480
         Width           =   495
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Zoom steps: "
         Height          =   255
         Left            =   5400
         TabIndex        =   5
         Top             =   480
         Width           =   975
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Fillpoints()
' add sample points to each of the 6 Series...
  FillRandomValues (0)
  FillRandomValues (1)
  FillRandomValues (2)
  FillRandomValues (3)
  FillRandomValues (4)
  FillRandomValues (5)
End Sub

Private Sub FillRandomValues(ASeries As Integer)
' add sample random points to a Series...
Dim t, tmp As Integer
   With TChart1.Series(ASeries)
      tmp = 0
      .Clear
      For t = 1 To 100
        tmp = tmp + Int((500) * Rnd) - 250
        .Add tmp, "", clTeeColor
      Next t
    End With
End Sub


Private Sub Check1_Click()
' turn on/off animated zoom...
TChart1.Zoom.Animated = Check1.Value
End Sub

Private Sub Check2_Click()
' enable / disable zoom...
  With TChart1.Zoom
    .Enable = Check2.Value
    Check1.Enabled = .Enable
    HScroll1.Enabled = .Enable
  End With
End Sub

Private Sub Command4_Click()
  MsgBox ("To zoom drag down and right over desired area, with left mouse button pressed.")
End Sub

Private Sub Command5_Click()
  MsgBox ("To scroll, drag in a permitted scroll direction (see radio buttons below), with right mouse button pressed.")
End Sub

Private Sub Command6_Click()
  MsgBox ("To unzoom or unscroll, place mouse over any part of chart and drag up and left with left mouse button pressed.")
End Sub

Private Sub Form_Load()
  With TChart1
    'enable animated zoom
    .Zoom.Animated = True
    Check1.Value = 1
    Check2.Value = 1
    .Zoom.AnimatedSteps = 10
    HScroll1.Value = 10
    'populate data series
    Fillpoints
    Option1(1).Value = 1
    'set initial axis restraints
    .Axis.Bottom.Automatic = False
    .Axis.Bottom.Maximum = 75
    .Axis.Bottom.Minimum = 25
  End With
End Sub


Private Sub HScroll1_Change()
' change animated zoom "steps"...
  TChart1.Zoom.AnimatedSteps = HScroll1.Value
  Label2.Caption = HScroll1.Value
End Sub


Private Sub Option1_Click(Index As Integer)
' set Scroll option...
  With TChart1.Scroll
    Select Case Index
     Case 0
       .Enable = pmNone
     Case 1
       .Enable = pmHorizontal
     Case 2
       .Enable = pmVertical
     Case 3
       .Enable = pmBoth
    End Select
  End With
End Sub






