VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form AxisLabelAlignFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2745
   ClientTop       =   1635
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"AxisLabelAlignForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   345
      Object.Left            =   0
      Object.Top             =   116
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
   Begin VB.CheckBox Check1 
      Caption         =   "Opposite Label alignment"
      Height          =   315
      Left            =   300
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   2775
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisLabelAlignForm.frx":1318
      Top             =   0
      Width           =   11460
   End
   Begin VB.Frame Frame1 
      Caption         =   "Axis"
      Height          =   495
      Left            =   3300
      TabIndex        =   3
      Top             =   1140
      Width           =   2835
      Begin VB.OptionButton Option1 
         Caption         =   "Right"
         Height          =   195
         Index           =   1
         Left            =   1680
         TabIndex        =   5
         Top             =   180
         Width           =   915
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Left"
         Height          =   195
         Index           =   0
         Left            =   600
         TabIndex        =   4
         Top             =   180
         Value           =   -1  'True
         Width           =   915
      End
   End
End
Attribute VB_Name = "AxisLabelAlignFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 1 Then
      Select Case .Series(0).VerticalAxis
        Case aLeftAxis
             .Axis.Left.Labels.Align = alOpposite
        Case aRightAxis
             .Axis.Right.Labels.Align = alOpposite
      End Select
    Else
      Select Case .Series(0).VerticalAxis
        Case aLeftAxis
             .Axis.Left.Labels.Align = alDefault
        Case aRightAxis
             .Axis.Right.Labels.Align = alDefault
      End Select
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    With .Series(0)
      .Add 278, "Africa", clTeeColor
      .Add 123, "America", clTeeColor
      .Add 321, "Asia", clTeeColor
      .Add 432, "Australia", clTeeColor
      .Add 89, "Europe", clTeeColor
      .Add 300, "Moon", clTeeColor
      .Marks.Style = smsPercent  'show % values
    End With
    ' Set axes labels to "opposite" alignment
    .Axis.Left.Labels.Align = alOpposite
    .Axis.Right.Labels.Align = alOpposite
  End With
End Sub

Private Sub Option1_Click(Index As Integer)
  TChart1.Series(0).VerticalAxis = Index
End Sub

Private Sub Text1_Click()
  TChart1.ShowEditor
End Sub
