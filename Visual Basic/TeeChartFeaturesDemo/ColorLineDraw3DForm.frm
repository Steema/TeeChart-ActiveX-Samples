VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorLineDraw3DForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
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
      Base64          =   $"ColorLineDraw3DForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Draw behind"
      Height          =   195
      Left            =   2040
      TabIndex        =   3
      Top             =   1260
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw 3D"
      Height          =   195
      Left            =   480
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorLineDraw3DForm.frx":0416
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ColorLineDraw3DForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(0).asColorLine.Draw3D = (Check1.Value = 1)
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asColorLine.DrawBehind = (Check2.Value = 1)
End Sub

Private Sub Form_Load()
Dim v As Double
  TChart1.Series(0).FillSampleValues (25)

  'Find center
  With TChart1.Series(0).YValues
    v = (.Maximum + .Minimum) / 2
  End With
  TChart1.Tools.Items(0).asColorLine.Value = v
End Sub

