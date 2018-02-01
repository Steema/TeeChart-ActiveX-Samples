VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfaceWireForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2640
   ClientTop       =   1965
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"SurfaceWireForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SurfaceWireForm.frx":033C
      Left            =   2220
      List            =   "SurfaceWireForm.frx":0349
      TabIndex        =   4
      Text            =   "Palette"
      Top             =   1290
      Width           =   1695
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Wireframe"
      Height          =   195
      Left            =   4560
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1155
   End
   Begin VB.Label Label2 
      Caption         =   "Wireframe colour style:"
      Height          =   195
      Left            =   360
      TabIndex        =   3
      Top             =   1350
      Width           =   1695
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1215
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11235
   End
End
Attribute VB_Name = "SurfaceWireForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asSurface.WireFrame = Check1.Value
End Sub

Private Sub Combo1_Click()
  With TChart1.Series(0).asSurface
    Select Case Combo1.ListIndex
      Case 0: .UseColorRange = False
        .UsePalette = False
      Case 1: .UseColorRange = True
        .UsePalette = False
      Case 2: .UseColorRange = False
        .UsePalette = True
    End Select
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = "Surface series can now display in ""Wire-frame"" mode using the color palette and range." _
  & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).asSurface.UsePalette=True " & Chr(13) _
  & "Example: TChart1.Series(0).asSurface.Pen.Width=2 " & Chr(13) _
  & "Example: TChart1.Series(0).asSurface.WireFrame=True "
  With TChart1
    .Series(0).FillSampleValues 15
    .Series(0).asSurface.WireFrame = True
    .Series(0).asSurface.UseColorRange = False
    .Series(0).asSurface.UsePalette = True
    .Series(0).asSurface.Pen.Width = 2
  End With
End Sub
