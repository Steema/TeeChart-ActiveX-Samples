VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form Filter_Light 
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
   Begin ComctlLib.Slider Slider1 
      Height          =   195
      Left            =   2670
      TabIndex        =   5
      Top             =   1110
      Width           =   1485
      _ExtentX        =   2619
      _ExtentY        =   344
      _Version        =   327682
      LargeChange     =   10
      SmallChange     =   10
      Max             =   1000
      SelStart        =   50
      TickFrequency   =   40
      Value           =   50
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Filter_Light.frx":0000
      Left            =   660
      List            =   "Filter_Light.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1050
      Width           =   1245
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   1
      Top             =   1530
      Width           =   11505
      Base64          =   $"Filter_Light.frx":0021
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_Light.frx":036D
      Top             =   0
      Width           =   11490
   End
   Begin ComctlLib.Slider Slider2 
      Height          =   195
      Left            =   4890
      TabIndex        =   7
      Top             =   1110
      Width           =   1485
      _ExtentX        =   2619
      _ExtentY        =   344
      _Version        =   327682
      LargeChange     =   10
      SmallChange     =   10
      Max             =   1000
      SelStart        =   70
      TickFrequency   =   40
      Value           =   70
   End
   Begin ComctlLib.Slider Slider3 
      Height          =   195
      Left            =   7260
      TabIndex        =   9
      Top             =   1110
      Width           =   1485
      _ExtentX        =   2619
      _ExtentY        =   344
      _Version        =   327682
      LargeChange     =   10
      SmallChange     =   10
      Max             =   100
      SelStart        =   5
      TickFrequency   =   20
      Value           =   5
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Factor:"
      Height          =   195
      Left            =   6630
      TabIndex        =   8
      Top             =   1110
      Width           =   495
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Top:"
      Height          =   195
      Left            =   4440
      TabIndex        =   6
      Top             =   1110
      Width           =   330
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Left:"
      Height          =   195
      Left            =   2220
      TabIndex        =   4
      Top             =   1110
      Width           =   315
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Style:"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   1110
      Width           =   390
   End
End
Attribute VB_Name = "Filter_Light"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Tools.Items(0).asLight.Style = lsLinear
    Case 1: TChart1.Tools.Items(0).asLight.Style = lsSpotLight
  End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcLight
  
  With TChart1.Tools.Items(0).asLight
    .Style = lsLinear
    .Left = Slider1.Value
    .Top = Slider2.Value
    .Factor = Slider3.Value
  End With
  
  Combo1.ListIndex = 0
End Sub

Private Sub Slider1_Change()
  TChart1.Tools.Items(0).asLight.Left = Slider1.Value
End Sub

Private Sub Slider1_Click()
  Slider1_Change
End Sub

Private Sub Slider2_Change()
  TChart1.Tools.Items(0).asLight.Top = Slider2.Value
End Sub

Private Sub Slider2_Click()
  Slider2_Change
End Sub

Private Sub Slider3_Change()
  TChart1.Tools.Items(0).asLight.Factor = Slider3.Value
End Sub

Private Sub Slider3_Click()
  Slider3_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
