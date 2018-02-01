VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form CustomAxisEvent 
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
      Height          =   5985
      Left            =   0
      TabIndex        =   0
      Top             =   930
      Width           =   11505
      Base64          =   $"CustomAxisEvent.frx":0000
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackColor       =   &H80000001&
         ForeColor       =   &H8000000B&
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   120
         Width           =   45
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CustomAxisEvent.frx":13B8
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "CustomAxisEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim axisText As String
Dim axisIndex As Integer

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  With TChart1.Axis
  For i = 0 To .CustomCount - 1
    If .Custom(i).clicked(X, Y) = True Then
      Label1.Caption = "Last Custom Axis under Mouse: " & i
      'DoEvents
    End If
  Next i
  End With
End Sub
