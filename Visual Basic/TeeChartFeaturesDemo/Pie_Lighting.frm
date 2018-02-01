VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Pie_Lighting 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Pie_Lighting.frx":0000
      Left            =   5400
      List            =   "Pie_Lighting.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   1290
      Width           =   2475
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   300
      Left            =   3765
      Max             =   0
      Min             =   100
      TabIndex        =   6
      Top             =   1305
      Value           =   3
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   3300
      TabIndex        =   5
      Text            =   "3"
      Top             =   1290
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   1725
      Max             =   0
      Min             =   100
      TabIndex        =   3
      Top             =   1305
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1260
      TabIndex        =   2
      Text            =   "0"
      Top             =   1290
      Width           =   435
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Pie_Lighting.frx":0025
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Pie_Lighting.frx":1563
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      Caption         =   "&EdgeStyle:"
      Height          =   225
      Left            =   4380
      TabIndex        =   8
      Top             =   1350
      Width           =   855
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&BevelPercent:"
      Height          =   195
      Left            =   2190
      TabIndex        =   7
      Top             =   1365
      Width           =   1005
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Transparency:"
      Height          =   195
      Left            =   150
      TabIndex        =   4
      Top             =   1365
      Width           =   1020
   End
End
Attribute VB_Name = "Pie_Lighting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
  Case 0: TChart1.Series(0).asPie.EdgeStyle = edNone
  Case 1: TChart1.Series(0).asPie.EdgeStyle = edFlat
  Case 2: TChart1.Series(0).asPie.EdgeStyle = edCurved
  End Select
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Aspect.GDIPlus.Active = True
  TChart1.Series(0).Marks.Font.Color = vbBlack
  With TChart1.Series(0).asPie
    TChart1.Series(0).FillSampleValues 4
    .BevelPercent = 3
    .EdgeStyle = edFlat
    .PiePen.Visible = Falseç
    .Shadow.Visible = False

    Select Case .EdgeStyle
      Case edFlat: Combo1.ListIndex = 1
      Case edCurved: Combo1.ListIndex = 2
      Case edNone: Combo1.ListIndex = 0
    End Select
  End With
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.Series(0).FillSampleValues
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text3_Change()
  TChart1.Series(0).asPie.BevelPercent = VScroll2.Value
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = LTrim$(Str$(VScroll2.Value))
End Sub

Private Sub Text2_Change()
  TChart1.Series(0).asPie.Transparency = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub


