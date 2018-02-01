VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Speed_Theme_Demo 
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
   Begin VB.TextBox Text2 
      Height          =   345
      Left            =   4890
      TabIndex        =   6
      Text            =   "1000000"
      Top             =   1290
      Width           =   915
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&Fast Pen"
      Height          =   315
      Left            =   5940
      TabIndex        =   5
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1725
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Add Values"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1245
      Width           =   1155
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw &All points"
      Height          =   285
      Left            =   1500
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1815
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Speed_Theme_Demo.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Speed_Theme_Demo.frx":15B6
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "&Total points:"
      Height          =   285
      Left            =   3480
      TabIndex        =   4
      Top             =   1320
      Width           =   1305
   End
End
Attribute VB_Name = "Speed_Theme_Demo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asFastLine.DrawAllPoints = Check1.Value
  TChart1.Series(1).asFastLine.DrawAllPoints = Check1.Value
End Sub

Private Sub Check2_Click()
  ' When FastLine series have AutoRepaint = False ,
  ' setting FastPen to True increases speed.
  TChart1.Series(0).asFastLine.FastPen = Check2.Value
  TChart1.Series(1).asFastLine.FastPen = Check2.Value
End Sub

'Adds one million points array directly to Series ValueLists
Private Sub ArrayAdd(SeriesIndex As Integer)
  Dim MyX(), MyY() As Long  ' array
  Dim t As Long
  Dim MaxPoints As Long
    
    MaxPoints = Text2.Text  ' one million !

    ' allocate our custom arrays
    ReDim MyX(MaxPoints)
    ReDim MyY(MaxPoints)


    ' fill data in our custom arrays }
    MyX(0) = 0
    MyY(0) = Rnd * 10000
    
    For t = 1 To MaxPoints - 1
      MyX(t) = t
      MyY(t) = MyY(t - 1) + (Rnd * 101) - 50
    Next t

    ' set our  arrays
    With TChart1.Series(SeriesIndex)
     .AddArray MaxPoints, MyY, MyX
      .XValues.Modified = True ' <-- recalculate min and max
      .YValues.Modified = True
    End With

    ' Show data
    TChart1.Series(SeriesIndex).RefreshSeries
End Sub

Private Sub Command1_Click()
  ' This button adds points to Series1 and Series2.
  TChart1.Axis.Bottom.SetMinMax 0, Text2.Text

  ArrayAdd 0
  ArrayAdd 1
End Sub

Private Sub Form_Load()
  With TChart1
    .ClearChart

    .SetTheme ctSpeed, cpTeeChart
    
    .AddSeries scFastLine
    .AddSeries scFastLine
    
    .Series(0).asFastLine.DrawAllPoints = Check1.Value
    .Series(1).asFastLine.DrawAllPoints = Check1.Value
    
    .Series(0).asFastLine.FastPen = Check2.Value
    .Series(1).asFastLine.FastPen = Check2.Value
    
    ' Private variables for this demo:
    MaxPoints = Text2.Text

    ' Prepare series.
    ' Disable AutoRepaint and X Order

    ' AutoRepaint=False means "real-time" drawing mode.
    ' Points are displayed just after adding them,
    ' without redrawing the whole chart.
    .Series(0).asFastLine.AutoRepaint = False
    .Series(1).asFastLine.AutoRepaint = False

    ' Set Ordering to none, to increment speed when adding points
    .Series(0).XValues.Order = loNone
    .Series(1).XValues.Order = loNone

    ' Initialize axis scales
    .Axis.Bottom.SetMinMax 1, MaxPoints

    ' Speed realtime painting with solid pens of width 1.
    .Series(0).asFastLine.FastPen = True
    .Series(1).asFastLine.FastPen = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  MaxPoints = Text1.Text
End Sub
