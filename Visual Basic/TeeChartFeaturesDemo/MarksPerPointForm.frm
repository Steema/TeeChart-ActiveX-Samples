VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksPerPointForm 
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
      Base64          =   $"MarksPerPointForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Reset..."
      Height          =   345
      Left            =   3360
      TabIndex        =   5
      Top             =   1230
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   2040
      TabIndex        =   4
      Top             =   1230
      Width           =   1095
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   1590
      Max             =   0
      Min             =   7
      TabIndex        =   3
      Top             =   1260
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1035
      TabIndex        =   2
      Top             =   1245
      Width           =   570
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MarksPerPointForm.frx":08A0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      Height          =   195
      Left            =   4590
      TabIndex        =   7
      Top             =   1320
      Width           =   1965
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Mark:"
      Height          =   195
      Left            =   570
      TabIndex        =   6
      Top             =   1275
      Width           =   405
   End
End
Attribute VB_Name = "MarksPerPointForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Series(0).Marks.Item(VScroll1.Value).ShowEditorShape
End Sub

Private Sub Command2_Click()
  TChart1.Series(0).Marks.Clear
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 0
  
  'customize mark
  With TChart1.Series(0).Marks.Item(3)
    .Font.Size = 14
    .Color = vbGreen
  End With
  
  'customize another mark
  With TChart1.Series(0).Marks.Item(5)
    .Font.Size = 12
    .Font.Color = vbYellow
    .Color = vbBlue
    .ShapeStyle = fosRoundRectangle
    .ShadowSize = 4
    .Shadow.Transparency = 60
    .ShadowColor = vbRed
  End With
  
  Text2.Text = "0"
End Sub

Private Sub Text2_Change()
  If val(Text2.Text) < 0 Or val(Text2.Text) > 7 Then
    KeepFocus = True
    MsgBox "Please enter mark number [0..7]", , "Mark"
  Else
    VScroll1.Value = val(Text2.Text)
    Label2.Caption = TChart1.Series(0).ValueMarkText(VScroll1.Value)
  End If
End Sub


Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

