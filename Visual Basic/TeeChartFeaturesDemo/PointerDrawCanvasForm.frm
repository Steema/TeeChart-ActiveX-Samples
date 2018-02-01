VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PointerDrawCanvasForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3030
   ClientTop       =   2370
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
      Base64          =   $"PointerDrawCanvasForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D"
      Height          =   195
      Left            =   3300
      TabIndex        =   4
      Top             =   1290
      Width           =   975
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   1800
      ScaleHeight     =   255
      ScaleWidth      =   495
      TabIndex        =   2
      Top             =   1230
      Width           =   495
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Pointer displayed here:"
      Height          =   195
      Left            =   60
      TabIndex        =   3
      Top             =   1260
      Width           =   1605
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PointerDrawCanvasForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim Iconset As Boolean

Private Sub Check1_Click()
  TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Form_Load()
  Label1.Caption = "Series Pointer objects can now draw into custom Canvas. " _
  & "Eg. They are now displayed in TeeChart's editor comboboxes and in this example they are painted to a Picturebox." & Chr(13) _
  & Chr(13) _
  & "See the example code. Move the mouse over a point..."
  TChart1.Series(0).asPoint.Pointer.Style = CInt(Rnd * 8)
  TChart1.Series(0).FillSampleValues 10
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim tmp
  With TChart1.Series(0)
    tmp = .clicked(X, Y)
    If tmp <> -1 Then
      .asPoint.Pointer.DrawPointer Picture1.hdc, _
      False, 5, 5, 5, 5, .PointColor(tmp), .asPoint.Pointer.Style
      Iconset = True
    ElseIf Iconset = True Then
      Picture1.Refresh
      Iconset = False
    End If
  End With
End Sub
