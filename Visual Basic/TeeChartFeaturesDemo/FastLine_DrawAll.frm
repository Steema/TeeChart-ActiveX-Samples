VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FastLine_DrawAll 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   4095
   ClientTop       =   1980
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   1
      Top             =   1410
      Width           =   11505
      Base64          =   $"FastLine_DrawAll.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Load data to Chart"
      Enabled         =   0   'False
      Height          =   315
      Left            =   60
      TabIndex        =   4
      Top             =   1020
      Width           =   1695
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Non-repeated X only"
      Height          =   315
      Index           =   1
      Left            =   4260
      TabIndex        =   3
      Top             =   1020
      Value           =   -1  'True
      Width           =   2115
   End
   Begin VB.OptionButton Option1 
      Caption         =   "All points (1 million)"
      Height          =   315
      Index           =   0
      Left            =   2280
      TabIndex        =   2
      Top             =   1020
      Width           =   1635
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "FastLine_DrawAll.frx":060E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FastLine_DrawAll"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MyYArray() As Double
Dim MyXArray() As Double
Dim NumPoints As Double


Private Sub Command1_Click()
  TChart1.Series(0).AddArray NumPoints, MyYArray, MyXArray
  Command1.Enabled = False
End Sub

Private Sub Form_Load()
Dim t As Double

  TChart1.Series(0).Clear
  
  NumPoints = 1000000
 
  ReDim MyYArray(NumPoints)
  ReDim MyXArray(NumPoints)
  
  tmp = Rnd * 10000
  For t = 0 To NumPoints - 1
    tmp = tmp + (Rnd * 100) - 50
    MyXArray(t) = t
    MyYArray(t) = tmp
  Next t
  Command1.Enabled = True
  TChart1.Series(0).asFastLine.DrawAllPoints = False
End Sub

Private Sub Option1_Click(Index As Integer)
 If Index = 0 Then
   TChart1.Series(0).asFastLine.DrawAllPoints = True
   TChart1.Repaint
 Else
   TChart1.Series(0).asFastLine.DrawAllPoints = False
   TChart1.Repaint
 End If
End Sub
