VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FunctionSmoothingForm 
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
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"FunctionSmoothingForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Random !"
      Height          =   345
      Left            =   5880
      TabIndex        =   8
      Top             =   1185
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4815
      TabIndex        =   6
      Text            =   "4"
      Top             =   1215
      Width           =   570
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   5370
      Max             =   1
      Min             =   100
      TabIndex        =   5
      Top             =   1215
      Value           =   4
      Width           =   255
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Interpolate"
      Height          =   195
      Left            =   3000
      TabIndex        =   4
      Top             =   1260
      Width           =   1215
   End
   Begin VB.CheckBox Check2 
      Caption         =   "View source"
      Height          =   195
      Left            =   1560
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View points"
      Height          =   195
      Left            =   240
      TabIndex        =   0
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "FunctionSmoothingForm.frx":0B82
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Factor:"
      Height          =   195
      Left            =   4290
      TabIndex        =   7
      Top             =   1260
      Width           =   495
   End
End
Attribute VB_Name = "FunctionSmoothingForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Series(0).FillSampleValues 25
End Sub

Private Sub Check1_Click()
  TChart1.Series(0).asLine.Pointer.Visible = Check1.Value = 1
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).Active = Check2.Value = 1
End Sub

Private Sub Check3_Click()
  TChart1.Series(1).FunctionType.asSmoothing.Interpolate = Check3.Value = 1
End Sub

Private Sub Text2_Change()
  If val(Text2.Text) < 1 Or val(Text2.Text) > 100 Then
    KeepFocus = True
    MsgBox "Please enter factor number [1..100]", , "Factor"
  Else
    VScroll1.Value = val(Text2.Text)
    TChart1.Series(1).FunctionType.asSmoothing.Factor = VScroll1.Value
  End If
End Sub


Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub


