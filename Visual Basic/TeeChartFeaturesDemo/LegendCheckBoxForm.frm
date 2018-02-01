VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendCheckBoxForm 
   BorderStyle     =   0  'None
   Caption         =   "LegendCheckBoxForm"
   ClientHeight    =   6915
   ClientLeft      =   3330
   ClientTop       =   2595
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
      Base64          =   $"LegendCheckBoxForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "LegendCheckBoxForm.frx":0C40
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Legend Checkboxes"
      Height          =   195
      Left            =   300
      TabIndex        =   1
      Top             =   1290
      Value           =   1  'Checked
      Width           =   2235
   End
End
Attribute VB_Name = "LegendCheckBoxForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Legend.CheckBoxes = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Legend.CheckBoxes = True
  TChart1.Series(0).FillSampleValues 10
  TChart1.Series(1).FillSampleValues 10
  TChart1.Series(2).FillSampleValues 10
  TChart1.Series(3).FillSampleValues 10
End Sub
