VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Axis_FirstLastLabelsForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"Axis_FirstLastLabelsForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "First and last bottom axis labels aligned"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   1275
      Value           =   1  'Checked
      Width           =   3615
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Axis_FirstLastLabelsForm.frx":0E86
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Axis_FirstLastLabelsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
TChart1.Repaint
End Sub

Private Sub Form_Load()
With TChart1.Series(0)
    .Clear
    .Add 123, "First", clTeeColor
    .Add 456, "Second", clTeeColor
    .Add 321, "Third", clTeeColor
    .Add 234, "Last", clTeeColor
End With
End Sub


Private Sub TChart1_OnDrawAxisLabel(ByVal Axis As Long, ByVal X As Long, ByVal Y As Long, LabelText As String)
With TChart1
If Check1.Value Then
  If Axis = 3 Then
    If X = TChart1.Axis.Bottom.CalcXPosValue(TChart1.Axis.Bottom.Minimum) Then  '  first label
       .Canvas.Font.Bold = True
       .Canvas.TextAlign = ctaLeft
    Else
      If X = TChart1.Axis.Bottom.CalcXPosValue(TChart1.Axis.Bottom.Maximum) Then ' last label
       .Canvas.Font.Bold = True
       .Canvas.TextAlign = ctaRight
      Else
       .Canvas.Font.Bold = False
      End If
    End If
  End If
End If
End With
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub

