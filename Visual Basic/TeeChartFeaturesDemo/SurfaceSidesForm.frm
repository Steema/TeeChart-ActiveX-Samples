VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfaceSidesForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2880
   ClientTop       =   2910
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"SurfaceSidesForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Sides visible"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SurfaceSidesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1.Series(0).asSurface.SideBrush
    If Check1.Value = 1 Then
      .Style = bsSolid
      .Color = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
    Else
      .Style = bsClear
    End If
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = "Surface series can now display ""sides"", using the SideBrush property." & Chr$(13) _
  & "Drag with the Mouse to Rotate the Chart."
  With TChart1.Series(0)
    .FillSampleValues 50
    .asSurface.SideBrush.Style = bsSolid
    .asSurface.SideBrush.Color = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
  End With
End Sub
