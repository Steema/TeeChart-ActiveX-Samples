VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ContourView2DForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3435
   ClientTop       =   2370
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"ContourView2DForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View 3D"
      Height          =   195
      Left            =   390
      TabIndex        =   2
      Top             =   1230
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ContourView2DForm.frx":0320
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ContourView2DForm"
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
  TChart1.Series(0).FillSampleValues 20
End Sub
