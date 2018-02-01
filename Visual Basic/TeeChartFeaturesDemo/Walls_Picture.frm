VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Walls_Picture 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   8580
      Top             =   930
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Walls_Picture.frx":0000
      Left            =   4260
      List            =   "Walls_Picture.frx":0010
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1020
      Width           =   1605
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Apply to..."
      Height          =   345
      Left            =   2670
      TabIndex        =   3
      Top             =   1020
      Width           =   1425
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Browse Image..."
      Height          =   345
      Left            =   300
      TabIndex        =   2
      Top             =   1020
      Width           =   1545
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Walls_Picture.frx":0043
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Walls_Picture.frx":0237
      Top             =   0
      Width           =   11490
   End
   Begin VB.Image Image1 
      Height          =   465
      Left            =   2010
      Stretch         =   -1  'True
      Top             =   960
      Width           =   465
   End
End
Attribute VB_Name = "Walls_Picture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  CommonDialog1.ShowOpen
  
  If CommonDialog1.FileName <> "" Then
    Image1.Picture = LoadPicture(CommonDialog1.FileName)
    Command2.Enabled = True
  End If
End Sub

Private Sub Command2_Click()
  With TChart1.Walls
    Select Case Combo1.ListIndex
      Case 0: .Left.Picture.AssignImage (Image1.Picture)
      Case 1: .Right.Picture.AssignImage (Image1.Picture)
      Case 2: .Bottom.Picture.AssignImage (Image1.Picture)
      Case 3: .Back.Picture.AssignImage (Image1.Picture)
    End Select
  End With
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  Command2.Enabled = False
  
  TChart1.Tools.Add tcRotate
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
