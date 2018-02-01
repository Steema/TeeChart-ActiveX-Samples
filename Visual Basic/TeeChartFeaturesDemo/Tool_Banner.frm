VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Banner 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_Banner.frx":0000
      Left            =   6150
      List            =   "Tool_Banner.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   510
      Width           =   1305
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3270
      TabIndex        =   6
      Text            =   "Hello World !"
      Top             =   510
      Width           =   1335
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Transp."
      Height          =   255
      Left            =   1770
      TabIndex        =   4
      Top             =   510
      Width           =   855
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Blink"
      Height          =   255
      Left            =   930
      TabIndex        =   3
      Top             =   510
      Width           =   735
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Scroll"
      Height          =   255
      Left            =   60
      TabIndex        =   2
      Top             =   510
      Value           =   1  'Checked
      Width           =   735
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5985
      Left            =   0
      TabIndex        =   1
      Top             =   930
      Width           =   11505
      Base64          =   $"Tool_Banner.frx":002C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_Banner.frx":00F8
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Scroll direction:"
      Height          =   195
      Left            =   5010
      LinkItem        =   "Combo1"
      TabIndex        =   7
      Top             =   570
      Width           =   1080
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Text:"
      Height          =   195
      Left            =   2880
      TabIndex        =   5
      Top             =   540
      Width           =   360
   End
End
Attribute VB_Name = "Tool_Banner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asBanner.Scroll = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asBanner.Blink = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(0).asBanner.Shape.Transparent = Check3.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
    TChart1.Tools.Items(0).asBanner.ScrollDirection = sdRightLeft
  Else
    TChart1.Tools.Items(0).asBanner.ScrollDirection = sdLeftRight
  End If
End Sub

Private Sub Form_Load()
TChart1.Tools.Add tcBanner

With TChart1.Tools.Items(0).asBanner
    .Text = Text2.Text
    .Shape.Gradient.EndColor = vbGrayText
    .Shape.Gradient.Visible = True
    .Shape.Bevel = bvRaised
    .Shape.Font.Size = 18
    TChart1.Environment.InternalRepaint
    .Shape.Left = (TChart1.Canvas.Width / 2#) - (.Shape.ShapeBounds.Right / 2#)
    .Shape.Top = TChart1.Canvas.Height / 2
End With

Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Tools.Items(0).asBanner.Text = Text2.Text
End Sub
