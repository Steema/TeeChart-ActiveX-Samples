VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BoxPlotCustom 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2445
   ClientTop       =   2280
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4875
      Left            =   0
      TabIndex        =   0
      Top             =   2040
      Width           =   11505
      Base64          =   $"BoxPlotCustom.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Custom  Values"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   1755
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BoxPlotCustom.frx":08BC
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label4 
      Height          =   255
      Left            =   2280
      TabIndex        =   6
      Top             =   1710
      Width           =   4335
   End
   Begin VB.Label Label3 
      Height          =   255
      Left            =   2280
      TabIndex        =   5
      Top             =   1470
      Width           =   4335
   End
   Begin VB.Label Label2 
      Height          =   255
      Left            =   2280
      TabIndex        =   4
      Top             =   1230
      Width           =   4335
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   2280
      TabIndex        =   3
      Top             =   990
      Width           =   4335
   End
End
Attribute VB_Name = "BoxPlotCustom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
With TChart1.Series(0).asBoxPlot
    .UseCustomValues = Check1.Value
    If .UseCustomValues = True Then
        .Median = 15
        .Quartile1 = 13
        .Quartile3 = 17
        .InnerFence1 = 12
        .InnerFence3 = 18
        .OuterFence1 = 10
        .OuterFence3 = 20
        .AdjacentPoint1 = 0
        .AdjacentPoint3 = 7
    End If
End With
TChart1.Repaint
UpDateDisplay
End Sub

Private Sub Form_Load()
Dim MyArray
MyArray = Array(12, 14, 18, 18.5, 18.6, 18.6, 19, 24)
With TChart1
    .Series(0).AddArray 8, MyArray
    UpDateDisplay
End With
End Sub

Private Sub UpDateDisplay()
With TChart1
Label1.Caption = "Median = " & .Series(0).asBoxPlot.Median
Label2.Caption = "Inner Fences = " & .Series(0).asBoxPlot.InnerFence1 & " ; " & .Series(0).asBoxPlot.InnerFence3
Label3.Caption = "Outer Fences = " & .Series(0).asBoxPlot.OuterFence1 & " ; " & .Series(0).asBoxPlot.OuterFence3
Label4.Caption = "Adjacent Points = " & .Series(0).asBoxPlot.AdjacentPoint1 & " ; " & .Series(0).asBoxPlot.AdjacentPoint3
End With
End Sub

Private Sub TChart1_OnAfterDraw()
Check1_Click
End Sub



