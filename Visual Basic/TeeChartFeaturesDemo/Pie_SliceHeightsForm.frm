VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Pie_SliceHeightsForm 
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
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"Pie_SliceHeightsForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   240
      Left            =   3720
      TabIndex        =   4
      Top             =   1305
      Width           =   2490
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Vary slice heights"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   1290
      Value           =   1  'Checked
      Width           =   2310
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Pie_SliceHeightsForm.frx":0C48
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Rotate :"
      Height          =   195
      Left            =   2985
      TabIndex        =   3
      Top             =   1305
      Width           =   570
   End
End
Attribute VB_Name = "Pie_SliceHeightsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
Dim t As Integer
With TChart1
  For t = 0 To .Series(0).Count - 1
  If Check1.Value Then
  
     .Series(0).asDonut.SliceHeight(t) = Round(t * 100 / .Series(0).Count) 'vary height
  Else
     .Series(0).asDonut.SliceHeight(t) = 100 ' total height for all slices
  End If
  Next t
End With
End Sub

Private Sub Form_Load()
  ' change viewer orientation
  With TChart1
    .Series(0).asDonut.RotationAngle = 135
    .Aspect.Elevation = 320
    .Series(0).FillSampleValues (7)
     Check1_Click
    HScroll1.Value = .Series(0).asDonut.RotationAngle
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Series(0).asDonut.RotationAngle = HScroll1.Value
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub

