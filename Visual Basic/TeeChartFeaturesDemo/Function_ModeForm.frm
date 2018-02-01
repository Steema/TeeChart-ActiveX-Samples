VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_ModeForm 
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
      Height          =   5805
      Left            =   0
      TabIndex        =   0
      Top             =   1110
      Width           =   11505
      Base64          =   $"Function_ModeForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Hide Null values"
      Height          =   195
      Left            =   2475
      TabIndex        =   3
      Top             =   810
      Width           =   2130
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Include Null values"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   810
      Value           =   1  'Checked
      Width           =   2130
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_ModeForm.frx":0446
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Function_ModeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Series(1).FunctionType.asMode.IncludeNulls = Check1.Value
End Sub

Private Sub Check2_Click()
    If Check2.Value Then
        TChart1.Series(0).asFastLine.IgnoreNulls = False
    Else
        TChart1.Series(0).asFastLine.IgnoreNulls = True
    End If
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .AddSeries scFastLine
    .Series(0).FillSampleValues (15)
    ' Set some null values for this example...
    .Series(0).SetNull 11
    .Series(0).SetNull 14
    .Series(0).SetNull 3
    .AddSeries scLine
    .Series(1).SetFunction tfMode
    .Series(1).Title = "Mode"
    .Series(1).DataSource = "Series0"
End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub
