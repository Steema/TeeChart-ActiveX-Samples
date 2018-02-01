VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ConesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3630
   ClientTop       =   2505
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"ConesFormForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "ConesFormForm.frx":01F4
      Left            =   4200
      List            =   "ConesFormForm.frx":01FE
      TabIndex        =   5
      Text            =   "Cone"
      Top             =   1230
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   10
      Left            =   1440
      Max             =   100
      Min             =   1
      SmallChange     =   5
      TabIndex        =   2
      Top             =   1260
      Value           =   1
      Width           =   1755
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ConesFormForm.frx":0211
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Height          =   195
      Left            =   3300
      TabIndex        =   4
      Top             =   1290
      Width           =   45
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Cone Percent:"
      Height          =   195
      Left            =   300
      TabIndex        =   3
      Top             =   1290
      Width           =   1020
   End
End
Attribute VB_Name = "ConesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
    TChart1.Series(0).asBar.BarStyle = bsCone
  Else
    TChart1.Series(0).asBar.BarStyle = bsPyramid
  End If
  If Combo1.ListIndex = 0 Then
    HScroll1.Enabled = True
  Else
    HScroll1.Enabled = False
  End If
End Sub

Private Sub Form_Load()
  HScroll1.Value = 30
  Label2.Caption = HScroll1.Value & "%"
  TChart1.Series(0).FillSampleValues 5
End Sub

Private Sub HScroll1_Change()
  Label2.Caption = HScroll1.Value & "%"
  TChart1.Series(0).asBar.ConePercent = HScroll1.Value
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub TChart1_OnAfterDraw()
  With TChart1.Canvas
    .Cone True, 30, 30, 80, 50, 0, 20, True, HScroll1.Value
  End With
End Sub
