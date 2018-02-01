VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_AreaStackGroups 
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
      Height          =   285
      Left            =   5160
      Max             =   0
      Min             =   100
      TabIndex        =   7
      Top             =   1080
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4710
      TabIndex        =   6
      Text            =   "0"
      Top             =   1080
      Width           =   435
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   2280
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1080
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stacked"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1140
      Value           =   1  'Checked
      Width           =   1005
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   1
      Top             =   1530
      Width           =   11505
      Base64          =   $"Series_AreaStackGroups.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   945
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_AreaStackGroups.frx":0BD0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Group:"
      Height          =   195
      Left            =   4170
      TabIndex        =   5
      Top             =   1140
      Width           =   480
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Series:"
      Height          =   195
      Left            =   1710
      TabIndex        =   3
      Top             =   1140
      Width           =   480
   End
End
Attribute VB_Name = "Series_AreaStackGroups"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  For i = 0 To TChart1.SeriesCount - 1
    If Check1.Value = Checked Then
      TChart1.Series(i).asArea.MultiArea = maStacked
    Else
      TChart1.Series(i).asArea.MultiArea = maNone
    End If
  Next i
  
  Combo1.Enabled = Check1.Value
  Text2.Enabled = Check1.Value
  VScroll1.Enabled = Check1.Value
End Sub

Private Sub Combo1_Change()
  Text2.Text = Str$(TChart1.Series(Combo1.ListIndex).asArea.StackGroup)
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  TChart1.Series(0).asArea.StackGroup = 0
  TChart1.Series(2).asArea.StackGroup = 0
  TChart1.Series(1).asArea.StackGroup = 1
  TChart1.Series(3).asArea.StackGroup = 1

  For i = 0 To TChart1.SeriesCount - 1
    Combo1.AddItem TChart1.Series(i).Name
    
    TChart1.Series(i).asArea.MultiArea = maStacked
    TChart1.Series(i).asArea.Transparency = 30
  Next i
  
  Combo1.ListIndex = 0
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
    MsgBox "Please insert a numeric value", , "Group"
  Else
    If (val(Text2.Text) > 100 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 100", , "Group"
    Else
      TChart1.Series(Combo1.ListIndex).asArea.StackGroup = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub

