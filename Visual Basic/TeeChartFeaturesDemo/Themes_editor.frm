VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Themes_editor 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Themes Editor..."
      Height          =   525
      Left            =   180
      TabIndex        =   2
      Top             =   690
      Width           =   2835
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5670
      Left            =   0
      TabIndex        =   0
      Top             =   1245
      Width           =   11505
      Base64          =   $"Themes_editor.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   570
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Themes_editor.frx":179E
      Top             =   30
      Width           =   11640
   End
End
Attribute VB_Name = "Themes_editor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
TChart1.ShowThemesEditor
End Sub

Private Sub Form_Load()
With TChart1
End With
End Sub


Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

