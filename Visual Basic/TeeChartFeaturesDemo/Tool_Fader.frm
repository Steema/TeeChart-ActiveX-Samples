VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Fader 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   4920
      TabIndex        =   6
      Top             =   930
      Width           =   1035
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Reset"
      Height          =   345
      Left            =   180
      TabIndex        =   5
      Top             =   930
      Width           =   1035
   End
   Begin VB.Frame Frame1 
      Height          =   435
      Left            =   1830
      TabIndex        =   2
      Top             =   870
      Width           =   2715
      Begin VB.OptionButton Option2 
         Caption         =   "Fade out"
         Height          =   255
         Left            =   1290
         TabIndex        =   4
         Top             =   120
         Width           =   1245
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Fade in"
         Height          =   225
         Left            =   150
         TabIndex        =   3
         Top             =   150
         Value           =   -1  'True
         Width           =   1335
      End
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5535
      Left            =   0
      TabIndex        =   1
      Top             =   1380
      Width           =   11505
      Base64          =   $"Tool_Fader.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   825
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_Fader.frx":0546
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_Fader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Repaint
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcFader
  
  With TChart1.Tools.Items(0).asFader
    .InitialDelay = 0
    .Speed = 1
    .Style = fsFadeIn
    .Start
  End With
End Sub

Private Sub Option1_Click()
  TChart1.Tools.Items(0).asFader.Style = fsFadeIn
  TChart1.Tools.Items(0).asFader.Start
End Sub

Private Sub Option2_Click()
  TChart1.Tools.Items(0).asFader.Style = fsFadeOut
  TChart1.Tools.Items(0).asFader.Start
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
