VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "MouseOverHints"
   ClientHeight    =   5550
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6870
   LinkTopic       =   "Form1"
   ScaleHeight     =   5550
   ScaleWidth      =   6870
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   615
      Left            =   0
      OleObjectBlob   =   "MouseOverHint.frx":0000
      TabIndex        =   1
      Top             =   0
      Width           =   6855
   End
   Begin TeeChart.TChart TChart1 
      Height          =   4335
      Left            =   0
      TabIndex        =   0
      Top             =   630
      Width           =   6855
      Base64          =   $"MouseOverHint.frx":004C
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   420
      Left            =   2340
      TabIndex        =   2
      Top             =   5040
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim lastIndex, idx
Dim aX
Dim aY

Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  lastIndex = -1
  With TChart1
    .Tools.Items(0).Active = False
    .Series(0).FillSampleValues 5
    With .Tools.Items(0)
      .asAnnotation.Shape.CustomPosition = True
      '.asAnnotation.Width = 20
      '.asAnnotation.Height = 20
      .asAnnotation.AutoSize = True
      .asAnnotation.Shape.Transparency = 30
    End With
  End With
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  TChart1.Repaint
  TChart1.Cursor = 21
  With TChart1
    Index = .Series(0).Clicked(X, Y)
    With .Tools.Items(0)
        If Index <> -1 Then
            If lastIndex <> Index Then
              .Active = True
              .asAnnotation.Left = X
              .asAnnotation.Top = Y
            End If
            .asAnnotation.Text = "Value:" & TChart1.Series(0).CalcYPos(Index)
        Else
          .Active = False
        End If
    lastIndex = Index
    End With
  End With
End Sub
