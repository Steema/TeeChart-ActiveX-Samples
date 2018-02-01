VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FastLine_DrawAllStyle 
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
      ItemData        =   "FastLine_DrawAllStyle.frx":0000
      Left            =   2790
      List            =   "FastLine_DrawAllStyle.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1665
      Width           =   1905
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Draw All Points"
      Height          =   240
      Left            =   225
      TabIndex        =   2
      Top             =   1710
      Width           =   1545
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4845
      Left            =   0
      TabIndex        =   0
      Top             =   2070
      Width           =   11505
      Base64          =   $"FastLine_DrawAllStyle.frx":0024
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1605
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "FastLine_DrawAllStyle.frx":14BE
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label1 
      Caption         =   "Style:"
      Height          =   195
      Left            =   2115
      TabIndex        =   3
      Top             =   1710
      Width           =   690
   End
End
Attribute VB_Name = "FastLine_DrawAllStyle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MyX() As Double
Dim MyY() As Double

Private Sub Check1_Click()
  TChart1.Series(0).asFastLine.DrawAllPoints = Check1.Value
  Label1.Enabled = Not Check1.Value
  Combo1.Enabled = Not Check1.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
  Case 0:          TChart1.Series(0).asFastLine.DrawAllPointsStyle = daFirst
  Case 1:          TChart1.Series(0).asFastLine.DrawAllPointsStyle = daMinMax
  End Select
End Sub

Private Sub Form_Load()
  With TChart1
   
    Dim NumPoints As Long
    NumPoints = 1000000  ' one million !
    Dim t As Long
    Dim tmp As Double

    Combo1.ListIndex = 0

    ' Set axis calculations in "fast mode".
    ' Note: For Windows Me and 98 might produce bad drawings when
    '       chart zoom is very big.
    TChart1.Axis.FastCalc = True

    ' tell Series1 to draw non-repeated points only ( much faster ! )
    TChart1.Series(0).asFastLine.DrawAllPoints = False

    ' lets add one million points to Series1...
    ReDim MyX(NumPoints)
    ReDim MyY(NumPoints)

    tmp = Rnd * 10000
    For t = 0 To NumPoints - 1
      tmp = tmp + Rnd * 100 - 49.5
      MyX(t) = t
      MyY(t) = tmp
     Next

    With .Series(0)
      .AddArray NumPoints, MyY, MyX
    End With
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
