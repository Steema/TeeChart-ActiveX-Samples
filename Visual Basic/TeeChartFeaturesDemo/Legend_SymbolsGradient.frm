VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_SymbolsGradient 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Symbols Gradient"
      Height          =   345
      Left            =   1590
      TabIndex        =   3
      Top             =   1170
      Width           =   1605
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Visible"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1005
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Legend_SymbolsGradient.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Legend_SymbolsGradient.frx":145D6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Legend_SymbolsGradient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Legend.Symbol.Gradient.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.Legend.Symbol.Gradient.ShowEditor False
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
