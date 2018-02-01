VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series3DAddArrayForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"Series3DAddArrayForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1455
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Series3DAddArrayForm.frx":03F0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series3DAddArrayForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim XZArray() As Double
Dim X As Integer, z As Integer

  ' initialize dynamic array grid
  ReDim XZArray(35)

  ' fill with random values
  For X = 0 To 4
      For z = 0 To 6
          XZArray(X * 7 + z) = Rnd
      Next z
  Next X
  ' add to 3D series:
  TChart1.Series(0).asColorGrid.AddArrayGrid 5, 7, XZArray
End Sub
