VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "TeeChart Pro -- Gantt Series example"
   ClientHeight    =   4725
   ClientLeft      =   3150
   ClientTop       =   2190
   ClientWidth     =   7695
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4725
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   3555
      Left            =   120
      OleObjectBlob   =   "FormGantt.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   7455
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Orthogonal"
      Height          =   255
      Left            =   765
      TabIndex        =   10
      Top             =   4410
      Width           =   1110
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2985
      Max             =   20
      Min             =   1
      TabIndex        =   9
      Top             =   4425
      Value           =   4
      Width           =   1155
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D"
      Height          =   195
      Left            =   120
      TabIndex        =   7
      Top             =   4440
      Width           =   615
   End
   Begin VB.CommandButton Command3 
      Caption         =   ">>"
      Height          =   375
      Left            =   5160
      TabIndex        =   6
      Top             =   4200
      Width           =   555
   End
   Begin VB.CommandButton Command2 
      Caption         =   "<<"
      Height          =   375
      Left            =   4380
      TabIndex        =   5
      Top             =   4200
      Width           =   555
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   495
      Left            =   6180
      TabIndex        =   1
      Top             =   4140
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "Bar heights:"
      Height          =   255
      Left            =   2100
      TabIndex        =   8
      Top             =   4425
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Pass mouse pointer over Gantt bars..."
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
      Left            =   120
      TabIndex        =   4
      Top             =   4140
      Width           =   3375
   End
   Begin VB.Label Label2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1740
      TabIndex        =   3
      Top             =   3840
      Width           =   3435
   End
   Begin VB.Label Label1 
      Caption         =   "Gantt values:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   3840
      Width           =   1515
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
' switch 2D / 3D
  TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
    TChart1.Aspect.Orthogonal = True
  Else
    TChart1.Aspect.Orthogonal = False
    TChart1.Aspect.Perspective = 35
    TChart1.Aspect.Chart3DPercent = 50
  End If
End Sub

Private Sub Command1_Click()
  End
End Sub

Private Sub Command2_Click()
' scroll to left 5 days...
 TChart1.Axis.Bottom.Scroll -5, False
End Sub

Private Sub Command3_Click()
' scroll to right 5 days...
 TChart1.Axis.Bottom.Scroll 5, False

End Sub

Private Sub Form_Load()
' add sample gantt values...
  With TChart1.Series(0).asGantt
    .AddGanttColor DateValue("1/1/2001"), _
                   DateValue("20/1/2001"), 1, "Charles", vbRed
    .AddGanttColor DateValue("5/1/2001"), _
                   DateValue("25/1/2001"), 2, "John", vbGreen
    .AddGanttColor DateValue("2/2/2001"), _
                   DateValue("5/5/2001"), 3, "Tony", vbYellow
    .AddGanttColor DateValue("13/3/2001"), _
                   DateValue("2/4/2001"), 4, "Mike", vbBlue
  End With
  
' set vertical axis scales...
  TChart1.Axis.Left.SetMinMax 0, 5
  
' set One Month bottom axis label increment...
  With TChart1.Axis.Bottom
    .Increment = TChart1.GetDateTimeStep(dtOneMonth)
    .Labels.DateTimeFormat = "mmm-dd-yy"
  End With
End Sub

Private Sub HScroll1_Change()
TChart1.Series(0).asGantt.Pointer.VerticalSize = HScroll1.Value
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)

' if mouse pointer is over a gantt bar,
' show the gantt bar dates at Label2...

  With TChart1.Series(0)
    SomeGantt = .Clicked(X, Y)
    If SomeGantt <> -1 Then
    With .asGantt
      Label2.ForeColor = TChart1.Series(0).PointColor(SomeGantt)
      Label2.Caption = "From " + Format(.StartValues.Value(SomeGantt), "mmm-dd-yy") _
                     + " to " + Format(.EndValues.Value(SomeGantt), "mmm-dd-yy")
    End With
    Else
      Label2.Caption = ""
    End If
  End With
End Sub


