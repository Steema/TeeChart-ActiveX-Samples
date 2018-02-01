VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Surface_FastBrushForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"Surface_FastBrushForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Axes"
      Height          =   195
      Left            =   5490
      TabIndex        =   5
      Top             =   1290
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use FastBrush"
      Height          =   195
      Left            =   135
      TabIndex        =   3
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Surface_FastBrushForm.frx":0392
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test Speed !"
      Height          =   345
      Left            =   1665
      TabIndex        =   1
      Top             =   1230
      Width           =   1515
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   240
      Left            =   3375
      TabIndex        =   4
      Top             =   1290
      Width           =   1995
   End
End
Attribute VB_Name = "Surface_FastBrushForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asSurface.FastBrush = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Axis.Visible = Check2.Value
  TChart1.Aspect.Orthogonal = False
End Sub

Private Sub Command1_Click()
Dim StartTime, EndTime, TotalTime
Dim t As Integer
    Command1.Enabled = False
    Check1.Enabled = False
    StartTime = Now
  '    StartTime:=GetTickCount;
    For t = 0 To 360
      TChart1.Aspect.Rotation = t
      TChart1.Repaint
    Next t
    EndTime = Now
    TotalTime = (EndTime - StartTime) * 86400
     Label1.Caption = Mid(Str(TotalTime), 1, 6) & " secs."
    Label1.Caption = "Time : " + Mid(Str(TotalTime * 0.001), 1, 6) + " msec."
    'LabelTime.Caption:='Time: '+FloatToStr( (EndTime-StartTime)*0.001 )+' msec.';
    Command1.Enabled = True
    Check1.Enabled = True
End Sub

Private Sub Form_Load()
  Label1.Caption = ""
  With TChart1
    .Aspect.Orthogonal = False
    .Aspect.Zoom = 70
    .Series(0).FillSampleValues (30)
    ' Speed trick, as we know Surface data will not be modified anymore:
    .Series(0).asSurface.FillGridIndex 0
    '.Series(0).asSurface.ReuseGridIndex=true
    .Series(0).asSurface.ReuseGridIndex = True
    .Series(0).asSurface.Pen.Visible = False
    .Series(0).asSurface.FastBrush = True
  
    ' other setting to increase speed:
    .ClipPoints = False
    .Walls.Left.Visible = False
    
    .Axis.FastCalc = True ' <-- bypass overflow checkings...
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

