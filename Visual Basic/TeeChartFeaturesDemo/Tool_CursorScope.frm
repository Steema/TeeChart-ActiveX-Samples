VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_CursorScope 
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
   Begin VB.VScrollBar VScroll1 
      Height          =   255
      Left            =   5520
      Max             =   0
      Min             =   10000
      TabIndex        =   9
      Top             =   1245
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5130
      TabIndex        =   8
      Text            =   "10"
      Top             =   1245
      Width           =   450
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Tool_CursorScope.frx":0000
      Left            =   3075
      List            =   "Tool_CursorScope.frx":0013
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   1245
      Width           =   1095
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_CursorScope.frx":0042
      Left            =   960
      List            =   "Tool_CursorScope.frx":0052
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1245
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cursor Pen"
      Height          =   345
      Left            =   5880
      TabIndex        =   5
      Top             =   1200
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool_CursorScope.frx":0079
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_CursorScope.frx":08A1
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Scope size:"
      Height          =   195
      Left            =   4270
      TabIndex        =   4
      Top             =   1290
      Width           =   825
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Scope style:"
      Height          =   195
      Left            =   2160
      TabIndex        =   3
      Top             =   1290
      Width           =   870
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Cursor style:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1290
      Width           =   855
   End
End
Attribute VB_Name = "Tool_CursorScope"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
Dim scopestyle As Boolean
  
  scopestyle = (Combo1.ListIndex = 3)
  
  Label2.Enabled = scopestyle
  Label3.Enabled = scopestyle
  Combo2.Enabled = scopestyle
  Text2.Enabled = scopestyle
  VScroll1.Enabled = scopestyle

  With TChart1.Tools.Items(0).asTeeCursor
    Select Case Combo1.ListIndex
      Case 0: .Style = cssHorizontal
      Case 1: .Style = cssVertical
      Case 2: .Style = cssBoth
      Case 3: .Style = cssScope
    End Select
  End With
End Sub

Private Sub Combo2_Change()
  Combo2_Click
End Sub

Private Sub Combo2_Click()
  With TChart1.Tools.Items(0).asTeeCursor
    Select Case Combo2.ListIndex
      Case 0: .scopestyle = scsRectangle
      Case 1: .scopestyle = scsCircle
      Case 2: .scopestyle = scsDiamond
      Case 3: .scopestyle = scsEmpty
      Case 4: .scopestyle = scsCamera
    End Select
  End With
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).asTeeCursor.Pen.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcCursor
  
  With TChart1.Tools.Items(0).asTeeCursor
    .Series = TChart1.Series(0)
    .Style = cssScope
    .scopestyle = scsRectangle
    .ScopeSize = 10
    .Pen.Width = 3
  End With
  
  Combo1.ListIndex = 3
  Combo2.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Scope Size"
  Else
    TChart1.Tools.Items(0).asTeeCursor.ScopeSize = val(Text2.Text)
    VScroll1.Value = val(Text2.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
