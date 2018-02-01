VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Wall_AutoHideForm 
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
      Height          =   5250
      Left            =   0
      TabIndex        =   0
      Top             =   1665
      Width           =   11505
      Base64          =   $"Wall_AutoHideForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   285
      Left            =   3015
      Max             =   360
      SmallChange     =   5
      TabIndex        =   4
      Top             =   1245
      Width           =   3570
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Auto Hide Walls"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1725
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Wall_AutoHideForm.frx":0422
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Rotate :"
      Height          =   240
      Left            =   2250
      TabIndex        =   3
      Top             =   1290
      Width           =   645
   End
End
Attribute VB_Name = "Wall_AutoHideForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  With TChart1.Walls
    .Left.AutoHide = Check1.Value
    .Right.AutoHide = Check1.Value
    .Back.AutoHide = Check1.Value
  End With
End Sub

Private Sub Form_Load()
    With TChart1
        .Series(0).FillSampleValues (25)
        ' Set all walls "Size" property at once:
        .Walls.Size = 5
        
        ' Show Right wall
        .Walls.Right.Visible = True
        .Walls.Right.AutoHide = True

        .Walls.Left.AutoHide = True
        .Walls.Back.AutoHide = True
        .Walls.Back.Transparent = False
    End With
End Sub

Private Sub HScroll1_Change()
    TChart1.Aspect.Rotation = HScroll1.Value
    TChart1.Repaint
End Sub
