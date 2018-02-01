VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorBand_ClickedForm 
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
      Height          =   5640
      Left            =   0
      TabIndex        =   2
      Top             =   1275
      Width           =   11505
      Base64          =   $"ColorBand_ClickedForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ColorBand_ClickedForm.frx":00FA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Clicked at :"
      Height          =   195
      Left            =   165
      TabIndex        =   1
      Top             =   1005
      Width           =   795
   End
End
Attribute VB_Name = "ColorBand_ClickedForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
    .AddSeries scLine
    .Series(0).FillSampleValues (5)
    .Axis.Left.SetMinMax 0, 100
    .Tools.Add tcColorband
    .Tools.Items(0).asColorband.Axis = .Axis.Left
    .Tools.Items(0).asColorband.StartValue = 25
    .Tools.Items(0).asColorband.EndValue = 75
    .Series(0).Active = False
End With
End Sub

Private Sub TChart1_OnColorBandToolClick(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Label1.Caption = "Clicked at  X: " & X & " Y: " & Y
  TChart1.Tools.Items(0).asColorband.Color = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  If TChart1.Tools.Items(0).asColorband.clicked(X, Y) Then
     TChart1.Cursor = -21
  Else
     TChart1.Cursor = 21
  End If
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub
