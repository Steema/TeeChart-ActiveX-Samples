VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ValueListMaxMinForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Height          =   4605
      Left            =   0
      TabIndex        =   0
      Top             =   2010
      Width           =   11475
      Base64          =   $"ValueListMaxMinForm.frx":0000
   End
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   270
      Left            =   180
      OleObjectBlob   =   "ValueListMaxMinForm.frx":036A
      TabIndex        =   20
      Top             =   6630
      Width           =   11460
   End
   Begin VB.Frame Frame2 
      Caption         =   "Min visible values"
      Height          =   975
      Left            =   5760
      TabIndex        =   11
      Top             =   960
      Width           =   3405
      Begin VB.Label LowLabelMn 
         Caption         =   "LowValue:"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   600
         Width           =   855
      End
      Begin VB.Label LowValMn 
         Caption         =   "Low"
         Height          =   255
         Left            =   1080
         TabIndex        =   18
         Top             =   600
         Width           =   495
      End
      Begin VB.Label OpenLabelMn 
         Caption         =   "OpenValue:"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   240
         Width           =   855
      End
      Begin VB.Label OpenValMn 
         Caption         =   "Open"
         Height          =   255
         Left            =   1080
         TabIndex        =   16
         Top             =   240
         Width           =   495
      End
      Begin VB.Label HighLabelMn 
         Caption         =   "HighValue:"
         Height          =   255
         Left            =   1680
         TabIndex        =   15
         Top             =   240
         Width           =   855
      End
      Begin VB.Label HighValMn 
         Caption         =   "High"
         Height          =   255
         Left            =   2640
         TabIndex        =   14
         Top             =   240
         Width           =   495
      End
      Begin VB.Label CloseLabelMn 
         Caption         =   "CloseValue:"
         Height          =   255
         Left            =   1680
         TabIndex        =   13
         Top             =   600
         Width           =   855
      End
      Begin VB.Label CloseValMn 
         Caption         =   "Close"
         Height          =   255
         Left            =   2640
         TabIndex        =   12
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Max visible values"
      Height          =   975
      Left            =   1110
      TabIndex        =   2
      Top             =   960
      Width           =   3375
      Begin VB.Label CloseValMx 
         Caption         =   "Close"
         Height          =   255
         Left            =   2640
         TabIndex        =   10
         Top             =   600
         Width           =   495
      End
      Begin VB.Label CloseLabelMx 
         Caption         =   "CloseValue:"
         Height          =   255
         Left            =   1680
         TabIndex        =   9
         Top             =   600
         Width           =   855
      End
      Begin VB.Label HighValMx 
         Caption         =   "High"
         Height          =   255
         Left            =   2640
         TabIndex        =   8
         Top             =   240
         Width           =   495
      End
      Begin VB.Label HighLabelMx 
         Caption         =   "HighValue:"
         Height          =   255
         Left            =   1680
         TabIndex        =   7
         Top             =   240
         Width           =   855
      End
      Begin VB.Label OpenValMx 
         Caption         =   "Open"
         Height          =   255
         Left            =   1080
         TabIndex        =   6
         Top             =   240
         Width           =   495
      End
      Begin VB.Label OpenLabelMx 
         Caption         =   "OpenValue:"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   855
      End
      Begin VB.Label LowValMx 
         Caption         =   "Low"
         Height          =   255
         Left            =   1080
         TabIndex        =   4
         Top             =   600
         Width           =   495
      End
      Begin VB.Label LowLabelMx 
         Caption         =   "LowValue:"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   855
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ValueListMaxMinForm.frx":03BD
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ValueListMaxMinForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  ChartPageNavigator1.Chart = TChart1
  TChart1.Series(0).FillSampleValues 105
End Sub

Private Sub Label7_Click()

End Sub

Private Sub TChart1_OnAfterDraw()
  With TChart1.Series(0)
    If .Count > 0 Then
      OpenLabelMx.Caption = .ValueLists.Items(4).Name
      OpenLabelMn.Caption = .ValueLists.Items(4).Name
      OpenValMx.Caption = .MaxVisibleValue(4)
      OpenValMn.Caption = .MinVisibleValue(4)
      HighLabelMx.Caption = .ValueLists.Items(2).Name
      HighLabelMn.Caption = .ValueLists.Items(2).Name
      HighValMx.Caption = .MaxVisibleValue(2)
      HighValMn.Caption = .MinVisibleValue(2)
      LowLabelMx.Caption = .ValueLists.Items(3).Name
      LowLabelMn.Caption = .ValueLists.Items(3).Name
      LowValMx.Caption = .MaxVisibleValue(3)
      LowValMn.Caption = .MinVisibleValue(3)
      CloseLabelMx.Caption = .ValueLists.Items(1).Name
      CloseLabelMn.Caption = .ValueLists.Items(1).Name
      CloseValMx.Caption = .MaxVisibleValue(1)
      CloseValMn.Caption = .MinVisibleValue(1)
    End If
  End With
End Sub
