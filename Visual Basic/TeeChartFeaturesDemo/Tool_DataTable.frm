VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_DataTable 
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
   Begin VB.CommandButton Edit 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   6600
      TabIndex        =   7
      Top             =   960
      Width           =   705
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Axis Inverted"
      Height          =   195
      Left            =   5100
      TabIndex        =   6
      Top             =   1020
      Width           =   1305
   End
   Begin VB.CommandButton Axis 
      Caption         =   "Axis <--> Other Axis"
      Height          =   345
      Left            =   3270
      TabIndex        =   5
      Top             =   960
      Width           =   1665
   End
   Begin VB.CommandButton VertHoriz 
      Caption         =   "Vert <--> Horiz"
      Height          =   345
      Left            =   1650
      TabIndex        =   4
      Top             =   960
      Width           =   1545
   End
   Begin VB.CommandButton Fill2 
      Caption         =   "Fill 2"
      Height          =   345
      Left            =   840
      TabIndex        =   3
      Top             =   960
      Width           =   615
   End
   Begin VB.CommandButton Fill1 
      Caption         =   "Fill 1"
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   645
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5535
      Left            =   0
      TabIndex        =   1
      Top             =   1380
      Width           =   11505
      Base64          =   $"Tool_DataTable.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_DataTable.frx":09AE
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_DataTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Axis_Click()
Dim i As Integer
  For i = 0 To TChart1.SeriesCount - 1
    With TChart1.Series(i)
      If .SeriesType = scBar Then
        If .HorizontalAxis = aBottomAxis Then
          .HorizontalAxis = aTopAxis
        Else
          .HorizontalAxis = aBottomAxis
        End If
      Else
        If .VerticalAxis = aLeftAxis Then
          .VerticalAxis = aRightAxis
        Else
          .VerticalAxis = aLeftAxis
        End If
      End If
    End With
  Next i
End Sub

Private Sub Check1_Click()
  With TChart1.Series(0)
    If .SeriesType = scBar Then
      If .HorizontalAxis = aBottomAxis Then
        TChart1.Axis.Bottom.Inverted = Check1.Value
      Else
        TChart1.Axis.Top.Inverted = Check1.Value
      End If
    Else
      If .VerticalAxis = aLeftAxis Then
        TChart1.Axis.Left.Inverted = Check1.Value
      Else
        TChart1.Axis.Right.Inverted = Check1.Value
      End If
    End If
  End With
End Sub

Private Sub Edit_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Fill1_Click()
  TChart1.Series(0).FillSampleValues 1
End Sub

Private Sub Fill2_Click()
  TChart1.Series(0).FillSampleValues 2
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcDataTable
  
  TChart1.Series(0).ValueFormat = "#,###"
  TChart1.Series(1).ValueFormat = "#,###"
  TChart1.Series(2).ValueFormat = "#,###"

  TChart1.Axis.Bottom.MinorTicks.Visible = False

  TChart1.Series(1).SetNull 3
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub VertHoriz_Click()
Dim i As Integer
  If TChart1.Series(0).SeriesType = scBar Then
    For i = 0 To TChart1.SeriesCount - 1
      TChart1.ChangeSeriesType i, scHorizBar
    Next i
  Else
    For i = 0 To TChart1.SeriesCount - 1
      TChart1.ChangeSeriesType i, scBar
    Next i
  End If
End Sub
