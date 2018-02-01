VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ErrorBarNegativeFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3390
   ClientTop       =   2340
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   6075
      Left            =   0
      TabIndex        =   0
      Top             =   840
      Width           =   11505
      Base64          =   $"ErrorBarNegativeFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View 3D"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   510
      Width           =   1035
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   435
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ErrorBarNegativeFormForm.frx":090E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ErrorBarNegativeFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Aspect.View3D = True
  Else
    TChart1.Aspect.View3D = False
  End If
End Sub

Private Sub Form_Load()
  With TChart1.Series(0).asErrorBar
    TChart1.Series(0).Clear
    .AddErrorBar 0, -123, 23, "", clTeeColor
    .AddErrorBar 1, 432, 65, "", clTeeColor
    .AddErrorBar 2, -88, 13, "", clTeeColor
    .AddErrorBar 3, 222, 44, "", clTeeColor
    .AddErrorBar 4, -321, 49, "", clTeeColor
  End With
End Sub

Private Sub Text1_Change()
  TChart1.ShowEditor
End Sub
