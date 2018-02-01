VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Pie_ShadowEllipseForm 
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
      Height          =   5040
      Left            =   0
      TabIndex        =   0
      Top             =   1875
      Width           =   11505
      Base64          =   $"Pie_ShadowEllipseForm.frx":0000
      Begin VB.Timer Timer1 
         Interval        =   200
         Left            =   270
         Top             =   135
      End
   End
   Begin VB.OptionButton Option1 
      Caption         =   "None"
      Height          =   240
      Index           =   0
      Left            =   3690
      TabIndex        =   6
      Top             =   1440
      Width           =   735
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Fast"
      Height          =   240
      Index           =   2
      Left            =   5490
      TabIndex        =   5
      Top             =   1440
      Width           =   735
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Slow"
      Height          =   240
      Index           =   1
      Left            =   4635
      TabIndex        =   4
      Top             =   1440
      Value           =   -1  'True
      Width           =   735
   End
   Begin VB.Frame Frame1 
      Caption         =   "Animation :"
      Height          =   600
      Left            =   3465
      TabIndex        =   3
      Top             =   1170
      Width           =   3075
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View Shadow"
      Height          =   195
      Left            =   375
      TabIndex        =   2
      Top             =   1440
      Value           =   1  'Checked
      Width           =   1950
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Pie_ShadowEllipseForm.frx":04DA
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Pie_ShadowEllipseForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
    TChart1.Repaint
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scPie
    .Series(0).FillSampleValues (10)
    .Header.Text.Clear
    .Series(0).asPie.PiePen.Visible = False
End With
End Sub

Private Sub Option1_Click(Index As Integer)
  Select Case Index
    Case 0:
      Timer1.Enabled = False
    Case 1:
      Timer1.Enabled = True
      Timer1.Interval = 200
    Case 2:
      Timer1.Enabled = True
      Timer1.Interval = 1
  End Select
End Sub

' Use the OnBeforeDrawSeries event to display the shadow, otherwise
' the shadow will be displayed on top of the Pie series...
Private Sub TChart1_OnBeforeDrawSeries()
Dim t, X, Y As Integer
Dim Steps As Integer
Dim tmpW, tmpH  As Double

If Check1.Value Then  ' if we want to display the shadow...
  With TChart1.Canvas
    X = (.Left + .Width) / 2
    Y = ((.Top + .Height) / 2) + (TChart1.Series(0).asPie.CircleHeight / 2)
    Steps = 20
    tmpW = 0.4 * (.Width - TChart1.Series(0).asPie.CircleWidth) / Steps
    tmpH = 0.4 * (.Height - TChart1.Series(0).asPie.CircleWidth) / Steps
    t = Steps
    While t > 1
       .Brush.Color = TChart1.Canvas.ApplyDark(vbWhite, 255 - Round(t * 255# / Steps))
       .Ellipse X - Round(t * tmpW), Y - Round(t * tmpH), X + Round(t * tmpW), Y + Round(t * tmpH)
       t = t - 1
    Wend
  End With
End If
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub

Private Sub Timer1_Timer()
TChart1.Series(0).asPie.RotationAngle = TChart1.Series(0).asPie.RotationAngle + 1
End Sub


