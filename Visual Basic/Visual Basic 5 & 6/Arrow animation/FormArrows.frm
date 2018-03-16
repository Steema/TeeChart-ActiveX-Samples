VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "TeeChart Pro -- Arrow Series example"
   ClientHeight    =   4545
   ClientLeft      =   3165
   ClientTop       =   2160
   ClientWidth     =   7395
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   7395
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   3915
      Left            =   60
      OleObjectBlob   =   "FormArrows.frx":0000
      TabIndex        =   0
      Top             =   60
      Width           =   7275
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   435
      Left            =   5880
      TabIndex        =   1
      Top             =   4080
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   540
      Top             =   4080
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' some variables for the animation...
Dim Animation, Delta As Integer

' add sample arrows...
Private Sub AddArrows()
Dim x0, y0, x1, y1 As Double
With TChart1.Series(0).asArrow
  TChart1.Series(0).Clear
  For t = 1 To 25
    Angle = t * Animation / 180#
    
    x0 = Sin(Angle)
    x1 = x0 + Animation * Cos(Angle) / 5#
    y0 = Cos(Angle)
    y1 = y0 + Animation * Sin(Angle) / 10#
    
    ' each arrow has X0,Y0 and X1,Y1 coordinates...
    .AddArrow x0, y0, x1, y1, "", clTeeColor
  Next
End With
End Sub

Private Sub Command1_Click()
 End
End Sub

Private Sub Form_Load()
 Animation = 1
 Delta = 1
 ' enable animation timer...
 Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
' increment or decrement the animation variables
' and refill the Arrow Series with new data...
  Animation = Animation + Delta
  If Animation < 2 Then
     Delta = 1
  Else
     If Animation > 50 Then
        Delta = -1
     End If
  End If
  AddArrows
End Sub







