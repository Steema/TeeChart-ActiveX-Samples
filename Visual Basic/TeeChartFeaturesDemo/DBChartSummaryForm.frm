VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DBChartSummaryForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2925
   ClientTop       =   3345
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5325
      Left            =   45
      TabIndex        =   4
      Top             =   1575
      Width           =   11400
      Base64          =   $"DBChartSummaryForm.frx":0000
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "DBChartSummaryForm.frx":01BE
      Left            =   5340
      List            =   "DBChartSummaryForm.frx":01D1
      TabIndex        =   3
      Text            =   "Sum"
      Top             =   1140
      Width           =   1695
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "DBChartSummaryForm.frx":01F5
      Left            =   3540
      List            =   "DBChartSummaryForm.frx":0208
      TabIndex        =   2
      Text            =   "ShipVia"
      Top             =   1140
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "DBChartSummaryForm.frx":023C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Group by:"
      Height          =   195
      Left            =   2760
      TabIndex        =   0
      Top             =   1200
      Width           =   690
   End
End
Attribute VB_Name = "DBChartSummaryForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  With TChart1
    Select Case Combo1.ListIndex
      Case 0
        .Series(0).LabelsSource = "EmpNo"
      Case 1
        .Series(0).LabelsSource = "PaymType"
      Case 2
        .Series(0).LabelsSource = "#Year#SaleDate"
      Case 3
        .Series(0).LabelsSource = "ShipVia"
      Case 4
        .Series(0).LabelsSource = "Terms"
    End Select
  End With
End Sub

Private Sub Combo2_Change()
  Combo2_Click
End Sub

Private Sub Combo2_Click()
  With TChart1
    Select Case Combo2.ListIndex
      Case 0
        .Series(0).YValues.ValueSource = "#Sum#AmntPaid"
      Case 1
        .Series(0).YValues.ValueSource = "#Count#AmntPaid"
      Case 2
        .Series(0).YValues.ValueSource = "#High#AmntPaid"
      Case 3
        .Series(0).YValues.ValueSource = "#Low#AmntPaid"
      Case 4
        .Series(0).YValues.ValueSource = "#Avg#AmntPaid"
    End Select
  End With
End Sub
