VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartListBox_EditorForm 
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
      Height          =   5385
      Left            =   2205
      TabIndex        =   0
      Top             =   1500
      Width           =   9270
      Base64          =   $"ChartListBox_EditorForm.frx":0000
   End
   Begin TeeChart.TeeListBox TeeListBox1 
      Height          =   5385
      Left            =   0
      OleObjectBlob   =   "ChartListBox_EditorForm.frx":0432
      TabIndex        =   3
      Top             =   1485
      Width           =   2220
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Editor"
      Height          =   195
      Left            =   3060
      TabIndex        =   2
      Top             =   1215
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartListBox_EditorForm.frx":048C
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartListBox_EditorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Check1.Value Then
    TeeListBox1.ShowEditor
  Else
    TeeListBox1.HideEditor
  End If
End Sub

Private Sub Form_Load()
With TChart1
  For i = 0 To 3
    .AddSeries scLine
    .Series(i).FillSampleValues (5)
  Next i
End With
TeeListBox1.Chart = TChart1
End Sub
