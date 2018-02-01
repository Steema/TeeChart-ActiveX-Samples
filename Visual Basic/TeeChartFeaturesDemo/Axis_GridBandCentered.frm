VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_GridBandCentered 
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
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   405
      Left            =   4620
      TabIndex        =   4
      Top             =   1260
      Width           =   1275
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&Tool Active"
      Height          =   285
      Left            =   2820
      TabIndex        =   3
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Left Axis Centered Grid"
      Height          =   285
      Left            =   210
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2265
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Axis_GridBandCentered.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Axis_GridBandCentered.frx":1268
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Axis_GridBandCentered"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Axis.Left.GridCentered = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).Active = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
