VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_ATR 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   735
      TabIndex        =   3
      Text            =   "14"
      Top             =   1275
      Width           =   435
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   1200
      Max             =   1
      Min             =   100
      TabIndex        =   2
      Top             =   1290
      Value           =   14
      Width           =   255
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Function_ATR.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_ATR.frx":1D64
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Period :"
      Height          =   195
      Left            =   135
      TabIndex        =   4
      Top             =   1350
      Width           =   540
   End
End
Attribute VB_Name = "Function_ATR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  ' Sample Code
  'With TChart1
  '  .Aspect.View3D = False
  '  .AddSeries scCandle
  '  .Series(0).FillSampleValues
  '  .Series(0).Title = "Data"
      
  '  .AddSeries scLine
  '  With .Series(1)
  '     .Title = "ATR"
  '    .SetFunction tfATR
  '    .DataSource = TChart1.Series(0)
  '    .FunctionType.Period = 14
  '  End With
  'End With
  TChart1.Series(0).FillSampleValues
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(1).FunctionType.Period = VScroll1.Value
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

