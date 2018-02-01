VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Marks_Styles 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Marks_Styles.frx":0000
      Left            =   1290
      List            =   "Marks_Styles.frx":002B
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1050
      Width           =   1965
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Marks_Styles.frx":00E0
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Marks_Styles.frx":05BA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Marks style :"
      Height          =   195
      Left            =   270
      TabIndex        =   3
      Top             =   1110
      Width           =   885
   End
End
Attribute VB_Name = "Marks_Styles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  With TChart1.Series(0).Marks
    Select Case Combo1.ListIndex
    Case 0: .Style = smsValue
    Case 1: .Style = smsPercent
    Case 2: .Style = smsLabel
    Case 3: .Style = smsLabelPercent
    Case 4: .Style = smsLabelValue
    Case 5: .Style = smsLegend
    Case 6: .Style = smsPercentTotal
    Case 7: .Style = smsLabelPercentTotal
    Case 8: .Style = smsXValue
    Case 9: .Style = smsXY
    Case 10: .Style = smsSeriesTitle
    Case 11: .Style = smsPointIndex
    Case 12: .Style = smsPercentRelative
    End Select
  End With
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 10
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
