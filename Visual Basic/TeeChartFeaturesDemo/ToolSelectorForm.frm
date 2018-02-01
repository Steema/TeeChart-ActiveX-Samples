VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolSelectorForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5280
      Left            =   0
      TabIndex        =   2
      Top             =   1635
      Width           =   11505
      Base64          =   $"ToolSelectorForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ToolSelectorForm.frx":00D4
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Event :"
      Height          =   240
      Left            =   90
      TabIndex        =   1
      Top             =   1260
      Width           =   5550
   End
End
Attribute VB_Name = "ToolSelectorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .AddSeries scBar
    .Series(0).FillSampleValues (5)
    .Tools.Add tcSelector
    With .Tools.Items(0).asSelector
        .AllowDrag = True
        ' Allow resize the Chart from the bottom-right corner
        .AllowResizeChart = True
        .Brush.Color = vbBlue
        .HandleSize = 5
        .Pen.Color = vbRed
    End With
End With
End Sub

Private Sub TChart1_OnSelectorToolDragged()
    Label1.Caption = "Event : SelectorToolDragged"
End Sub

Private Sub TChart1_OnSelectorToolDragging()
    Label1.Caption = "Event : SelectorToolDragging"
End Sub

Private Sub TChart1_OnSelectorToolResized()
    Label1.Caption = "Event : SelectorToolResized"
End Sub

Private Sub TChart1_OnSelectorToolResizing()
    Label1.Caption = "Event : SelectorToolResizing"
End Sub

Private Sub TChart1_OnSelectorToolSelected()
    Label1.Caption = "Event : SelectorToolSelected"
End Sub

