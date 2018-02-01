VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartShadowForm 
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
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"ChartShadowForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit shadow..."
      Height          =   345
      Left            =   2010
      TabIndex        =   3
      Top             =   1215
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show shadow"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartShadowForm.frx":0252
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartShadowForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Panel.Shadow.ShowEditor
End Sub

Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Panel.Shadow.HorizSize = 6
    TChart1.Panel.Shadow.VertSize = 6
  Else
    TChart1.Panel.Shadow.HorizSize = 0
    TChart1.Panel.Shadow.VertSize = 0
  End If
End Sub

Private Sub Form_Load()
  TChart1.Panel.Shadow.HorizSize = 6
  TChart1.Panel.Shadow.VertSize = 6
  TChart1.Panel.Shadow.Color = RGB(127, 127, 127)
End Sub
