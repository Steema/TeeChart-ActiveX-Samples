VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BarStackGroupForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2490
   ClientTop       =   3945
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"BarStackGroupForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "BarStackGroupForm.frx":0E40
      Top             =   0
      Width           =   11460
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   375
      Left            =   2340
      Max             =   1
      TabIndex        =   1
      Top             =   1110
      Width           =   255
   End
   Begin VB.Label Label3 
      Caption         =   "..."
      Height          =   255
      Left            =   2700
      TabIndex        =   3
      Top             =   1170
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Number of Series in first group:"
      Height          =   255
      Left            =   60
      TabIndex        =   2
      Top             =   1170
      Width           =   2175
   End
End
Attribute VB_Name = "BarStackGroupForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
Dim i
  With TChart1
    For i = 0 To .SeriesCount - 1
      .Series(i).FillSampleValues 6
      .Series(i).asBar.MultiBar = mbStacked
      .Series(i).Marks.Visible = False
      If i < 3 Then
        .Series(i).asBar.StackGroup = 0
      Else
        .Series(i).asBar.StackGroup = 1
      End If
    Next i
    VScroll1.Min = .SeriesCount
  End With
  VScroll1.Value = 3
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
Dim i
  Label3.Caption = VScroll1.Value
  With TChart1
    For i = 0 To VScroll1.Value - 1
      .Series(i).asBar.StackGroup = 0
    Next i
    For i = VScroll1.Value To .SeriesCount - 1
      .Series(i).asBar.StackGroup = 1
    Next i
  End With
End Sub
