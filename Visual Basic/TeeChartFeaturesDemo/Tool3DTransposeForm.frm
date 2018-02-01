VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool3DTransposeForm 
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
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool3DTransposeForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Transpose!"
      Height          =   345
      Left            =   840
      TabIndex        =   2
      Top             =   1245
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool3DTransposeForm.frx":0546
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool3DTransposeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).asGridTranspose.Transpose
End Sub

Private Sub Form_Load()
Dim i As Integer
  TChart1.Tools.Add tcGridTranspose
  TChart1.Tools.Items(0).asGridTranspose.Series = TChart1.Series(0)
  TChart1.Tools.Items(0).Active = True
  ' Fill Series with sample values
  For z = 1 To 30
    For X = 1 To 20
      TChart1.Series(0).asSurface.AddXYZ X, GetXZValue(X, z), z, "", clTeeColor
    Next X
  Next z
End Sub

Private Function GetXZValue(ByVal X As Double, ByVal z As Double) As Double
  GetXZValue = 0.5 * (Cos(X / (20 * 0.2))) ^ 2 + _
                     (Cos(z / (30 * 0.2))) ^ 2 - _
                     (Cos(z / (30 * 0.5)))
End Function
