VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfacePaletteFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3255
   ClientTop       =   2925
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5715
      Left            =   0
      TabIndex        =   0
      Top             =   1200
      Width           =   11505
      Base64          =   $"SurfacePaletteFormForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SurfacePaletteFormForm.frx":04B6
      Left            =   2040
      List            =   "SurfacePaletteFormForm.frx":04C0
      TabIndex        =   2
      Text            =   "Strong"
      Top             =   780
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SurfacePaletteFormForm.frx":04D2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Palette style:"
      Height          =   195
      Left            =   960
      TabIndex        =   3
      Top             =   840
      Width           =   1035
   End
End
Attribute VB_Name = "SurfacePaletteFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  With TChart1.Series(0).asSurface
    .PaletteStyle = Combo1.ListIndex
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 30
End Sub
