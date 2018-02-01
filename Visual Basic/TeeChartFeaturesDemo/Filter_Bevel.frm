VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Bevel 
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
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   4440
      Max             =   200
      TabIndex        =   8
      Top             =   1245
      Width           =   1575
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1800
      Max             =   100
      TabIndex        =   7
      Top             =   1245
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Filters..."
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   975
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Filter_Bevel.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Filter_Bevel.frx":3CB08
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   195
      Left            =   6120
      TabIndex        =   6
      Top             =   1275
      Width           =   90
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Size:"
      Height          =   195
      Left            =   4080
      TabIndex        =   5
      Top             =   1275
      Width           =   345
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   195
      Left            =   3480
      TabIndex        =   4
      Top             =   1275
      Width           =   90
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Bright:"
      Height          =   195
      Left            =   1320
      TabIndex        =   3
      Top             =   1275
      Width           =   450
   End
End
Attribute VB_Name = "Filter_Bevel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Panel.BackImage.ShowFiltersEditor
End Sub

Private Sub Form_Load()
  TChart1.Panel.BackImage.Filters.Add fcBevel
  TChart1.Panel.BackImage.Filters.Item(0).asBevel.Bright = 64
  TChart1.Panel.BackImage.Filters.Item(0).asBevel.Size = 28
  
  HScroll1.Value = TChart1.Panel.BackImage.Filters.Item(0).asBevel.Bright
  HScroll2.Value = TChart1.Panel.BackImage.Filters.Item(0).asBevel.Size
  Label2.Caption = Str(HScroll1.Value)
  Label4.Caption = Str(HScroll2.Value)
End Sub

Private Sub HScroll1_Change()
  TChart1.Panel.BackImage.Filters.Item(0).asBevel.Bright = HScroll1.Value
  Label2.Caption = Str(HScroll1.Value)
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  TChart1.Panel.BackImage.Filters.Item(0).asBevel.Size = HScroll2.Value
  Label4.Caption = Str(HScroll2.Value)
  TChart1.Repaint
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
