VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Editor_FormattingForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"Editor_FormattingForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Editor_FormattingForm.frx":0432
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Zoom Brush"
      Height          =   345
      Left            =   1680
      TabIndex        =   2
      Top             =   1230
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Zoom Pen"
      Height          =   345
      Left            =   60
      TabIndex        =   1
      Top             =   1230
      Width           =   1515
   End
End
Attribute VB_Name = "Editor_FormattingForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
