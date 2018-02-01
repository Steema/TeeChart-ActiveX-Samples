VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_DragPointForm 
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
      Height          =   5640
      Left            =   0
      TabIndex        =   5
      Top             =   1275
      Width           =   11505
      Base64          =   $"Tool_DragPointForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_DragPointForm.frx":02DE
      Left            =   2970
      List            =   "Tool_DragPointForm.frx":02EB
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   855
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Active"
      Height          =   195
      Left            =   1305
      TabIndex        =   2
      Top             =   900
      Value           =   1  'Checked
      Width           =   825
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   750
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool_DragPointForm.frx":0308
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   90
      TabIndex        =   0
      Top             =   840
      Width           =   1020
   End
   Begin VB.Label Label1 
      Caption         =   "Style :"
      Height          =   195
      Left            =   2430
      TabIndex        =   3
      Top             =   900
      Width           =   690
   End
End
Attribute VB_Name = "Tool_DragPointForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Tools.Items(0).Active = Check1.Value
    ' change the series cursor:
    If TChart1.Tools.Items(0).Active Then
        TChart1.Series(0).Cursor = 2020
    Else
        TChart1.Series(0).Cursor = 0
    End If
End Sub

Private Sub Combo1_Click()
  ' set the allowed dragging direction...
  With TChart1.Tools.Items(0).asDragPoint
    Select Case Combo1.ListIndex
      Case 0: .DragStyle = dsX
      Case 1: .DragStyle = dsY
      Case Else: .DragStyle = dsBoth
    End Select
  End With
End Sub

Private Sub Command1_Click()
    TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 10
    .Tools.Add tcDragPoint
    .Tools.Items(0).asDragPoint.Series = TChart1.Series(0)
    .Series(0).Cursor = 2020
  End With
  Combo1.ListIndex = 2
End Sub
