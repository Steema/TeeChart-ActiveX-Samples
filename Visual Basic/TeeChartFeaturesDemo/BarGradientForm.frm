VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BarGradientForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   5760
   ClientLeft      =   2790
   ClientTop       =   2205
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   5760
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4665
      Left            =   0
      TabIndex        =   0
      Top             =   1095
      Width           =   11505
      Base64          =   $"BarGradientForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1005
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BarGradientForm.frx":0612
      Top             =   0
      Width           =   11475
   End
End
Attribute VB_Name = "BarGradientForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 3
    .Series(0).asBar.BarStyle = bsRectGradient
    .Series(0).asBar.Gradient.Visible = True
    .Series(0).asBar.Gradient.StartColor = vbButtonFace
    .Series(0).asBar.Gradient.MidColor = vbWhite
  End With
End Sub
