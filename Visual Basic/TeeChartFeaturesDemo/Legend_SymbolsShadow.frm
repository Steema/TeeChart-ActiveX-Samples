VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_SymbolsShadow 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Visible"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   885
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Shadow"
      Height          =   345
      Left            =   1440
      TabIndex        =   2
      Top             =   1170
      Width           =   1035
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Legend_SymbolsShadow.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Legend_SymbolsShadow.frx":06EC
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Legend_SymbolsShadow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Legend.Symbol.Shadow.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.Legend.Symbol.Shadow.ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1.Legend.Symbol.Shadow
    .HorizSize = 2
    .VertSize = 2
    .Color = vbGrayText
    .Smooth = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
