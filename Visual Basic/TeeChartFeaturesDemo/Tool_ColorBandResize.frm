VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_ColorBandResize 
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
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"Tool_ColorBandResize.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_ColorBandResize.frx":03CC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Height          =   195
      Left            =   4800
      TabIndex        =   5
      Top             =   1200
      Width           =   45
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "End value:"
      Height          =   195
      Left            =   3720
      TabIndex        =   4
      Top             =   1200
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Height          =   195
      Left            =   1320
      TabIndex        =   3
      Top             =   1200
      Width           =   45
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Start value:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Width           =   810
   End
End
Attribute VB_Name = "Tool_ColorBandResize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Tools.Items(0).asColorband.ResizeStart = True
  TChart1.Tools.Items(0).asColorband.ResizeEnd = True
  Label2.Caption = TChart1.Tools.Items(0).asColorband.StartValue
  Label4.Caption = TChart1.Tools.Items(0).asColorband.EndValue
End Sub

Private Sub TChart1_OnColorBandToolResized()
  Label2.Caption = TChart1.Tools.Items(0).asColorband.StartValue
  Label4.Caption = TChart1.Tools.Items(0).asColorband.EndValue
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
