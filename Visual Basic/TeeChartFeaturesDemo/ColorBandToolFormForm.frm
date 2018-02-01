VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorBandToolFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2415
   ClientTop       =   2190
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5685
      Left            =   0
      TabIndex        =   0
      Top             =   1230
      Width           =   11505
      Base64          =   $"ColorBandToolFormForm.frx":0000
   End
   Begin VB.CheckBox Check4 
      Caption         =   "Draw behind"
      Height          =   195
      Left            =   5160
      TabIndex        =   5
      Top             =   930
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Gradient"
      Height          =   195
      Left            =   3540
      TabIndex        =   4
      Top             =   930
      Width           =   1395
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Invert axis"
      Height          =   195
      Left            =   1860
      TabIndex        =   3
      Top             =   930
      Width           =   1515
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show bands"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   930
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorBandToolFormForm.frx":04DA
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ColorBandToolFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
Dim i
  With TChart1.Tools
    For i = 0 To .Count - 1
      .Items(i).Active = Check1.Value
    Next i
  End With
End Sub

Private Sub Check2_Click()
  TChart1.Axis.Left.Inverted = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(2).asColorband.Gradient.Visible = Check3.Value
End Sub

Private Sub Check4_Click()
  TChart1.Tools.Items(0).asColorband.DrawBehind = Check4.Value
End Sub

Private Sub Form_Load()
Dim a
  a = Array(30, 150, 75, 280, 600)
  TChart1.Series(0).AddArray 5, a
End Sub
