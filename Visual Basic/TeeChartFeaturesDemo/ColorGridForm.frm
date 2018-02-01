VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorGridForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2790
   ClientTop       =   2145
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"ColorGridForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   6150
      Max             =   1
      Min             =   1000
      TabIndex        =   7
      Top             =   1170
      Value           =   30
      Width           =   225
   End
   Begin VB.TextBox Text3 
      Height          =   315
      Left            =   5700
      TabIndex        =   6
      Top             =   1170
      Width           =   435
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   3120
      TabIndex        =   5
      Top             =   1170
      Width           =   1065
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   195
      Left            =   2580
      TabIndex        =   4
      Top             =   1230
      Width           =   195
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Grid"
      Height          =   345
      Left            =   1560
      TabIndex        =   3
      Top             =   1170
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Grid"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorGridForm.frx":026A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "No. of values:"
      Height          =   195
      Left            =   4620
      TabIndex        =   8
      Top             =   1230
      Width           =   990
   End
End
Attribute VB_Name = "ColorGridForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asColorGrid.Pen.Visible = Check1.Value
End Sub

Private Sub Command1_Click()
  With TChart1.Series(0).asColorGrid.Pen
    PenColor = .Color
    PenStyle = .Style
    PenVisible = .Visible
    PenWidth = .Width
    PenForm.Show vbModal
    If PenCancel = False Then
      .Color = PenColor
      .Style = PenStyle
      .Visible = PenVisible
      .Width = PenWidth
      Text2.BackColor = .Color
      If .Visible = True Then
        Check1.Value = 1
      Else
        Check1.Value = 0
      End If
    End If
  End With
End Sub

Private Sub Command2_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
  VScroll1_Scroll
  Text2.BackColor = TChart1.Series(0).asColorGrid.Pen.Color
End Sub

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Size"
  Else
    TChart1.Series(0).FillSampleValues val(Text3.Text)
    VScroll1.Value = val(Text3.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text3.Text = Str$(VScroll1.Value)
  Text3_Confirm
End Sub
