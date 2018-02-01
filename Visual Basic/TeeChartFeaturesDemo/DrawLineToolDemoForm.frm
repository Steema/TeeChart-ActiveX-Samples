VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form DrawLineToolDemoForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2940
   ClientTop       =   3135
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5055
      Left            =   0
      TabIndex        =   0
      Top             =   1860
      Width           =   11505
      Base64          =   $"DrawLineToolDemoForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   337
      Object.Left            =   0
      Object.Top             =   124
      Object.Visible         =   -1  'True
      Object.Width           =   767
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   0
      Languaged       =   0
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "DrawLineToolDemoForm.frx":0D56
      Left            =   5580
      List            =   "DrawLineToolDemoForm.frx":0D63
      TabIndex        =   9
      Text            =   "Left"
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Delete"
      Height          =   345
      Left            =   2640
      TabIndex        =   7
      Top             =   1380
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Pen"
      Height          =   345
      Left            =   2640
      TabIndex        =   6
      Top             =   990
      Width           =   1215
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Enable selection"
      Height          =   195
      Left            =   60
      TabIndex        =   4
      Top             =   1530
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Enable draw"
      Height          =   195
      Left            =   60
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Active"
      Height          =   195
      Left            =   60
      TabIndex        =   2
      Top             =   990
      Value           =   1  'Checked
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "DrawLineToolDemoForm.frx":0D7C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Mousebutton:"
      Height          =   195
      Left            =   4560
      TabIndex        =   8
      Top             =   1020
      Width           =   975
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Lines:"
      Height          =   195
      Left            =   1680
      TabIndex        =   5
      Top             =   1020
      Width           =   420
   End
End
Attribute VB_Name = "DrawLineToolDemoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).Active = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asDrawLine.EnableDraw = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(0).asDrawLine.EnableSelect = Check3.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  TChart1.Tools.Items(0).asDrawLine.Button = Combo1.ItemData(Combo1.ListIndex)
End Sub

Private Sub Command1_Click()
Dim tmpIndex
 If TChart1.Tools.Count > 0 Then
  With TChart1.Tools.Items(0).asDrawLine
    If .Lines.Count > 0 Then
      tmpIndex = .Selected
      If tmpIndex = -1 Then
        tmpIndex = 0
      End If
      With .Lines.Items(tmpIndex).Pen
        PenColor = .Color
        PenStyle = .Style
        PenVisible = .Visible
        PenWidth = .Width
        PenForm.Show vbModal
        If PenCancel = False Then
          .Color = PenColor
          .Style = PenStyle
          .Visible = PenVisible
          .Width = PenWidth
        End If
      End With
    End If
  End With
 End If
End Sub

Private Sub Command2_Click()
   If TChart1.Tools.Count > 0 Then
    With TChart1.Tools.Items(0).asDrawLine
      .DeleteSelected
      If .Lines.Count > 0 Then
        .Selected = .Lines.Count - 1
      End If
    End With
   End If
End Sub

Private Sub Command3_KeyDown(KeyCode As Integer, Shift As Integer)
  'Uses 'del' key to remove selected line
  If KeyCode = 46 Then
   Command2_Click
  End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues (100)
End Sub

Private Sub TChart1_OnAfterDraw()
  If TChart1.Tools.Count > 0 Then
    Label1.Caption = "Lines: " & TChart1.Tools.Items(0).asDrawLine.Lines.Count
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
