VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksEveryForm 
   BackColor       =   &H8000000A&
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2775
   ClientTop       =   2835
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
      Base64          =   $"MarksEveryForm.frx":0000
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "MarksEveryForm.frx":0432
      Top             =   0
      Width           =   11490
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   5
      Left            =   1890
      Max             =   1
      Min             =   100
      SmallChange     =   2
      TabIndex        =   2
      Top             =   1140
      Value           =   5
      Width           =   225
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1320
      TabIndex        =   1
      Top             =   1140
      Width           =   555
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Marks every:"
      Height          =   195
      Left            =   330
      TabIndex        =   3
      Top             =   1170
      Width           =   915
   End
End
Attribute VB_Name = "MarksEveryForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  With TChart1
    .AddSeries scLine
    .Series(0).FillSampleValues 80
    .Series(0).Marks.Visible = True
    .Aspect.Chart3DPercent = 50
  End With
  VScroll1_Scroll
End Sub

Private Sub Text1_Change()
  Text1_Confirm
End Sub

Private Sub Text1_Confirm()
  If Not IsNumeric(Text1.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Text1"
  Else
    TChart1.Series(0).Marks.DrawEvery = val(Text1.Text)
    VScroll1.Value = val(Text1.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text1.Text = Str$(VScroll1.Value)
  Text1_Confirm
End Sub
