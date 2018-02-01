VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Magnify 
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
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   5160
      Max             =   100
      TabIndex        =   6
      Top             =   780
      Width           =   1695
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   5160
      Max             =   100
      TabIndex        =   5
      Top             =   510
      Value           =   50
      Width           =   1695
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Circled"
      Height          =   255
      Left            =   2760
      TabIndex        =   4
      Top             =   690
      Width           =   975
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Smooth"
      Height          =   255
      Left            =   1560
      TabIndex        =   3
      Top             =   690
      Width           =   855
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Follow Mouse"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   690
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5775
      Left            =   0
      TabIndex        =   1
      Top             =   1140
      Width           =   11505
      Base64          =   $"Tool_Magnify.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_Magnify.frx":0DF2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:"
      Height          =   195
      Left            =   4080
      TabIndex        =   8
      Top             =   810
      Width           =   1020
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Percent:"
      Height          =   195
      Left            =   4485
      TabIndex        =   7
      Top             =   540
      Width           =   600
   End
End
Attribute VB_Name = "Tool_Magnify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asMagnify.FollowMouse = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asMagnify.Smooth = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(0).asMagnify.Circled = Check3.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Tools.Add tcMagnify
    With .Tools.Items(0).asMagnify
        .Left = 355
        .Top = 35
        .Height = 150
        .Width = 150
    End With
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asMagnify.Percent = HScroll1.Value
End Sub

Private Sub HScroll2_Change()
  TChart1.Tools.Items(0).asMagnify.Shape.Transparency = HScroll2.Value
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
