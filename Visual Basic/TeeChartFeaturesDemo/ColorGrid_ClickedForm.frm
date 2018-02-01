VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorGrid_ClickedForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2760
   ClientTop       =   3090
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"ColorGrid_ClickedForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorGrid_ClickedForm.frx":0298
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "The selected cell is:"
      Height          =   195
      Left            =   60
      TabIndex        =   3
      Top             =   1200
      Width           =   1410
   End
   Begin VB.Label LabelCell 
      AutoSize        =   -1  'True
      Caption         =   "..."
      Height          =   195
      Left            =   1620
      TabIndex        =   2
      Top             =   1200
      Width           =   135
   End
End
Attribute VB_Name = "ColorGrid_ClickedForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 100
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim tmp As Integer
 With TChart1
  tmp = .Series(0).clicked(X, Y)
  If tmp = -1 Then
     LabelCell.Caption = ""
  Else
     LabelCell.Caption = "x:" & (Round(.Series(0).XValues.Value(tmp))) & " " & _
                        "z:" & (Round(.Series(0).asColorGrid.ZValues.Value(tmp))) & _
                        " Value is: " & (.Series(0).YValues.Value(tmp))
  End If
 End With
End Sub
