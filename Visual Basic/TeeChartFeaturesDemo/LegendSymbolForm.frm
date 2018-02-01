VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendSymbolForm 
   BorderStyle     =   0  'None
   Caption         =   "LegendSymbolForm"
   ClientHeight    =   6915
   ClientLeft      =   3450
   ClientTop       =   2775
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5025
      Left            =   0
      TabIndex        =   0
      Top             =   1890
      Width           =   11505
      Base64          =   $"LegendSymbolForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   7
      Text            =   "LegendSymbolForm.frx":046C
      Top             =   0
      Width           =   11490
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "LegendSymbolForm.frx":052D
      Left            =   3240
      List            =   "LegendSymbolForm.frx":0537
      TabIndex        =   5
      Text            =   "Left"
      Top             =   1440
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Continuous"
      Height          =   195
      Left            =   5460
      TabIndex        =   3
      Top             =   1500
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   1710
      Max             =   0
      Min             =   150
      TabIndex        =   2
      Top             =   1440
      Value           =   20
      Width           =   255
   End
   Begin VB.Label Label4 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   285
      Left            =   1200
      TabIndex        =   6
      Top             =   1440
      Width           =   495
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Position:"
      Height          =   195
      Left            =   2340
      TabIndex        =   4
      Top             =   1500
      Width           =   600
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Symbol width:"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   1500
      Width           =   975
   End
End
Attribute VB_Name = "LegendSymbolForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Legend.Symbol.Continuous = Check1.Value
  VScroll1.Enabled = Check1.Value
End Sub

Private Sub Combo1_Click()
  TChart1.Legend.Symbol.Position = Combo1.ListIndex
End Sub

Private Sub Form_Load()
  With TChart1
    VScroll1_Change
    .Series(0).FillSampleValues 30
    .Legend.Symbol.Continuous = True
  End With
End Sub

Private Sub VScroll1_Change()
  TChart1.Legend.Symbol.Width = VScroll1.Value
  Label4.Caption = Str$(VScroll1.Value)
End Sub
