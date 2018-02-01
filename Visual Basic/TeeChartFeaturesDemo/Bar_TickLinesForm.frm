VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Bar_TickLinesForm 
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
      Height          =   5460
      Left            =   0
      TabIndex        =   0
      Top             =   1455
      Width           =   11505
      Base64          =   $"Bar_TickLinesForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show tick lines"
      Height          =   195
      Left            =   2010
      TabIndex        =   3
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1770
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Bar_TickLinesForm.frx":05DA
      Top             =   0
      Width           =   11460
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Tick lines..."
      Height          =   345
      Left            =   180
      TabIndex        =   1
      Top             =   1020
      Width           =   1515
   End
End
Attribute VB_Name = "Bar_TickLinesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Series(0).asBar.TickLines.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
    TChart1.Series(0).asBar.TickLines.ShowEditor
End Sub

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .Series(0).FillSampleValues (6)
    .Series(0).asBar.TickLines.Visible = True
End With
End Sub
