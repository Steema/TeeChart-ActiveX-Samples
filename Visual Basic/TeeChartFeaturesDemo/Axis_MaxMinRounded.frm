VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_MaxMinRounded 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox Check2 
      Caption         =   "Minimum Rounded"
      Height          =   195
      Left            =   4740
      TabIndex        =   5
      Top             =   1260
      Width           =   1965
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Maximum Rounded"
      Height          =   195
      Left            =   2550
      TabIndex        =   4
      Top             =   1260
      Width           =   1875
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Axis_MaxMinRounded.frx":0000
      Left            =   540
      List            =   "Axis_MaxMinRounded.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1200
      Width           =   1635
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Axis_MaxMinRounded.frx":001C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Axis_MaxMinRounded.frx":2F06
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Axis:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1260
      Width           =   330
   End
End
Attribute VB_Name = "Axis_MaxMinRounded"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  Select Case Combo1.ListIndex
    Case 0:
      TChart1.Axis.Left.MaximumRound = Check1.Value
    Case 1:
      TChart1.Axis.Bottom.MaximumRound = Check1.Value
  End Select
End Sub

Private Sub Check2_Click()
  Select Case Combo1.ListIndex
    Case 0:
      TChart1.Axis.Left.MinimumRound = Check2.Value
    Case 1:
      TChart1.Axis.Bottom.MinimumRound = Check2.Value
  End Select
End Sub

Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0:
          If TChart1.Axis.Left.MaximumRound Then
            Check1.Value = 1
          Else
            Check1.Value = 0
          End If
        
          If TChart1.Axis.Left.MinimumRound Then
            Check2.Value = 1
          Else
            Check2.Value = 0
          End If
    Case 1:
          If TChart1.Axis.Bottom.MaximumRound Then
            Check1.Value = 1
          Else
            Check1.Value = 0
          End If
      
          If TChart1.Axis.Bottom.MinimumRound Then
            Check2.Value = 1
          Else
            Check2.Value = 0
          End If
  End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo2_Change()
  Combo1_Change
End Sub

Private Sub Combo2_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues (100)
  
  Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
