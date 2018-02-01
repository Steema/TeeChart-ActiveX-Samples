VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form NearestToolEvent 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3045
   ClientTop       =   3330
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
      Base64          =   $"NearestToolEvent.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5700
      TabIndex        =   2
      Top             =   1080
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "NearestToolEvent.frx":0768
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   960
      TabIndex        =   3
      Top             =   1110
      Width           =   4575
   End
End
Attribute VB_Name = "NearestToolEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OldNearest As Integer

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
TChart1.Series(0).FillSampleValues 6
End Sub

Private Sub TChart1_OnNearestToolChange()
Dim Nearest As Integer
With TChart1
    Nearest = .Tools.Items(0).asNearest.Point
    .Series(0).PointColor(Nearest) = vbCyan
    If OldNearest <> Nearest And OldNearest >= 0 Then
        .Series(0).PointColor(OldNearest) = .Series(0).Color
    End If
    Label1.Caption = "Selected Point: XValue = " & .Series(0).XValues.Value(Nearest) & "  YValue = " & .Series(0).YValues.Value(Nearest)
    OldNearest = Nearest
End With
End Sub
                                
