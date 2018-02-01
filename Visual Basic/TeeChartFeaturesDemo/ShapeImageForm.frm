VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ShapeImageForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3285
   ClientTop       =   3345
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"ShapeImageForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Transparent"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1290
      Width           =   1755
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1215
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ShapeImageForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    Select Case Check1.Value
      Case 1: .Series(0).asShape.Transparent = True
        .Series(1).asShape.Transparent = True
      Case 0: .Series(0).asShape.Transparent = False
        .Series(1).asShape.Transparent = False
    End Select
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = "Shape series now accept Images to fill the interior. The Brush property is used " _
  & "to set the image bitmap." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).asShape.Brush.LoadImage ""c:\myimage.bmp"" "
  With TChart1
    .Series(0).asShape.Brush.LoadImage App.Path & "\Pattern2.bmp"
    .Series(1).asShape.Brush.LoadImage App.Path & "\Pattern1.bmp"
  End With
End Sub
