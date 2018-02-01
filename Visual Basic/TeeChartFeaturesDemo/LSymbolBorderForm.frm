VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LSymbolBorderForm 
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
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"LSymbolBorderForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Squared symbols"
      Height          =   195
      Left            =   3720
      TabIndex        =   4
      Top             =   1290
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit border..."
      Height          =   345
      Left            =   2040
      TabIndex        =   3
      Top             =   1230
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use Series border"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   1275
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "LSymbolBorderForm.frx":037E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "LSymbolBorderForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Legend.Symbol.Pen.ShowEditor
End Sub

Private Sub Check1_Click()
  TChart1.Legend.Symbol.DefaultPen = (Check1.Value = 1)
  Command1.Enabled = (Check1.Value <> 1)
End Sub

Private Sub Check2_Click()
  TChart1.Legend.Symbol.Squared = (Check2.Value = 1)
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 6

  ' Do not use series border to display legend symbols:
  With TChart1.Legend.Symbol
    .DefaultPen = False

    ' Customize border:
    .Pen.Color = vbRed
    .Pen.Width = 2
    .Pen.EndStyle = esFlat
  End With
End Sub
