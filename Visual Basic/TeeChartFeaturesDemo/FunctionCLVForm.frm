VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FunctionCLVForm 
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
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"FunctionCLVForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Multiply by Volume"
      Height          =   195
      Left            =   2040
      TabIndex        =   3
      Top             =   1170
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Accumulate"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1170
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "FunctionCLVForm.frx":0828
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FunctionCLVForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(2).FunctionType.asCLV.Accumulate = Check1.Value
End Sub

Private Sub Check2_Click()
  If Check2.Value = 1 Then
     TChart1.Series(2).FunctionType.asCLV.Volume = TChart1.Series(1)
  Else
     TChart1.Series(2).FunctionType.asCLV.Volume = Null
  End If
End Sub

Private Sub Form_Load()
  ' Prepare CLV function:
  TChart1.Series(2).FunctionType.asCLV.Accumulate = True
  TChart1.Series(2).FunctionType.asCLV.Volume = TChart1.Series(1)

  ' Other properties set at design-time:
  'TChart1.Series(2).SetFunction (tfCLV)
  'TChart1.Series(2).DataSource = TChart1.Series(0)

  ' Sample random Candle and Volume values...
  TChart1.Series(0).FillSampleValues 20
  TChart1.Series(1).FillSampleValues 20

  TChart1.Series(2).FunctionType.BeginUpdate
  TChart1.Series(2).FunctionType.EndUpdate
End Sub
