VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro  -- Real-Time Example"
   ClientHeight    =   4980
   ClientLeft      =   2715
   ClientTop       =   2490
   ClientWidth     =   7815
   LinkTopic       =   "Form1"
   ScaleHeight     =   4980
   ScaleWidth      =   7815
   Begin TeeChart.TChart TChart1 
      Align           =   1  'Align Top
      Height          =   3195
      Left            =   0
      OleObjectBlob   =   "Form AddRealTime.frx":0000
      TabIndex        =   0
      Top             =   0
      Width           =   7815
   End
   Begin VB.Frame Frame1 
      Caption         =   "Load historical data"
      Height          =   975
      Left            =   180
      TabIndex        =   4
      Top             =   3900
      Width           =   7575
      Begin VB.CommandButton Command3 
         Caption         =   "Load historical data of 50,000 points then continue real-time update"
         Height          =   435
         Left            =   180
         TabIndex        =   5
         Top             =   360
         Width           =   5115
      End
      Begin VB.Label Label1 
         Caption         =   "TeeChart may load large datasets as Arrays 'en-block'."
         Height          =   555
         Left            =   5580
         TabIndex        =   6
         Top             =   240
         Width           =   1815
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   375
      Left            =   6540
      TabIndex        =   3
      Top             =   3300
      Width           =   1155
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Fast Add RealTime"
      Height          =   255
      Left            =   2040
      TabIndex        =   2
      Top             =   3360
      Value           =   1  'Checked
      Width           =   2115
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start Example !"
      Height          =   435
      Left            =   120
      TabIndex        =   1
      Top             =   3300
      Width           =   1635
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' global variable used to control the demo...
Dim Stopped As Boolean
Dim ControlRepaint As Boolean
Dim ResetSeries As Boolean

Private Sub Check3_Click()

End Sub

Private Sub Command1_Click()

' if we are stopping the demo...
If Command1.Caption = "&Stop !" Then
   Command1.Caption = "&Start Example !"
   Check1.Enabled = True
   Stopped = True
   TChart1.AutoRepaint = True
   TChart1.Repaint
   ResetSeries = True
Else
   ' if we are starting the demo...
   ResetSeries = True
   RunDemo
End If
   
End Sub

Private Sub RunDemo()
Dim tmpCount
   
   If ResetSeries = True Then
     TChart1.Series(0).Clear
     TChart1.Series(1).Clear
     TChart1.Axis.Bottom.SetMinMax 0, 3000
   End If
   TChart1.Axis.Left.SetMinMax -500, 500
   
   TChart1.Legend.Visible = False
   
   
   Check1.Enabled = False
   Command1.Caption = "&Stop !"
   
   ' quit infinite loop...
   Stopped = False
   
   tmpCount = 0
   While Not Stopped
    ' if Fast... use AddRealTime...
    If Check1.Value Then
       With TChart1.Series(0)
         If .Count = 0 Then
           .asFastLine.AddRealTime .Count, 1 + (Rnd * 3), "", clTeeColor
         Else
           .asFastLine.AddRealTime .Count, .YValues.Last - 1 + (Rnd * 2), "", clTeeColor
         End If
       End With
       With TChart1.Series(1)
         If .Count = 0 Then
           .asFastLine.AddRealTime .Count, 1 + (Rnd * 3), "", clTeeColor
         Else
           .asFastLine.AddRealTime .Count, .YValues.Last - 1 + (Rnd * 2), "", clTeeColor
         End If
       End With
    Else
    ' if slow.. use AddXY...
       With TChart1.Series(0)
         .AddXY .Count, 500 * Rnd(1000), "", clTeeColor
       End With
       With TChart1.Series(1)
         .AddXY .Count, 500 * Rnd(1000), "", clTeeColor
       End With
    End If
    ' give time to Windows...
    DoEvents
 Wend

End Sub

Private Sub Command2_Click()
  End
End Sub

Private Sub Command3_Click()
 ResetSeries = False
 Dim MyYArray(50000)
 Dim MyY2Array(50000)

  For i = 0 To UBound(MyYArray) - 1
     If i = 0 Then
       MyYArray(i) = 1 + (Rnd * 3)
       MyY2Array(i) = 0.5 + (Rnd * 3)
     Else
       MyYArray(i) = MyYArray(i - 1) - 1 + (Rnd * 2)
       MyY2Array(i) = MyY2Array(i - 1) - 1 + (Rnd * 2)
     End If
  Next i
  
  TChart1.Series(0).Clear
  TChart1.Series(1).Clear
  TChart1.Axis.Bottom.SetMinMax 0, 50000
  
  TChart1.Series(0).AddArray UBound(MyYArray), MyYArray
  TChart1.Series(1).AddArray UBound(MyY2Array), MyY2Array
  RunDemo
End Sub

Private Sub Form_Load()
  TChart1.ClipPoints = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
  End
End Sub


