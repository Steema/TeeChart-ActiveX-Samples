VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolPieForm 
   BorderStyle     =   0  'None
   Caption         =   "Animate !"
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
      Height          =   5535
      Left            =   0
      TabIndex        =   0
      Top             =   1380
      Width           =   11505
      Base64          =   $"ToolPieForm.frx":0000
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   4935
      TabIndex        =   3
      Top             =   930
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Pen..."
      Height          =   345
      Left            =   2880
      TabIndex        =   2
      Top             =   930
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ToolPieForm.frx":0784
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Slice:"
      Height          =   195
      Left            =   345
      TabIndex        =   4
      Top             =   975
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   4350
      Top             =   915
      Width           =   375
   End
End
Attribute VB_Name = "ToolPieForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command2_Click()
  TChart1.Tools.Items(0).asPie.Pen.ShowEditor
End Sub

Private Sub Command3_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 8
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim tmp As Integer
  tmp = TChart1.Tools.Items(0).asPie.Slice

  If tmp = -1 Then
    Label1.Caption = "Slice:"
    Shape1.Visible = False
  Else
    Label1.Caption = "Slice: " + TChart1.Series(0).ValueMarkText(tmp)
    Shape1.Visible = True
    Shape1.FillColor = TChart1.Series(0).PointColor(tmp)
  End If
End Sub
