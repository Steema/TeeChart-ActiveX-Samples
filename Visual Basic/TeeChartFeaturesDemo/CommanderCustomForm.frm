VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CommanderCustomForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3255
   ClientTop       =   2100
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"CommanderCustomForm.frx":0000
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   465
      Left            =   0
      OleObjectBlob   =   "CommanderCustomForm.frx":00B8
      TabIndex        =   2
      Top             =   960
      Width           =   7035
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CommanderCustomForm.frx":0104
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "CommanderCustomForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  TeeCommander1.Controls = Array(tcbRotate, _
                                 tcbSeparator, _
                                 tcbZoom, _
                                 tcbSeparator, _
                                 tcbEdit)
End Sub
