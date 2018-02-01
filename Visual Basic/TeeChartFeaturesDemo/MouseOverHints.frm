VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MouseOverHints 
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
      Height          =   6015
      Left            =   0
      TabIndex        =   1
      Top             =   900
      Width           =   11505
      Base64          =   $"MouseOverHints.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   885
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "MouseOverHints.frx":022E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MouseOverHints"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim lastIndex, idx
Dim aX
Dim aY

Private Sub Form_Load()
  lastIndex = -1
  With TChart1
    .Tools.Add tcRectangle
    .Tools.Items(0).Active = False
    .Series(0).FillSampleValues 5
    With .Tools.Items(0)
      .asRectangle.Shape.CustomPosition = True
      .asRectangle.Width = 20
      .asRectangle.Height = 20
      .asRectangle.AutoSize = True
      .asRectangle.Shape.Transparency = 30
    End With
  End With
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  TChart1.Repaint
  TChart1.Cursor = 21
  With TChart1
    Index = .Series(0).clicked(X, Y)

    With .Tools.Items(0)
        If Index <> -1 Then
            If lastIndex <> Index Then
              .Active = True
              .asRectangle.Left = X
              .asRectangle.Top = Y
            End If
            .asRectangle.Text = "Value:" & TChart1.Series(0).CalcYPos(Index)
        Else
          .Active = False
        End If
    lastIndex = Index
    End With
  End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub
