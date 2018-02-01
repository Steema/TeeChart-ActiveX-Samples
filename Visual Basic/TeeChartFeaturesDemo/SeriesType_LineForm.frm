VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_LineForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   Picture         =   "SeriesType_LineForm.frx":0000
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"SeriesType_LineForm.frx":0342
   End
   Begin VB.CheckBox Check5 
      Caption         =   "3D"
      Height          =   240
      Left            =   4365
      TabIndex        =   6
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1140
   End
   Begin VB.CheckBox Check4 
      Caption         =   "Stacked"
      Height          =   240
      Left            =   3060
      TabIndex        =   5
      Top             =   1260
      Width           =   1140
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Pointers"
      Height          =   240
      Left            =   2070
      TabIndex        =   4
      Top             =   1260
      Width           =   915
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Marks"
      Height          =   240
      Left            =   1080
      TabIndex        =   3
      Top             =   1260
      Width           =   870
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs"
      Height          =   240
      Left            =   90
      TabIndex        =   2
      Top             =   1260
      Width           =   870
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   7
      Text            =   "SeriesType_LineForm.frx":0A60
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5535
      TabIndex        =   0
      Top             =   1215
      Width           =   1095
   End
End
Attribute VB_Name = "SeriesType_LineForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Series(0).asLine.Stairs = Check1.Value
    TChart1.Series(1).asLine.Stairs = Check1.Value
End Sub

Private Sub Check2_Click()
    TChart1.Series(0).Marks.Visible = Check2.Value
    TChart1.Series(1).Marks.Visible = Check2.Value
End Sub

Private Sub Check3_Click()
    TChart1.Series(0).asLine.Pointer.Visible = Check3.Value
    TChart1.Series(1).asLine.Pointer.Visible = Check3.Value
End Sub

Private Sub Check4_Click()
  If Check4.Value Then
    TChart1.Series(0).asLine.Stacked = cssStack
  Else
    TChart1.Series(0).asLine.Stacked = cssNone
  End If
End Sub

Private Sub Check5_Click()
    TChart1.Aspect.View3D = Check5.Value
End Sub

Private Sub Command2_Click()
    TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
Dim t As Integer
With TChart1
    .Series(0).Clear
    For t = 1 To 20
        .Series(0).Add Rnd * 100, "", clTeeColor
    Next t
    .Series(0).SetNull (3)  ' <-- null point example
    .Series(1).Clear
    For t = 1 To 20
        .Series(1).Add Rnd * 100, "", clTeeColor
    Next t
    .Series(0).SetNull (10)  ' <-- null point example
    .Axis.Bottom.Increment = 2
End With
End Sub
