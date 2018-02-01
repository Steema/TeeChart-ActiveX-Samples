VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form AntiAliasForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Height          =   5595
      Left            =   45
      TabIndex        =   2
      Top             =   1305
      Width           =   11445
      Base64          =   $"AntiAliasForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   373
      Object.Left            =   3
      Object.Top             =   87
      Object.Visible         =   -1  'True
      Object.Width           =   763
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
      Caption         =   "Use Anti-Alias"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   990
      Width           =   1815
   End
   Begin VB.TextBox AntiAliasForm 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AntiAliasForm.frx":0DD6
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "AntiAliasForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Canvas.UseAntiAlias = Check1.Value
End Sub

Private Sub Form_Load()
With TChart1
  .Aspect.View3D = False
  .Header.Visible = False
  .Legend.Visible = False
  
  .AddSeries scPie
  .AddSeries scPie
  
  .Series(0).FillSampleValues 10
  .Series(1).FillSampleValues 10
  
  .Series(0).asPie.Circled = True
  .Series(1).asPie.Circled = True
  
  .Series(0).asPie.Shadow.Visible = False
  .Series(1).asPie.Shadow.Visible = False
  
  
  For i = 0 To .Series(0).Count - 1
    .Series(0).PointLabel(i) = "Text" & CStr(i)
  Next i
End With
End Sub
