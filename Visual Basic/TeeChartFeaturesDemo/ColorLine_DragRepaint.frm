VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorLine_DragRepaint 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3690
   ClientTop       =   1980
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5535
      Left            =   0
      TabIndex        =   1
      Top             =   1380
      Width           =   11505
      Base64          =   $"ColorLine_DragRepaint.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "3D"
      Height          =   195
      Left            =   2940
      TabIndex        =   3
      Top             =   1020
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Repaint when dragging"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1020
      Width           =   2055
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ColorLine_DragRepaint.frx":0314
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ColorLine_DragRepaint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
Dim i
  With TChart1.Tools
    For i = 0 To .Count - 1
      .Items(i).asColorLine.DragRepaint = Check1.Value
    Next i
  End With
End Sub

Private Sub Check2_Click()
  TChart1.Aspect.View3D = Check2.Value
End Sub

Private Sub Form_Load()
Dim a

  a = Array(40, 220, 140, 512, 256, 310, 60, 100, 600)
  
  With TChart1.Series(0)
    .AddArray 9, a
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
