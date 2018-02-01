VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ShapeVertAlignForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3030
   ClientTop       =   2550
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"ShapeVertAlignForm.frx":0000
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Bottom"
      Height          =   195
      Index           =   2
      Left            =   4080
      TabIndex        =   4
      Top             =   1320
      Width           =   1155
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Centre"
      Height          =   195
      Index           =   1
      Left            =   2820
      TabIndex        =   3
      Top             =   1320
      Width           =   1155
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Top"
      Height          =   195
      Index           =   0
      Left            =   1560
      TabIndex        =   2
      Top             =   1320
      Width           =   1155
   End
   Begin VB.Label Label2 
      Caption         =   "Vertical align:"
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   1155
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1215
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ShapeVertAlignForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim shapeText As Variant

Private Sub Form_Load()
  Label1.Caption = "Shape text can now be top, center or bottom aligned." _
  & Chr(13) _
  & "Example: TChart1.Series(0).asShape.VertAlign= vaBottom"
  shapeText = Array("Text at Top", "Text at Centre", "Text at Bottom")
End Sub

Private Sub Option1_Click(Index As Integer)
  Select Case Index
    Case 0: setText (0)
    Case 1: setText (1)
    Case 2: setText (2)
  End Select
End Sub

Private Sub setText(Pos As Integer)
Dim i
  With TChart1
    For i = 0 To .SeriesCount - 1
      .Series(i).asShape.VertAlign = Pos
      .Series(i).asShape.Text.Item(0) = shapeText(Pos)
    Next i
  End With
End Sub
