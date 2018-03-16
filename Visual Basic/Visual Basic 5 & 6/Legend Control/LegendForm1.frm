VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5595
   ClientLeft      =   2265
   ClientTop       =   3030
   ClientWidth     =   8580
   LinkTopic       =   "Form1"
   ScaleHeight     =   5595
   ScaleWidth      =   8580
   Begin TeeChart.TChart TChart1 
      Height          =   5415
      Left            =   120
      OleObjectBlob   =   "LegendForm1.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   5775
   End
   Begin VB.Frame Frame1 
      Caption         =   "Legend parameters"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5415
      Left            =   6000
      TabIndex        =   1
      Top             =   120
      Width           =   2535
      Begin VB.CheckBox Check3 
         Caption         =   "Visible"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   360
         Width           =   1815
      End
      Begin VB.Frame Frame3 
         Caption         =   "Appearance"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1575
         Left            =   120
         TabIndex        =   11
         Top             =   3720
         Width           =   2295
         Begin VB.CheckBox Check4 
            Caption         =   "Legend Text Bold"
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   1200
            Width           =   1815
         End
         Begin VB.HScrollBar HScroll2 
            Height          =   255
            Left            =   120
            Max             =   25
            Min             =   5
            TabIndex        =   13
            Top             =   720
            Value           =   5
            Width           =   975
         End
         Begin VB.CheckBox Check2 
            Caption         =   "Dividing lines"
            Height          =   255
            Left            =   120
            TabIndex        =   12
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label Label2 
            Caption         =   "Colour width"
            Height          =   255
            Left            =   1200
            TabIndex        =   14
            Top             =   720
            Width           =   975
         End
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Resize Chart"
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   2295
      End
      Begin VB.Frame Frame2 
         Caption         =   "Position"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2535
         Left            =   120
         TabIndex        =   2
         Top             =   1080
         Width           =   2295
         Begin VB.HScrollBar HScroll3 
            Height          =   255
            Left            =   120
            Max             =   40
            TabIndex        =   15
            Top             =   2160
            Width           =   1095
         End
         Begin VB.HScrollBar HScroll1 
            Height          =   255
            Left            =   480
            Max             =   200
            Min             =   -200
            TabIndex        =   8
            Top             =   1560
            Value           =   1
            Width           =   1095
         End
         Begin VB.VScrollBar VScroll1 
            Height          =   975
            Left            =   120
            Max             =   100
            Min             =   -100
            TabIndex        =   7
            Top             =   840
            Value           =   1
            Width           =   255
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Bottom"
            Height          =   195
            Index           =   3
            Left            =   1080
            TabIndex        =   6
            Top             =   480
            Width           =   855
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Top"
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   5
            Top             =   480
            Width           =   735
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Left"
            Height          =   195
            Index           =   1
            Left            =   120
            TabIndex        =   4
            Top             =   240
            Width           =   735
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Right"
            Height          =   195
            Index           =   0
            Left            =   1080
            TabIndex        =   3
            Top             =   240
            Width           =   735
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            Caption         =   "Margin"
            Height          =   255
            Left            =   1200
            TabIndex        =   16
            Top             =   2160
            Width           =   615
         End
         Begin VB.Label Label1 
            Caption         =   "Fine adjust.  Resize Chart 'off' to put Legend inside Chart."
            Height          =   735
            Left            =   480
            TabIndex        =   9
            Top             =   840
            Width           =   1575
         End
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Legend.ResizeChart = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Legend.DividingLines.Visible = Check2.Value
End Sub


Private Sub Check3_Click()
  TChart1.Legend.Visible = Check3.Value
End Sub

Private Sub Check4_Click()
  If Check4.Value = 1 Then
   TChart1.Legend.Font.Bold = True
  Else
   TChart1.Legend.Font.Bold = False
  End If
End Sub

Private Sub Form_Load()
  'Add random data to Series
  TChart1.Series(0).FillSampleValues 20
  TChart1.Series(1).FillSampleValues 20
  TChart1.Series(2).FillSampleValues 20
  'Legend Text Font bold off
  Check4.Value = 0
  'Allow room for the Legend
  Check1.Value = 1
  'Leave Legend in default position
  HScroll1.Value = 0
  VScroll1.Value = 0
  Option1.Item(0) = 1
  TChart1.Legend.Alignment = laRight 'default anyway, just showing the property
  'Colorwidth
  HScroll2.Value = 12
  'Margin
  HScroll3.Value = 0
  'Legend Visible = true
  Check3.Value = 1
End Sub

Private Sub HScroll1_Change()
  'Force the Chart to repaint to accept the new horizontal value
  TChart1.Repaint
End Sub

Private Sub HScroll2_Change()
  TChart1.Legend.ColorWidth = HScroll2.Value
End Sub

Private Sub HScroll3_Change()
If Option1(0).Value = True Or Option1(1).Value = True Then
  TChart1.Legend.HorizMargin = HScroll3.Value
Else
  TChart1.Legend.VertMargin = HScroll3.Value
End If
End Sub

Private Sub Option1_Click(Index As Integer)
With TChart1.Legend
  Select Case Index
    Case 0:      .Alignment = laRight
                 HScroll1.Value = 0
                 HScroll3.Value = 0
                 VScroll1.Value = 0
    Case 1:      .Alignment = laLeft
                 HScroll1.Value = 0
                 HScroll3.Value = 0
                 VScroll1.Value = 0
    Case 2:      .Alignment = laTop
                 HScroll1.Value = 0
                 HScroll3.Value = 0
                 VScroll1.Value = 0
    Case 3:      .Alignment = laBottom
                 HScroll1.Value = 0
                 HScroll3.Value = 0
                 VScroll1.Value = 0
  End Select
End With
End Sub

Private Sub TChart1_OnGetLegendPos(ByVal Index As Long, X As Long, Y As Long, XColor As Long)
 'Move the Legend contents horizontally. The vertical movement is automatic.
 X = X - (0 - HScroll1.Value)
End Sub

Private Sub TChart1_OnGetLegendRect(Left As Long, Top As Long, Right As Long, Bottom As Long)
 'Move the Legend Box
 Left = Left - (0 - HScroll1.Value)
 Right = Right - (0 - HScroll1.Value)
 Top = Top + (VScroll1.Value)
 Bottom = Bottom + (VScroll1.Value)
End Sub

Private Sub VScroll1_Change()
  'Force the Chart to repaint to accept the new vertical value
  TChart1.Repaint
End Sub


