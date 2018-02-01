VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "LegendSeriesFormForm"
   ClientHeight    =   6915
   ClientLeft      =   3060
   ClientTop       =   3360
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"LegendSeriesFormForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "LegendSeriesFormForm.frx":08EA
      Top             =   0
      Width           =   11460
   End
   Begin VB.Frame Frame1 
      Height          =   675
      Left            =   0
      TabIndex        =   1
      Top             =   1020
      Width           =   11460
      Begin VB.OptionButton Option2 
         Caption         =   "Line"
         Height          =   315
         Left            =   2700
         TabIndex        =   3
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Bar"
         Height          =   315
         Left            =   960
         TabIndex        =   2
         Top             =   240
         Value           =   -1  'True
         Width           =   1275
      End
   End
End
Attribute VB_Name = "LegendSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
.Series(0).FillSampleValues 10
.Series(1).FillSampleValues 10
.Legend.ColumnWidthAuto = False
.Legend.ColumnWidths(0) = 30
End With
End Sub
Private Sub Option1_Click()
TChart1.Legend.Series = 0
End Sub
Private Sub Option2_Click()
TChart1.Legend.Series = 1
End Sub
