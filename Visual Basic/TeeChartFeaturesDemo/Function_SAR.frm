VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form Function_SAR 
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
      Height          =   270
      Left            =   2730
      TabIndex        =   4
      Top             =   1200
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   476
      _Version        =   327682
      Max             =   100
      SelStart        =   10
      TickFrequency   =   10
      Value           =   10
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1620
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   1200
      Width           =   675
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Function_SAR.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Function_SAR.frx":0CFC
      Top             =   0
      Width           =   11490
   End
   Begin ComctlLib.Slider Slider2 
      Height          =   270
      Left            =   4500
      TabIndex        =   5
      Top             =   1200
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   476
      _Version        =   327682
      Max             =   100
      TickFrequency   =   10
      Value           =   20
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Acceleration Factor:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1260
      Width           =   1425
   End
End
Attribute VB_Name = "Function_SAR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Series(0).Title = "Candles"
  TChart1.Series(1).Title = "SAR"
    
  Text2.Text = TChart1.Series(1).FunctionType.asSAR.AccelerationFactor
  Slider1.Value = TChart1.Series(1).FunctionType.asSAR.AccelerationFactor * 100
End Sub

Private Sub Slider1_Change()
  Text2.Text = Slider1.Value * 0.01
End Sub

Private Sub Slider1_Click()
  Slider1_Change
End Sub

Private Sub Slider2_Change()
  TChart1.Series(1).FunctionType.asSAR.MaxStep = Slider2.Value * 0.01
End Sub

Private Sub Slider2_Click()
  Slider2_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Acceleration Factor"
  Else
    TChart1.Series(1).FunctionType.asSAR.AccelerationFactor = Text2.Text
  End If
End Sub
