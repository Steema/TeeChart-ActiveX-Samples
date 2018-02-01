VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form SeriesType_Darvas 
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
   Begin TeeChart.TChart TChart1 
      Height          =   5535
      Left            =   0
      TabIndex        =   7
      Top             =   1380
      Width           =   11505
      Base64          =   $"SeriesType_Darvas.frx":0000
   End
   Begin ComctlLib.Slider Slider1 
      Height          =   165
      Left            =   5640
      TabIndex        =   6
      Top             =   1050
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   291
      _Version        =   327682
      Max             =   100
      TickFrequency   =   10
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Brush..."
      Height          =   345
      Left            =   4560
      TabIndex        =   5
      Top             =   960
      Width           =   885
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Pen..."
      Height          =   345
      Left            =   3600
      TabIndex        =   4
      Top             =   960
      Width           =   885
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Random Values"
      Height          =   345
      Left            =   960
      TabIndex        =   3
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   90
      TabIndex        =   2
      Top             =   960
      Width           =   795
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "SeriesType_Darvas.frx":0CF8
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Boxes: "
      Height          =   195
      Left            =   2550
      TabIndex        =   1
      Top             =   1050
      Width           =   525
   End
End
Attribute VB_Name = "SeriesType_Darvas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Command2_Click()
  FillSeries
End Sub

Private Sub Command3_Click()
  TChart1.Series(0).asDarvas.BoxPen.ShowEditor
End Sub

Private Sub Command4_Click()
  TChart1.Series(0).asDarvas.BoxBrush.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scDarvas
  Slider1.Value = TChart1.Series(0).asDarvas.Transparency
  FillSeries
  
  TChart1.Series(0).Name = "Darvas"
  TChart1.Series(0).Color = RGB(130, 155, 254)
  
  TChart1.Series(0).asDarvas.BoxBrush.BackColor = RGB(0, 255, 255)
End Sub

Private Sub Slider1_Change()
  TChart1.Series(0).asDarvas.Transparency = Slider1.Value
End Sub


Private Sub Slider1_Scroll()
  Slider1_Change
End Sub

Private Sub TChart1_OnAfterDraw()
  Label1.Caption = "Boxes: " + Str(TChart1.Series(0).asDarvas.NumBoxes)
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim tmp As Integer
  tmp = TChart1.Series(0).asDarvas.ClickedBox(X, Y)
  TChart1.Tools.Items(1).Active = tmp <> -1
  
  If TChart1.Tools.Items(1).Active Then
    With TChart1.Series(0).asDarvas.BoxesRect(tmp)
      TChart1.Tools.Items(1).asRectangle.SetBounds .Left, .Top, .Right, .Bottom
    End With
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub FillSeries()
  TChart1.Series(0).FillSampleValues 40
End Sub
