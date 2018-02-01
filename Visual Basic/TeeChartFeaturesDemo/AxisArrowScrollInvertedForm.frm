VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisArrowScrollInvertedForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2400
   ClientTop       =   4200
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5805
      Left            =   0
      TabIndex        =   0
      Top             =   1110
      Width           =   11505
      Base64          =   $"AxisArrowScrollInvertedForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Scroll Inverted"
      Height          =   255
      Left            =   510
      TabIndex        =   2
      Top             =   750
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisArrowScrollInvertedForm.frx":0704
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "AxisArrowScrollInvertedForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asAxisArrow.ScrollInverted = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 60
  TChart1.Page.Current = 3
End Sub
