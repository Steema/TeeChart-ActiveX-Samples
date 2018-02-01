VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form BrushForm 
   Caption         =   "Brush Editor"
   ClientHeight    =   1380
   ClientLeft      =   6810
   ClientTop       =   4950
   ClientWidth     =   3525
   LinkTopic       =   "Form2"
   ScaleHeight     =   1380
   ScaleWidth      =   3525
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   480
      Top             =   660
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "BrushForm.frx":0000
      Left            =   660
      List            =   "BrushForm.frx":0046
      TabIndex        =   4
      Text            =   "Solid"
      Top             =   180
      Width           =   1395
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1260
      TabIndex        =   1
      Top             =   780
      Width           =   1035
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   780
      Width           =   1035
   End
   Begin VB.Label Label4 
      Caption         =   "Style:"
      Height          =   195
      Left            =   180
      TabIndex        =   5
      Top             =   240
      Width           =   435
   End
   Begin VB.Label Label2 
      Caption         =   "Color:"
      Height          =   195
      Left            =   2580
      TabIndex        =   3
      Top             =   240
      Width           =   435
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   3120
      TabIndex        =   2
      Top             =   180
      Width           =   315
   End
End
Attribute VB_Name = "BrushForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim tmpBrushColor As OLE_COLOR
Dim tmpBrushStyle As Integer

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  BrushStyle = Combo1.ItemData(Combo1.ListIndex)
End Sub

Private Sub Command1_Click()
  Unload Me
End Sub

Private Sub Command2_Click()
  BrushColor = tmpBrushColor
  BrushStyle = tmpBrushStyle
  BrushCancel = True
  Unload Me
End Sub

Private Sub Form_Load()
  'backup in case of cancel
  tmpBrushColor = BrushColor
  tmpBrushStyle = BrushStyle
  Label1.BackColor = tmpBrushColor
  Combo1.ListIndex = tmpBrushStyle
End Sub

Private Sub Label1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color > 0 Then
    BrushColor = CommonDialog1.Color
    Label1.BackColor = CommonDialog1.Color
  End If
End Sub
