VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_Histogram 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   5430
      Max             =   0
      Min             =   1200
      TabIndex        =   6
      Top             =   1170
      Value           =   20
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4890
      TabIndex        =   4
      Text            =   "20"
      Top             =   1170
      Width           =   525
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Cumulative"
      Height          =   195
      Left            =   2490
      TabIndex        =   3
      Top             =   1230
      Width           =   1155
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show source Series0"
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   1230
      Width           =   1875
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11460
      Base64          =   $"Function_Histogram.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Function_Histogram.frx":46C0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Num. Bins:"
      Height          =   195
      Left            =   4050
      TabIndex        =   5
      Top             =   1230
      Width           =   765
   End
End
Attribute VB_Name = "Function_Histogram"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).Active = Check1.Value
  TChart1.Series(1).Active = Not TChart1.Series(0).Active
End Sub

Private Sub Check2_Click()
  TChart1.Series(1).FunctionType.asHistogram.Cumulative = Check2.Value
End Sub

Private Sub Form_Load()
  TChart1.Tools.Items(0).asSeriesBand.Series = TChart1.Series(1)
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Num. Bins"
  Else
    If (val(Text2.Text) > VScroll1.Min Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(VScroll1.Min), , "Num. Bins"
    Else
      VScroll1.Value = val(Text2.Text)
      TChart1.Series(1).FunctionType.asHistogram.NumBins = VScroll1.Value
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
