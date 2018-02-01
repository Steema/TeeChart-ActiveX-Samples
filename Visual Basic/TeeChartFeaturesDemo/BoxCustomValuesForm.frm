VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BoxCustomValuesForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5025
      Left            =   0
      TabIndex        =   0
      Top             =   1890
      Width           =   11505
      Base64          =   $"BoxCustomValuesForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom values"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   915
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   825
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BoxCustomValuesForm.frx":09D8
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label3 
      Caption         =   "Outer Fences = []"
      Height          =   255
      Left            =   2040
      TabIndex        =   5
      Top             =   1530
      Width           =   2415
   End
   Begin VB.Label Label2 
      Caption         =   "Inner Fences = []"
      Height          =   255
      Left            =   2040
      TabIndex        =   4
      Top             =   1230
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Median:"
      Height          =   255
      Left            =   2040
      TabIndex        =   3
      Top             =   930
      Width           =   2415
   End
End
Attribute VB_Name = "BoxCustomValuesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    
Private Sub Check1_Click()
  TChart1.Series(0).asBoxPlot.UseCustomValues = (Check1.Value = 1)
  If TChart1.Series(0).asBoxPlot.UseCustomValues Then
    TChart1.Series(0).asBoxPlot.Median = 15
    TChart1.Series(0).asBoxPlot.Quartile1 = 13
    TChart1.Series(0).asBoxPlot.Quartile3 = 17
    TChart1.Series(0).asBoxPlot.InnerFence1 = 12
    TChart1.Series(0).asBoxPlot.InnerFence3 = 18
    TChart1.Series(0).asBoxPlot.OuterFence1 = 10
    TChart1.Series(0).asBoxPlot.OuterFence3 = 20
  End If
  TChart1.Repaint
  UpDateDisplay
End Sub

Private Sub Form_Load()
Dim v As Variant
  v = Array(12, 14, 18, 18.5, 18.6, 18.6, 19, 24)
  ' add sample data
  With TChart1.Series(0)
    .Clear
    .AddArray 8, v
    .asBoxPlot.UseCustomValues = False ' by default, use internal calculating algorithms
  End With
  UpDateDisplay
End Sub

Private Sub UpDateDisplay()
  Label1.Caption = "Median = " + Format(TChart1.Series(0).asBoxPlot.Median, "0.00")
  Label2.Caption = "Inner Fences = [" + Format(TChart1.Series(0).asBoxPlot.InnerFence1, "0.00") + _
    " ; " + Format(TChart1.Series(0).asBoxPlot.InnerFence3, "0.00") + "]"
  Label3.Caption = "Outer Fences = [" + Format(TChart1.Series(0).asBoxPlot.OuterFence1, "0.00") + _
    " ; " + Format(TChart1.Series(0).asBoxPlot.OuterFence3, "0.00") + "]"
End Sub

Private Sub TChart1_OnAfterDraw()
  Check1_Click
End Sub
