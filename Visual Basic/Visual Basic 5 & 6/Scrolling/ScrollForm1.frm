VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "ScrollForm"
   ClientHeight    =   5415
   ClientLeft      =   1620
   ClientTop       =   1485
   ClientWidth     =   7560
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5415
   ScaleWidth      =   7560
   StartUpPosition =   2  'CenterScreen
   Begin TeeChart.TChart TChart1 
      Height          =   4335
      Left            =   120
      OleObjectBlob   =   "ScrollForm1.frx":0000
      TabIndex        =   0
      Top             =   480
      Width           =   7335
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Repaint only at hourly steps"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4560
      TabIndex        =   5
      Top             =   4920
      Width           =   1695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Default         =   -1  'True
      Height          =   375
      Left            =   6300
      TabIndex        =   4
      Top             =   4920
      Width           =   1155
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   4920
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animate"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3240
      TabIndex        =   2
      Top             =   4920
      Width           =   1215
   End
   Begin VB.CommandButton AddOneMorePoint 
      Caption         =   "Add point and scroll"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   4920
      Width           =   3015
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Example of date-time Chart scrolling"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   375
      Left            =   900
      TabIndex        =   3
      Top             =   0
      Width           =   5295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dd As Integer
Dim Autorepaint As Boolean


Private Sub FillDemoPoints()
Dim t As Integer

  With TChart1.Series(0)
    'fill the LineSeries with some random data
    .Clear   ' <-- this removes all points from Series1
    'let's add 60 minutes from 12:00 to 12:59
    For t = 0 To 59
      .AddXY DateValue(dd & ",1,1999") + TimeValue("12:" & t & ":00"), Rnd(100), "", vbRed
    Next t

   'let's add 60 more minutes from 13:00 to 13:59
    For t = 0 To 59
      .AddXY DateValue(dd & ",1,1999") + TimeValue("13:" & t & ":00"), Rnd(100), "", vbRed
    Next t
  End With
  ' now scroll the Chart for first time...
  ScrollHorizAxis
End Sub

Private Sub ScrollHorizAxis()
  With TChart1.Axis.Bottom  ' <-- with the Horizontal Axis...
      .Automatic = False        ' <-- we dont want automatic scaling

      ' In this example, we will set the Axis Minimum and Maximum values to
      ' show One Hour of data ending at last point Time plus 5 minutes
      
      .Maximum = TChart1.Series(0).XValues.Maximum + TimeValue("0:5:0")
      .Minimum = .Maximum - TimeValue("1:0:0")
  End With
End Sub


Private Sub AddOneMorePoint_Click()
Dim h, m, s As Integer
  
  With TChart1.Series(0).XValues
    m = Minute(.Last)
    h = Hour(.Last)
  End With
  
  'add a new random point to the Series (one more minute)
  s = 0
  m = m + 1
  If m = 60 Then
     If Autorepaint = False Then
       TChart1.Autorepaint = True
       TChart1.Repaint
     End If
     m = 0
     If h = 23 Then
       h = 0
       dd = dd + 1
     Else
       h = h + 1
     End If
     If Autorepaint = False Then
       TChart1.Autorepaint = False
     End If
  End If
  TChart1.Series(0).AddXY (DateValue(dd & ",1,1999") + TimeValue(h & ":" & m & ":" & s)), Rnd(100), "", RGB(0 + (m * 3), 255 - (m * 3), 0 + (m * 3))
  
  'Now scroll the axis to show the last hour of data
  ScrollHorizAxis
End Sub

Private Sub Check1_Click()
'toggle Timer to auto-add points
 Timer1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
 If Check2.Value = 1 Then
   Autorepaint = False
   TChart1.Autorepaint = False
 Else
   Autorepaint = True
   TChart1.Autorepaint = True
   TChart1.Repaint
 End If
End Sub


Private Sub Command2_Click()
 End
End Sub

Private Sub Form_Load()
  dd = 15
  Autorepaint = True
  FillDemoPoints
End Sub

Private Sub TChart1_OnAfterDraw()
  TChart1.Canvas.Font.Color = vbBlue
  TChart1.Canvas.Font.Bold = True
  TChart1.Canvas.TextOut TChart1.Panel.MarginLeft * TChart1.Canvas.Width / 100, 10, _
                            (Format(DateValue(dd & ",2,2001"), "dd mmmm yyyy"))
End Sub

Private Sub Timer1_Timer()
'Call Sub to add points
  AddOneMorePoint_Click
End Sub




