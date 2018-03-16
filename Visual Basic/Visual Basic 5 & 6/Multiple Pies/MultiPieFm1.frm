VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7365
   ClientLeft      =   1080
   ClientTop       =   1905
   ClientWidth     =   11370
   LinkTopic       =   "Form1"
   ScaleHeight     =   7365
   ScaleWidth      =   11370
   Begin TeeChart.TChart TChart1 
      Height          =   6735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   11175
      Base64          =   $"MultiPieFm1.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   10080
      TabIndex        =   2
      Top             =   6960
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animate"
      Height          =   195
      Left            =   240
      TabIndex        =   1
      Top             =   7080
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
'Enable timer
  TChart1.TimerEnabled = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.TimerEnabled = False
  Unload Form1
End Sub

Private Sub Form_Load()
'Fill Pies
 With TChart1
  If .Canvas.IsScreenHighColor = False Then
   .Panel.Gradient.Visible = False
  End If
  .TimerInterval = 30
  .Legend.Visible = False
  .Aspect.View3D = False
        
  'Electricals division
  .AddSeries scPie
  .Series(0).Marks.ArrowLength = -4
  .Series(0).Marks.Font.Size = 7
  .Series(0).Marks.Style = smsLabelValue
  .Series(0).asPie.Circled = True
  .Series(0).Title = "Electricals"
  .Series(0).Add 3, "Lamps,", clTeeColor
  .Series(0).Add 5, "Toasters,", clTeeColor
  .Series(0).Add 2, "Kettles,", clTeeColor
                
  'Computing division
  .AddSeries scPie
  .Series(1).Marks.ArrowLength = -4
  .Series(1).Marks.Style = smsLabelValue
  .Series(1).Marks.Font.Size = 7
  .Series(1).asPie.Circled = True
  .Series(1).Title = "Computing"
  .Series(1).Add 8, "CDRom" & Chr$(13) & "drives,", clTeeColor
  .Series(1).Add 7, "Mainboards,", clTeeColor
  .Series(1).Add 5, "Floppy" & Chr$(13) & "drives,", clTeeColor
  .Series(1).Add 4, "Video boards,", clTeeColor
  .Series(1).Add 4, "Hard" & Chr$(13) & "drives,", clTeeColor
  .Series(1).Add 10, "Sound" & Chr$(13) & "boards,", clTeeColor

  'Electrodomestics division
  .AddSeries scPie
  .Series(2).Marks.ArrowLength = -4
  .Series(2).Marks.Style = smsLabelValue
  .Series(2).Marks.Font.Size = 7
  .Series(2).Title = "Electrodomestics"
  .Series(2).asPie.Circled = True
  .Series(2).Add 12, "Fridges,", clTeeColor
  .Series(2).Add 8, "Freezers,", clTeeColor
  .Series(2).Add 8, "Washing," & Chr$(13) & "machines", clTeeColor
  .Series(2).Add 9, "Dishwashers,", clTeeColor
  .Series(2).Add 2, "Cookers,", clTeeColor
        
  'Electronics division
  .AddSeries scPie
  .Series(3).Marks.ArrowLength = -4
  .Series(3).Marks.Style = smsLabelValue
  .Series(3).Marks.Font.Size = 7
  .Series(3).Title = "Electronics"
  .Series(3).asPie.Circled = True
  .Series(3).Add 12, "Hi-fi,", clTeeColor
  .Series(3).Add 6, "TV-Video,", clTeeColor
  .Series(3).Add 2, "Communications,", clTeeColor
        
  'Total sales
  .AddSeries scPie
  .Series(4).Marks.ArrowLength = -4
  .Series(4).Marks.Style = smsLabelValue
  .Series(4).asPie.Circled = True
  .Series(4).Title = "Total sales"
  .Series(4).Add 10, "Electricals" & Chr$(13), clTeeColor
  .Series(4).Add 38, "Computing" & Chr$(13), clTeeColor
  .Series(4).Add 39, "Electrodomestics" & Chr$(13), clTeeColor
  .Series(4).Add 20, "Electronics" & Chr$(13), clTeeColor
 End With
End Sub

Private Sub TChart1_OnAfterDraw()
Dim i
' Set Pie titles
 With TChart1
  .Canvas.Font.Bold = True
  .Canvas.Font.Color = vbWhite
  For i = 0 To .SeriesCount - 1
   If i = .SeriesCount - 1 Then
    .Canvas.Font.Size = .Canvas.Font.Size + 2
    .Canvas.TextOut .Series(i).asPie.XCenter - (.Canvas.TextWidth("$000's") / 2), .Series(i).asPie.YCenter + .Series(i).asPie.YRadius + 58, "$000s"
   End If
   .Canvas.TextOut .Series(i).asPie.XCenter - (.Canvas.TextWidth(.Series(i).Title) / 2), .Series(i).asPie.YCenter + .Series(i).asPie.YRadius + 40, .Series(i).Title
  Next i
 End With
End Sub

Private Sub TChart1_OnSeriesBeforeDrawValues(ByVal SeriesIndex As Long)
'Place the new location of the Chart before painting the Series
 With TChart1
  Select Case SeriesIndex
    Case 0: .ChartRect 0, 0, .Canvas.Width * 6 / 16, .Canvas.Height / 2
    Case 1: .ChartRect .Canvas.Width * 5 / 16, 0, .Canvas.Width * 11 / 16, .Canvas.Height / 2
    Case 2: .ChartRect 0, .Canvas.Height / 2, .Canvas.Width * 6 / 16, .Canvas.Height
    Case 3: .ChartRect .Canvas.Width * 5 / 16, .Canvas.Height / 2, .Canvas.Width * 11 / 16, .Canvas.Height
    Case 4: .ChartRect .Canvas.Width * 9 / 16, .Canvas.Height / 5, .Canvas.Width, .Canvas.Height * 4 / 5
  End Select
 End With
End Sub

Private Sub TChart1_OnTimer()
Dim i
'Automate !
 For i = 0 To TChart1.SeriesCount - 1
  TChart1.Series(i).asPie.RotationAngle = TChart1.Series(i).asPie.RotationAngle + 1
 Next i
End Sub


