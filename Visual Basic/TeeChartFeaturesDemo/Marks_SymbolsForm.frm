VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Marks_SymbolsForm 
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
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"Marks_SymbolsForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View Symbols"
      Height          =   240
      Left            =   135
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1860
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Marks_SymbolsForm.frx":05FE
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit Symbols.."
      Height          =   345
      Left            =   2115
      TabIndex        =   1
      Top             =   1215
      Width           =   1950
   End
End
Attribute VB_Name = "Marks_SymbolsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Series(0).Marks.Symbol.Visible = Check1.Value
End Sub

Private Sub Command2_Click()
    TChart1.Series(0).Marks.ShowEditorMarks
End Sub

Private Sub Form_Load()
    TChart1.Series(0).FillSampleValues (5)
    TChart1.Series(0).Marks.Symbol.Visible = True
End Sub
