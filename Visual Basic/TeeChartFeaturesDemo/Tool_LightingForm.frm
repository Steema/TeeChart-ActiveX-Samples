VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Tool_LightingForm 
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
      Height          =   5670
      Left            =   0
      TabIndex        =   0
      Top             =   1245
      Width           =   11505
      Base64          =   $"Tool_LightingForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   750
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Tool_LightingForm.frx":195E
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Light tool properties..."
      Height          =   345
      Left            =   45
      TabIndex        =   1
      Top             =   810
      Width           =   2595
   End
   Begin VB.Label Label1 
      Caption         =   "Drag chart to rotate"
      Height          =   240
      Left            =   2925
      TabIndex        =   3
      Top             =   900
      Width           =   1860
   End
End
Attribute VB_Name = "Tool_LightingForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
TChart1.Tools.Items(0).ShowEditor
End Sub

