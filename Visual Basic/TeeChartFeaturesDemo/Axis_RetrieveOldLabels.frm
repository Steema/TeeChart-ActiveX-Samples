VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_RetrieveOldLabels 
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
   Begin VB.CommandButton Command2 
      Caption         =   "&Retrive old axis labels"
      Height          =   375
      Left            =   2475
      TabIndex        =   3
      Top             =   1260
      Width           =   2310
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Set custom axis labels"
      Height          =   375
      Left            =   90
      TabIndex        =   2
      Top             =   1260
      Width           =   2310
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Axis_RetrieveOldLabels.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Axis_RetrieveOldLabels.frx":1290
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Axis_RetrieveOldLabels"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OldLabels1() As String
Dim OldLabels2() As String
  
Private Sub Command1_Click()
Dim t As Integer

  With TChart1.Axis.Bottom
    For t = 0 To .Labels.Count - 1
      .Labels.Clear  ' remove all custom labels

      ' add html custom labels
      i = .Labels.Add(0, "<FONT color=Blue size=15>000")
      .Labels.Item(i).Format.TextFormat = ttfHtml

      ' add custom labels
      .Labels.Add 1, "1st"
      .Labels.Add 2, "2nd"
    Next t
  End With
End Sub

Private Sub Command2_Click()
    TChart1.Axis.Bottom.Labels.Clear
    For i = 0 To UBound(OldLabels1) - 1
       TChart1.Axis.Bottom.Labels.Add OldLabels1(i), OldLabels2(i)
    Next i
End Sub

Private Sub Form_Load()
  ReDim OldLabels1(8)
  ReDim OldLabels2(8)

  TChart1.Environment.InternalRepaint
  With TChart1.Axis.Bottom
    ' Save old labels
    For t = 0 To .Labels.Count - 1
      OldLabels1(t) = .Labels.Item(t).Value
      OldLabels2(t) = .Labels.Item(t).Text
    Next t
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
