VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Chart_CustomChartRect 
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
   Begin TeeChart.TChart TChart1 
      Height          =   5175
      Left            =   0
      TabIndex        =   2
      Top             =   1740
      Width           =   11505
      Base64          =   $"Chart_CustomChartRect.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Custom ChartRect"
      Height          =   345
      Left            =   120
      TabIndex        =   1
      Top             =   1350
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1275
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Chart_CustomChartRect.frx":121A
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Chart_CustomChartRect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  With TChart1
    .Header.CustomPosition = True
    .Legend.CustomPosition = True
    
    .CustomChartRect = True
    .ChartRect 50, 50, 200, 200
    .Axis.Left.Labels.Size = -10
    .Axis.Bottom.Labels.Size = -10
  
    With .Tools.Items(0)
      .Active = True
      
      With .asRectangle
        .Left = 50
        .Width = 150
        .Top = 50
        .Height = 150
      End With
    End With
  End With
End Sub


Private Sub TChart1_OnRectangleToolDragged()
  With TChart1.Tools.Items(0).asRectangle
    TChart1.ChartRect .Left, .Top, .Left + .Width, .Top + .Height
  End With
  TChart1.Repaint
End Sub

Private Sub TChart1_OnRectangleToolResized()
  With TChart1.Tools.Items(0).asRectangle
    TChart1.ChartRect .Left, .Top, .Left + .Width, .Top + .Height
  End With
  TChart1.Repaint
End Sub
