VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfaceTransparencyForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"SurfaceTransparencyForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   315
      Left            =   1260
      Max             =   100
      TabIndex        =   2
      Top             =   1230
      Value           =   50
      Width           =   1995
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SurfaceTransparencyForm.frx":068A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "50%"
      Height          =   195
      Left            =   3360
      TabIndex        =   4
      Top             =   1290
      Width           =   300
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1290
      Width           =   1020
   End
End
Attribute VB_Name = "SurfaceTransparencyForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 10
  TChart1.Series(0).asSurface.Transparency = 50
End Sub

Private Sub HScroll1_Change()
  Label3.Caption = Str(HScroll1.Value) + "%"
  ' Set transparency to serie
  TChart1.Series(0).asSurface.Transparency = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub
