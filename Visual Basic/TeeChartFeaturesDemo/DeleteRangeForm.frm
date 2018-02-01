VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DeleteRangeForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5145
      Left            =   0
      TabIndex        =   0
      Top             =   1770
      Width           =   11505
      Base64          =   $"DeleteRangeForm.frx":0000
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "DeleteRangeForm.frx":0616
      TabIndex        =   3
      Top             =   900
      Width           =   7050
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animate"
      Height          =   192
      Left            =   480
      TabIndex        =   2
      Top             =   1470
      Value           =   1  'Checked
      Width           =   972
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   4080
      Top             =   1410
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "DeleteRangeForm.frx":0662
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "DeleteRangeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim totalCtr As Double

Private Sub Check1_Click()
  Timer1.Enabled = Check1.Value
End Sub

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  With TChart1
    .Series(0).asFastLine.AddRealTime 0, Sin(0)
    For i = 0 To 49
      .Series(0).asFastLine.AddRealTime .Series(0).XValues.Last + 1, Sin((.Series(0).XValues.Last + 1) / 2)
    Next i
    totalCtr = .Series(0).Count
  End With
End Sub

Private Sub TChart1_OnAfterDraw()
  TChart1.Canvas.TextOut 10, 10, "Point count: " & TChart1.Series(0).Count & ", Total points processed: " & totalCtr
End Sub

Private Sub Timer1_Timer()
  If Check1.Value = 1 Then
  With TChart1
    .Series(0).asFastLine.AddRealTime .Series(0).XValues.Last + 1, Sin((.Series(0).XValues.Last + 1) / 2)
    totalCtr = totalCtr + 1
    If .Series(0).Count > 100 And .Axis.Bottom.Minimum > .Series(0).XValues.Minimum + 199 Then
      .Series(0).DeleteRange 0, 100
    End If
  End With
  End If
End Sub
