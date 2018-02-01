VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SmithFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3120
   ClientTop       =   2580
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3990
      TabIndex        =   5
      Text            =   "i"
      Top             =   1020
      Width           =   735
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"SmithFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Circled"
      Height          =   195
      Left            =   1650
      TabIndex        =   3
      Top             =   1050
      Value           =   1  'Checked
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SmithFormForm.frx":054A
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   300
      TabIndex        =   1
      Top             =   990
      Width           =   1095
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Imag. Symbol:"
      Height          =   195
      Left            =   2910
      TabIndex        =   4
      Top             =   1050
      Width           =   990
   End
End
Attribute VB_Name = "SmithFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asSmith.Circled = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
  
  TChart1.Series(0).asSmith.Pointer.Style = psCircle
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(0).asSmith.ImagSymbol = Text2.Text
End Sub
