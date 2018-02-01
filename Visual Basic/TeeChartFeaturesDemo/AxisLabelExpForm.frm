VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form AxisLabelExpForm 
   BorderStyle     =   0  'None
   Caption         =   "AxisLabelExpForm"
   ClientHeight    =   6915
   ClientLeft      =   1950
   ClientTop       =   2040
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   1
      Top             =   1410
      Width           =   11505
      Base64          =   $"AxisLabelExpForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   367
      Object.Left            =   0
      Object.Top             =   94
      Object.Visible         =   -1  'True
      Object.Width           =   767
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   0
      Languaged       =   0
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "AxisLabelExpForm.frx":134E
      Top             =   0
      Width           =   11460
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Exponent labels"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   1110
      Value           =   1  'Checked
      Width           =   1995
   End
End
Attribute VB_Name = "AxisLabelExpForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Axis.Left.Labels.Exponent = Check1.Value
End Sub

Private Sub Form_Load()
  With TChart1
    TChart1.Axis.Left.Labels.Exponent = True
    .Axis.Left.Labels.ValueFormat = "00e-0"
    .Series(0).Add 1, "", clTeeColor
    .Series(0).Add 10, "", clTeeColor
    .Series(0).Add 100, "", clTeeColor
    .Series(0).Add 1000, "", clTeeColor
    .Series(0).Add 10000, "", clTeeColor
    .Series(0).Add 100000, "", clTeeColor
  End With
End Sub
