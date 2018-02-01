VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Editor_PixelsPerInch 
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
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   8010
      OleObjectBlob   =   "Editor_PixelsPerInch.frx":0000
      Top             =   960
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Default"
      Height          =   195
      Left            =   4680
      TabIndex        =   6
      Top             =   1020
      Width           =   975
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3840
      Max             =   0
      Min             =   3000
      TabIndex        =   5
      Top             =   990
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3210
      TabIndex        =   4
      Text            =   "0"
      Top             =   990
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   1
      Top             =   1350
      Width           =   11505
      Base64          =   $"Editor_PixelsPerInch.frx":005C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Editor_PixelsPerInch.frx":03C2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Pixels per inch:"
      Height          =   195
      Left            =   2010
      TabIndex        =   3
      Top             =   1020
      Width           =   1065
   End
End
Attribute VB_Name = "Editor_PixelsPerInch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If Check1.Value Then
    VScroll1.Value = 0
  End If
End Sub

Private Sub Command1_Click()
  TeeEditor1.ShowEditor
End Sub

Private Sub Form_Load()
  TeeEditor1.ChartLink = TChart1.ChartLink
  
  VScroll1.Value = 150
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Pixels per inch"
  Else
    If (val(Text2.Text) > 3000 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 3000", , "Pixels per inch"
    Else
      TeeEditor1.PixelsPerInch = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
      
      If val(Text2.Text) = 0 Then
        Check1.Value = Checked
        Check1.Enabled = False
      Else
        Check1.Value = Unchecked
        Check1.Enabled = True
      End If
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
