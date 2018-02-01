VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AreaOriginFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2550
   ClientTop       =   1620
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"AreaOriginFormForm.frx":0000
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "AreaOriginFormForm.frx":04A6
      Top             =   0
      Width           =   11475
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Origin"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   1230
      Width           =   1755
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   3000
      TabIndex        =   1
      Top             =   1170
      Width           =   1335
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Origin:"
      Height          =   195
      Left            =   2340
      TabIndex        =   3
      Top             =   1230
      Width           =   450
   End
End
Attribute VB_Name = "AreaOriginFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asArea.UseYOrigin = Check1.Value
  TChart1.Series(0).asArea.YOrigin = val(Text1.Text)
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scArea
    .Series(0).FillSampleValues 15
    .Environment.InternalRepaint
    Text1.Text = Trim$(Str$(CInt(.Axis.Left.Minimum + ((.Axis.Left.Maximum - .Axis.Left.Minimum) / 2))))
  End With
End Sub

Private Sub Text1_Change()
  Text1_Validate (True)
End Sub

Private Sub Text1_Validate(Cancel As Boolean)
  If Not IsNumeric(Text1.Text) Then
    KeepFocus = True
    MsgBox "Please insert a number value for Y Axis Origin", , "Text1"
  Else
    TChart1.Series(0).asArea.YOrigin = val(Text1.Text)
  End If
End Sub
