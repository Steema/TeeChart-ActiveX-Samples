VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BubbleTranparencyForm 
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
      Height          =   5535
      Left            =   0
      TabIndex        =   4
      Top             =   1380
      Width           =   11505
      Base64          =   $"BubbleTranparencyForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1440
      Max             =   100
      TabIndex        =   2
      Top             =   975
      Value           =   50
      Width           =   3255
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BubbleTranparencyForm.frx":00E0
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      Caption         =   "50%"
      Height          =   180
      Left            =   4770
      TabIndex        =   0
      Top             =   1005
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "Transparency:"
      Height          =   255
      Left            =   345
      TabIndex        =   3
      Top             =   975
      Width           =   1095
   End
End
Attribute VB_Name = "BubbleTranparencyForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstTime As Boolean

Private Sub Form_Activate()
  'adjust horizontal axis to fit all bubbles
  '(the first time the window is activated)
  If FirstTime Then
    FirstTime = False
    TChart1.Repaint
    With TChart1
      tmp = .Axis.Left.CalcXSizeValue(.Series(0).asBubble.RadiusValues.First)
      .Axis.Bottom.MinimumOffset = tmp
      tmp = .Axis.Left.CalcXSizeValue(.Series(0).asBubble.RadiusValues.Last)
      .Axis.Bottom.MaximumOffset = tmp
    End With
    TChart1.Repaint
  End If
End Sub

Private Sub Form_Load()
Dim tmp As Integer
  TChart1.AddSeries scBubble
  TChart1.Series(0).FillSampleValues 10
  
  'cosmetic gradient
  TChart1.Series(0).asBubble.Pointer.Gradient.Visible = True
  TChart1.Series(0).asBubble.Pointer.Gradient.Direction = gdRadial
  
  'transparency
  TChart1.Series(0).asBubble.Transparency = 50
  
  FirstTime = True
End Sub

Private Sub HScroll1_Scroll()
  TChart1.Series(0).asBubble.Transparency = HScroll1.Value
  Label2.Caption = LTrim(Str(HScroll1.Value)) + "%"
End Sub
