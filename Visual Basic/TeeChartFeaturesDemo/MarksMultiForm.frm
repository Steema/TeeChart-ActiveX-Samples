VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksMultiForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3270
   ClientTop       =   2490
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"MarksMultiForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Multiline Marks"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1755
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MarksMultiForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).Marks.MultiLine = Check1.Value
End Sub

Private Sub Form_Load()
  Label1.Caption = "Series Marks can now be displayed using multiple lines of text." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).Add 4, ""Hello"" & Chr$(13) & ""world"", clTeeColor" & Chr(13) _
  & "         TChart1.Series(0).Marks.ShadowColor = vbBlack"
  With TChart1
    .AddSeries scBar
    .Series(0).Add 413, "Hello", clTeeColor
    .Series(0).Marks.Style = smsLabelValue
    .Series(0).Marks.MultiLine = True
  End With
End Sub
