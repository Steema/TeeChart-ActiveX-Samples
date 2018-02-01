VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Functions_PeriodAlign 
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
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   3600
      TabIndex        =   4
      Top             =   1200
      Value           =   5
      Width           =   1575
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Functions_PeriodAlign.frx":0000
      Left            =   1080
      List            =   "Functions_PeriodAlign.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1200
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Functions_PeriodAlign.frx":0026
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Functions_PeriodAlign.frx":06FA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "5"
      Height          =   195
      Left            =   5280
      TabIndex        =   6
      Top             =   1240
      Width           =   90
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Period:"
      Height          =   195
      Left            =   3000
      TabIndex        =   5
      Top             =   1240
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Period Allign:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1240
      Width           =   915
   End
End
Attribute VB_Name = "Functions_PeriodAlign"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  With TChart1.Series(1).FunctionType
    Select Case Combo1.ListIndex
      Case 0: .PeriodAlign = paFirst
      Case 1: .PeriodAlign = paCenter
      Case 2: .PeriodAlign = paLast
    End Select
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).Name = "Cilinder"
  TChart1.Series(1).Name = "ExpMovAve"

  HScroll1.Max = TChart1.Series(0).Count - 1
  
  Combo1.ListIndex = 1

  With TChart1.Series(1).FunctionType
    .Period = HScroll1.Value
    .PeriodAlign = paCenter
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Series(1).FunctionType.Period = HScroll1.Value
  Label3.Caption = HScroll1.Value
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
