VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ScrollButtonForm 
   BorderStyle     =   0  'None
   Caption         =   "ScrollButtonForm"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   0
      Top             =   1350
      Width           =   11505
      Base64          =   $"ScrollButtonForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "ScrollButtonForm.frx":060E
      Left            =   1920
      List            =   "ScrollButtonForm.frx":0618
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   900
      Width           =   2415
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   792
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ScrollButtonForm.frx":0629
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "(Zoom is Left Mousebutton)"
      Height          =   255
      Left            =   4560
      TabIndex        =   4
      Top             =   960
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "Scroll Mousebutton:"
      Height          =   255
      Left            =   360
      TabIndex        =   3
      Top             =   960
      Width           =   1515
   End
End
Attribute VB_Name = "ScrollButtonForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  With TChart1
    If Combo1.ListIndex = 0 Then
        .Scroll.MouseButton = mbRight
        .Zoom.MouseButton = mbLeft
        Label1.Caption = "(Zoom is Left Mousebutton)"
    Else
        .Zoom.MouseButton = mbRight
        .Scroll.MouseButton = mbLeft
        Label1.Caption = "(Zoom is Right Mousebutton)"
    End If
  End With
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  With TChart1
    .Scroll.Enable = pmHorizontal
    .Series(0).FillSampleValues 60
    Combo1.ListIndex = 0
    Combo1_Change
  End With
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
