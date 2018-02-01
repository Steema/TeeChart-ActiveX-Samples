VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Marks_TextAlign 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Marks_TextAlign.frx":0000
      Left            =   1380
      List            =   "Marks_TextAlign.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1050
      Width           =   1215
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"Marks_TextAlign.frx":0026
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Marks_TextAlign.frx":08A4
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Alignment :"
      Height          =   195
      Left            =   420
      TabIndex        =   2
      Top             =   1080
      Width           =   780
   End
End
Attribute VB_Name = "Marks_TextAlign"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  TChart1.Series(0).Marks.TextAlign = Combo1.ListIndex
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 2
End Sub

Private Sub TChart1_OnGetSeriesMark(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, MarkText As String)
  MarkText = "Point Info." & Chr$(13) & "x : " & Str$(TChart1.Series(0).XValues.Value(ValueIndex)) & Chr$(13) & "y : " & Str$(TChart1.Series(0).YValues.Value(ValueIndex))
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
