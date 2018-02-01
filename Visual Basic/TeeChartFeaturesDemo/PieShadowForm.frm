VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form PieShadowForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3225
   ClientTop       =   3255
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"PieShadowForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw Pie shadow"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1995
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   1155
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PieShadowForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 1 Then
      .Series(0).asPie.Shadow.HorizSize = 15
      .Series(0).asPie.Shadow.VertSize = 15
    Else
      .Series(0).asPie.Shadow.HorizSize = 0
      .Series(0).asPie.Shadow.VertSize = 0
    End If
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = "Pie series has a new subproperty to display a ""shadow"" under it. " _
  & "The Shadow's color and size can be customized." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).asPie.Shadow.Color = vbButtonFace " & Chr(13) _
  & "         TChart1.Series(0).asPie.Shadow.HorizSize=50 "
  With TChart1
    .Series(0).FillSampleValues 7
    .Series(0).asPie.Shadow.HorizSize = 15
    .Series(0).asPie.Shadow.VertSize = 15
  End With
End Sub

Private Sub Label1_DblClick()
  TChart1.ShowEditor
End Sub
