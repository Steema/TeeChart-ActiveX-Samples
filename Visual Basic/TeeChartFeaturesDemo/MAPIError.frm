VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MAPIError 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   4095
   ClientTop       =   1980
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   1
      Top             =   1350
      Width           =   11505
      Base64          =   $"MAPIError.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Export Dialog"
      Height          =   345
      Left            =   2280
      TabIndex        =   2
      Top             =   960
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "MAPIError.frx":0726
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MAPIError"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With TChart1
    .Export.ShowExport
End With
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues 6
End With
End Sub

