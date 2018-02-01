VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BubbleGradientForm 
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
      Height          =   5565
      Left            =   0
      TabIndex        =   0
      Top             =   1350
      Width           =   11505
      Base64          =   $"BubbleGradientForm.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Adjust margins..."
      Height          =   345
      Left            =   3840
      TabIndex        =   4
      Top             =   945
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Gradient..."
      Height          =   345
      Left            =   1920
      TabIndex        =   3
      Top             =   945
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Gradient"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   990
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BubbleGradientForm.frx":0804
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "BubbleGradientForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Series(0).asBubble.Pointer.Gradient.ShowEditor True
End Sub

Private Sub Command2_Click()
Dim tmp As Integer
  With TChart1
    tmp = .Axis.Left.CalcXSizeValue(.Series(0).asBubble.RadiusValues.First)
    .Axis.Bottom.MinimumOffset = tmp
    tmp = .Axis.Left.CalcXSizeValue(.Series(0).asBubble.RadiusValues.Last)
    .Axis.Bottom.MaximumOffset = tmp
  End With
End Sub

Private Sub Check1_Click()
  TChart1.Series(0).asBubble.Pointer.Gradient.Visible = (Check1.Value = 1)
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 0
  TChart1.Series(0).asBubble.Pointer.Gradient.Visible = True
  TChart1.Series(0).asBubble.Pointer.Gradient.Direction = gdRadial
  
  TChart1.Series(0).PointColor(4) = vbCyan
End Sub
