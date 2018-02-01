VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form PenForm 
   Caption         =   "Pen Editor "
   ClientHeight    =   1530
   ClientLeft      =   6690
   ClientTop       =   4320
   ClientWidth     =   3300
   LinkTopic       =   "Form2"
   ScaleHeight     =   1530
   ScaleWidth      =   3300
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2220
      TabIndex        =   8
      Top             =   1080
      Width           =   1035
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1080
      TabIndex        =   7
      Top             =   1080
      Width           =   1035
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "PenForm.frx":0000
      Left            =   1860
      List            =   "PenForm.frx":0016
      TabIndex        =   5
      Text            =   "Solid"
      Top             =   60
      Width           =   1395
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   3000
      Max             =   1
      Min             =   10
      TabIndex        =   3
      Top             =   600
      Value           =   1
      Width           =   255
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   2640
      TabIndex        =   2
      Text            =   "1"
      Top             =   600
      Width           =   375
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   60
      Top             =   1020
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Visible"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   540
      TabIndex        =   9
      Top             =   600
      Width           =   315
   End
   Begin VB.Label Label4 
      Caption         =   "Style:"
      Height          =   195
      Left            =   1380
      TabIndex        =   6
      Top             =   120
      Width           =   435
   End
   Begin VB.Label Label3 
      Caption         =   "Width:"
      Height          =   195
      Left            =   2100
      TabIndex        =   4
      Top             =   660
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "Color:"
      Height          =   195
      Left            =   60
      TabIndex        =   1
      Top             =   660
      Width           =   435
   End
End
Attribute VB_Name = "PenForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim tmpPenwidth, tmpPenStyle As Integer
Dim tmpPenVisible As Boolean
Dim tmpPenColor As OLE_COLOR

Private Sub Check1_Click()
  PenVisible = Check1.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  PenStyle = Combo1.ItemData(Combo1.ListIndex)
End Sub

Private Sub Command1_Click()
  PenCancel = False
  Unload Me
End Sub

Private Sub Command2_Click()
  PenColor = tmpPenColor
  PenStyle = tmpPenStyle
  PenVisible = tmpPenVisible
  PenWidth = tmpPenwidth
  PenCancel = True
  Unload Me
End Sub

Private Sub Form_Load()
  'backup in case of cancel
  tmpPenColor = PenColor
  tmpPenStyle = PenStyle
  tmpPenVisible = PenVisible
  tmpPenwidth = PenWidth
  If PenStyle < 5 Then
    Combo1.ListIndex = PenStyle
  Else
    Combo1.ListIndex = 5
  End If
  If PenVisible = True Then
    Check1.Value = 1
  Else
    Check1.Value = 0
  End If
  VScroll1.Value = PenWidth
  If PenColor <> 536870912 Then  'not clTeeColor
    Label1.BackColor = PenColor
  End If
End Sub

Private Sub Label1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color > 0 Then
    PenColor = CommonDialog1.Color
    Label1.BackColor = CommonDialog1.Color
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text1.Text = VScroll1.Value
  PenWidth = CInt(Text1.Text)
End Sub
