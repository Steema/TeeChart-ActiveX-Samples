VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_Bar3DForm 
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
      Height          =   5730
      Left            =   0
      TabIndex        =   0
      Top             =   1185
      Width           =   11505
      Base64          =   $"Series_Bar3DForm.frx":0000
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Series_Bar3DForm.frx":043A
      Left            =   810
      List            =   "Series_Bar3DForm.frx":0456
      TabIndex        =   4
      Text            =   "Combo1"
      Top             =   750
      Width           =   1590
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   3465
      TabIndex        =   3
      Top             =   750
      Width           =   1185
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   660
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Series_Bar3DForm.frx":04AF
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Style:"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   795
      Width           =   390
   End
End
Attribute VB_Name = "Series_Bar3DForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo2_Click()
With TChart1
  Select Case Combo2.ListIndex
   Case 0: .Series(0).asBar3D.BarStyle = bsRectangle
   Case 1: .Series(0).asBar3D.BarStyle = bsPyramid
   Case 2: .Series(0).asBar3D.BarStyle = bsInvPyramid
   Case 3: .Series(0).asBar3D.BarStyle = bsCylinder
   Case 4: .Series(0).asBar3D.BarStyle = bsEllipse
   Case 5: .Series(0).asBar3D.BarStyle = bsArrow
   Case 6: .Series(0).asBar3D.BarStyle = bsRectGradient
   Case 7: .Series(0).asBar3D.BarStyle = bsCone
  End Select
End With
End Sub

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
With TChart1
  .AddSeries scBar3D
  .Series(0).asBar3D.AddBar 0, 250, 200, "A", vbRed
  .Series(0).asBar3D.AddBar 1, 10, 200, "B", vbGreen
  .Series(0).asBar3D.AddBar 2, 90, 100, "C", vbYellow
  .Series(0).asBar3D.AddBar 3, 30, 50, "D", vbBlue
  .Series(0).asBar3D.AddBar 4, 70, 150, "E", vbWhite
  .Series(0).asBar3D.AddBar 5, 120, 150, "F", vbSilver
End With
  Combo2.ListIndex = 6
End Sub
