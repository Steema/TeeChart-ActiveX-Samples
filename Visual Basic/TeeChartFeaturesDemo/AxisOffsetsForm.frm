VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisOffsetsForm 
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
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"AxisOffsetsForm.frx":0000
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   270
      Left            =   5490
      Max             =   0
      Min             =   32767
      TabIndex        =   6
      Top             =   1260
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4920
      TabIndex        =   5
      Top             =   1260
      Width           =   570
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   3510
      Max             =   0
      Min             =   32767
      TabIndex        =   4
      Top             =   1260
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2955
      TabIndex        =   3
      Top             =   1245
      Width           =   570
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "AxisOffsetsForm.frx":0764
      Left            =   600
      List            =   "AxisOffsetsForm.frx":076E
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1230
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisOffsetsForm.frx":0780
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Axis:"
      Height          =   195
      Left            =   150
      TabIndex        =   9
      Top             =   1290
      Width           =   330
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Max Offset:"
      Height          =   195
      Left            =   4080
      TabIndex        =   8
      Top             =   1305
      Width           =   810
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Min Offset:"
      Height          =   195
      Left            =   2160
      TabIndex        =   7
      Top             =   1290
      Width           =   765
   End
End
Attribute VB_Name = "AxisOffsetsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
    Text2.Text = Str(TChart1.Axis.Left.MinimumOffset)
    Text3.Text = Str(TChart1.Axis.Left.MaximumOffset)
  Else
    Text2.Text = Str(TChart1.Axis.Bottom.MinimumOffset)
    Text3.Text = Str(TChart1.Axis.Bottom.MaximumOffset)
  End If
  VScroll1.Value = val(Text2.Text)
  VScroll2.Value = val(Text3.Text)
End Sub

Private Sub Form_Load()
    Combo1.ListIndex = 0
    TChart1.Series(0).FillSampleValues (20)
End Sub

Private Sub Text2_Change()
  Text_Confirm Text2, VScroll1, True
End Sub

Private Sub Text3_Change()
  Text_Confirm Text3, VScroll2, False
End Sub

Private Sub Text_Confirm(t As Control, v As Control, ByVal Min As Boolean)
  If Not IsNumeric(t.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Offset"
  Else
    If Combo1.ListIndex = 0 Then
        If Min Then
            TChart1.Axis.Left.MinimumOffset = val(t.Text)
        Else
            TChart1.Axis.Left.MaximumOffset = val(t.Text)
        End If
    Else
        If Min Then
            TChart1.Axis.Bottom.MinimumOffset = val(t.Text)
        Else
            TChart1.Axis.Bottom.MaximumOffset = val(t.Text)
        End If
    End If
    v.Value = val(t.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text_Confirm Text2, VScroll1, True
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text_Confirm Text3, VScroll2, False
End Sub


