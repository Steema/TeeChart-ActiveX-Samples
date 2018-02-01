VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfaceSmoothForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2805
   ClientTop       =   2460
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
      Base64          =   $"SurfaceSmoothForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Smooth Palette"
      Height          =   255
      Left            =   60
      TabIndex        =   2
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1935
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11235
   End
End
Attribute VB_Name = "SurfaceSmoothForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asSurface.SmoothPalette = Check1.Value
End Sub

Private Sub Form_Load()
  Label1.Caption = "Surface series can fill each cell using the color calculated as the average " _
  & "of each cell 4 corner colors. By default, only one corner color is used." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).asSurface.SmoothPalette=True"
  With TChart1.Series(0)
    .FillSampleValues 15
    .asSurface.SmoothPalette = True
  End With
End Sub
