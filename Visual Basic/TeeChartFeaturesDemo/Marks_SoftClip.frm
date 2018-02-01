VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Marks_SoftClip 
   BackColor       =   &H80000005&
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
   Begin VB.CheckBox Check2 
      BackColor       =   &H80000005&
      Caption         =   "Auto Poisition"
      Height          =   255
      Left            =   2880
      TabIndex        =   3
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2580
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5175
      Left            =   0
      TabIndex        =   2
      Top             =   1740
      Width           =   11505
      Base64          =   $"Marks_SoftClip.frx":0000
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H80000005&
      Caption         =   "&Marks SoftClip"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2580
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   1140
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Marks_SoftClip.frx":10AC
      Top             =   60
      Width           =   11250
   End
End
Attribute VB_Name = "Marks_SoftClip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).Marks.SoftClip = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).Marks.AutoPosition = Check2.Value
End Sub

Private Sub Form_Load()
  With TChart1.Series(0).Marks
    .Visible = True
    .SoftClip = Check1.Value
    .AutoPosition = Check2.Value
    .Transparent = False
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

