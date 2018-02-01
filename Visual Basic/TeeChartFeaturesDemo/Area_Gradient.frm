VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Area_Gradient 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   5700
   ClientLeft      =   3840
   ClientTop       =   2085
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   5700
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4335
      Left            =   0
      TabIndex        =   1
      Top             =   1365
      Width           =   11505
      Base64          =   $"Area_Gradient.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Area_Gradient.frx":06C4
      Left            =   2160
      List            =   "Area_Gradient.frx":06DD
      TabIndex        =   2
      Text            =   "gdLeftRight"
      Top             =   990
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Area_Gradient.frx":0744
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Select Gradient Direction:"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1020
      Width           =   1815
   End
End
Attribute VB_Name = "Area_Gradient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
With TChart1
    .Series(0).asArea.Gradient.Direction = Combo1.ListIndex
End With
End Sub

Private Sub Combo1_Click()
Combo1_Change
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues 20
    .Series(0).asArea.Gradient.Direction = gdLeftRight
    .Series(0).asArea.Gradient.StartColor = vbRed
    .Series(0).asArea.Gradient.MidColor = vbWhite
    .Series(0).asArea.Gradient.EndColor = vbBlue
    .Series(0).asArea.Gradient.Visible = True
End With
End Sub
