VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ClockEdiForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3000
   ClientTop       =   2325
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart2 
      Height          =   5955
      Left            =   5640
      TabIndex        =   2
      Top             =   930
      Width           =   5820
      Base64          =   $"ClockEdiForm.frx":0000
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5955
      Left            =   30
      TabIndex        =   0
      Top             =   930
      Width           =   5610
      Base64          =   $"ClockEdiForm.frx":0770
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit LinePoint"
      Height          =   345
      Left            =   6000
      TabIndex        =   4
      Top             =   480
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Clock Series"
      Height          =   345
      Left            =   330
      TabIndex        =   3
      Top             =   480
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   375
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ClockEdiForm.frx":0ADA
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ClockEdiForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Command2_Click()
  TChart2.EditOneSeries 0
End Sub

Private Sub Form_Load()
  TChart2.Series(0).FillSampleValues 6
End Sub
