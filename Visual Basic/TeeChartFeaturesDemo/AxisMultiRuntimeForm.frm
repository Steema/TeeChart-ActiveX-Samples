VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form AxisMultiRuntimeForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2790
   ClientTop       =   2340
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleMode       =   0  'User
   ScaleWidth      =   6518.182
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"AxisMultiRuntimeForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   357
      Object.Left            =   0
      Object.Top             =   104
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
      Caption         =   "Single Axis"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1230
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   30
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisMultiRuntimeForm.frx":0FFC
      Top             =   0
      Width           =   11430
   End
End
Attribute VB_Name = "AxisMultiRuntimeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Axis1, Axis2 As Integer
Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 1 Then
      .Series(1).VerticalAxis = aLeftAxis
      .Series(2).VerticalAxis = aLeftAxis
      .Axis.Left.EndPosition = 100
    Else
      .Series(1).VerticalAxisCustom = Axis1
      .Series(2).VerticalAxisCustom = Axis2
      .Axis.Left.EndPosition = 30
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (1000)
    .Series(1).FillSampleValues (1000)
    .Series(2).FillSampleValues (1000)
    ' create the axes...
    Axis1 = .Axis.AddCustom(False)
    .Axis.Custom(Axis1).StartPosition = 30
    .Axis.Custom(Axis1).EndPosition = 60
    .Axis.Custom(Axis1).AxisPen.Color = .Series(1).Color
    .Series(1).VerticalAxisCustom = Axis1
    Axis2 = .Axis.AddCustom(False)
    .Axis.Custom(Axis2).StartPosition = 60
    .Axis.Custom(Axis2).EndPosition = 100
    .Axis.Custom(Axis2).AxisPen.Color = .Series(2).Color
    .Series(2).VerticalAxisCustom = Axis2
    .Axis.Left.EndPosition = 30
  End With
End Sub
