VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MaxMinVisibleForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2280
   ClientTop       =   2460
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
      Base64          =   $"MaxMinVisibleForm.frx":0000
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   4560
      TabIndex        =   7
      Text            =   "0"
      Top             =   1080
      Width           =   315
   End
   Begin VB.CheckBox Check1 
      Caption         =   "All Series Max/Min"
      Height          =   315
      Left            =   5040
      TabIndex        =   6
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1755
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MaxMinVisibleForm.frx":05A8
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label5 
      Caption         =   "SeriesIndex:"
      Height          =   255
      Left            =   3600
      TabIndex        =   8
      Top             =   1140
      Width           =   915
   End
   Begin VB.Label Label4 
      Caption         =   "Minimum:"
      Height          =   195
      Left            =   600
      TabIndex        =   5
      Top             =   1320
      Width           =   795
   End
   Begin VB.Label Label3 
      Caption         =   "Maximum:"
      Height          =   195
      Left            =   600
      TabIndex        =   4
      Top             =   1020
      Width           =   795
   End
   Begin VB.Label Label2 
      Height          =   195
      Left            =   1500
      TabIndex        =   3
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label Label1 
      Height          =   195
      Left            =   1500
      TabIndex        =   2
      Top             =   1020
      Width           =   1275
   End
End
Attribute VB_Name = "MaxMinVisibleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  Text1.Enabled = Not Check1.Value
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 100
  TChart1.Series(1).FillSampleValues 100
  TChart1.Series(2).FillSampleValues 100
  TChart1.Axis.Bottom.SetMinMax 30, 60
End Sub

Private Sub TChart1_OnAfterDraw()
  Label1.Caption = TChart1.Axis.Left.MaxVisibleSeriesValue(Check1.Value, val(Text1.Text))
  Label2.Caption = TChart1.Axis.Left.MinVisibleSeriesValue(Check1.Value, val(Text1.Text))
End Sub

Private Sub Text2_Validate(Cancel As Boolean)
If (Not IsNumeric(Text1.Text)) Or (val(Text1.Text) > TChart1.SeriesCount - 1) Then
      KeepFocus = True
      MsgBox "Please insert a Series number less than or equal to " & Str$(TChart1.SeriesCount - 1)
   End If
End Sub
