VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_AxisScrollForm 
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
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"Tool_AxisScrollForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Inverted scroll"
      Height          =   195
      Left            =   2340
      TabIndex        =   3
      Top             =   1260
      Width           =   1995
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Enable axis scroll"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1995
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool_AxisScrollForm.frx":02F6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_AxisScrollForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).Active = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asAxisScroll.ScrollInverted = Check2.Value
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .Legend.Visible = False
    .Series(0).FillSampleValues (25)
    .Series(0).HorizontalAxis = aBothHorizAxis
    .Series(0).VerticalAxis = aBothVertAxis
    .Tools.Add tcAxisScroll
    .Tools.Items(0).asAxisScroll.Axis = .Axis.Bottom
End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

