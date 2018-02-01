VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PenEndStyleForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2925
   ClientTop       =   2880
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
      Base64          =   $"PenEndStyleForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Chart"
      Height          =   345
      Left            =   4800
      TabIndex        =   4
      Top             =   1230
      Width           =   1335
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "PenEndStyleForm.frx":0794
      Left            =   2640
      List            =   "PenEndStyleForm.frx":07A1
      TabIndex        =   2
      Text            =   "Round"
      Top             =   1230
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PenEndStyleForm.frx":07BA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Pen End Style:"
      Height          =   195
      Left            =   1380
      TabIndex        =   3
      Top             =   1260
      Width           =   1050
   End
End
Attribute VB_Name = "PenEndStyleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  TChart1.Series(0).asCandle.Pointer.Pen.EndStyle = Combo1.ListIndex
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
End Sub
