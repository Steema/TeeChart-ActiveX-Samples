VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Tile 
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
   Begin VB.VScrollBar VScroll2 
      Height          =   315
      Left            =   4620
      Max             =   1
      Min             =   100
      TabIndex        =   7
      Top             =   990
      Value           =   3
      Width           =   255
   End
   Begin VB.TextBox tbRows 
      Height          =   315
      Left            =   4200
      TabIndex        =   6
      Text            =   "3"
      Top             =   990
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   3075
      Max             =   1
      Min             =   100
      TabIndex        =   4
      Top             =   1005
      Value           =   3
      Width           =   255
   End
   Begin VB.TextBox tbCols 
      Height          =   285
      Left            =   2655
      TabIndex        =   3
      Text            =   "3"
      Top             =   1005
      Width           =   390
   End
   Begin VB.CheckBox cbActive 
      Caption         =   "Active"
      Height          =   255
      Left            =   135
      TabIndex        =   2
      Top             =   1035
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   1
      Top             =   1470
      Width           =   11505
      Base64          =   $"Filter_Tile.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_Tile.frx":13B4
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Rows :"
      Height          =   195
      Left            =   3465
      TabIndex        =   8
      Top             =   1050
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Columns :"
      Height          =   195
      Left            =   1920
      TabIndex        =   5
      Top             =   1065
      Width           =   690
   End
End
Attribute VB_Name = "Filter_Tile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cbActive_Click()
  TChart1.Tools.Items(0).Active = cbActive.Value
End Sub

Private Sub Form_Load()
With TChart1
    .SetTheme ctWindowsXP, cpWindowsXP
    .Tools.Add tcAntiAlias
    With .Tools.Items(0).asAntiAlias.Filters
        .Add fcTile
        .Item(0).asTile.NumCols = tbCols.Text
        .Item(0).asTile.NumRows = tbRows.Text
    End With
End With
End Sub

Private Sub tbCols_Change()
  tbCols_Confirm
End Sub

Private Sub tbRows_Change()
  tbRows_Confirm
End Sub

Private Sub tbCols_Confirm()
  If Not IsNumeric(tbCols.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Columns"
  Else
    With TChart1.Tools.Items(0).asAntiAlias
      .Filters.Item(0).asTile.NumCols = VScroll1.Value
    End With
    VScroll1.Value = val(tbCols.Text)
  End If
End Sub

Private Sub tbRows_Confirm()
  If Not IsNumeric(tbRows.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Rows"
  Else
    With TChart1.Tools.Items(0).asAntiAlias
      .Filters.Item(0).asTile.NumRows = VScroll2.Value
    End With
    VScroll2.Value = val(tbRows.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll1_Scroll()
  tbCols.Text = Str$(VScroll1.Value)
  tbCols_Confirm
  TChart1.Repaint
End Sub

Private Sub VScroll2_Scroll()
  tbRows.Text = Str$(VScroll2.Value)
  tbRows_Confirm
  TChart1.Repaint
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
