VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form GrayScaleFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3525
   ClientTop       =   1995
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
      Base64          =   $"GrayScaleFormForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Inverted"
      Height          =   195
      Left            =   2220
      TabIndex        =   3
      Top             =   1230
      Width           =   1515
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Greyscale"
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "GrayScaleFormForm.frx":0AE6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "GrayScaleFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Repaint
End Sub

Private Sub Check2_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 8
End Sub

Private Sub TChart1_OnAfterDraw()
  If Check1.Value = 1 Then
    TChart1.Canvas.GrayScale Check2.Value
  End If
End Sub
