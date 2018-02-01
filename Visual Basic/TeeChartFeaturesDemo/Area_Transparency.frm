VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Area_Transparency 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   5700
   ClientLeft      =   3840
   ClientTop       =   2085
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   5700
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4245
      Left            =   0
      TabIndex        =   1
      Top             =   1455
      Width           =   11505
      Base64          =   $"Area_Transparency.frx":0000
   End
   Begin VB.HScrollBar HScroll3 
      Height          =   195
      LargeChange     =   5
      Left            =   5460
      Max             =   100
      SmallChange     =   5
      TabIndex        =   5
      Top             =   1200
      Value           =   45
      Width           =   1095
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   195
      LargeChange     =   5
      Left            =   3780
      Max             =   100
      SmallChange     =   5
      TabIndex        =   4
      Top             =   1200
      Value           =   45
      Width           =   1095
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   195
      LargeChange     =   5
      Left            =   2160
      Max             =   100
      SmallChange     =   5
      TabIndex        =   3
      Top             =   1200
      Value           =   45
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Transparency"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1365
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Area_Transparency.frx":0B20
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label3 
      Caption         =   "Series2"
      Height          =   195
      Left            =   5460
      TabIndex        =   8
      Top             =   960
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Series1"
      Height          =   255
      Left            =   3780
      TabIndex        =   7
      Top             =   960
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Series0"
      Height          =   195
      Left            =   2160
      TabIndex        =   6
      Top             =   960
      Width           =   675
   End
End
Attribute VB_Name = "Area_Transparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 1 Then
      CheckTransparencyValues
    Else
      .Series(0).asArea.Transparency = 0
      .Series(1).asArea.Transparency = 1
      .Series(2).asArea.Transparency = 2
    End If
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
  TChart1.Series(1).FillSampleValues 20
  TChart1.Series(2).FillSampleValues 20
  Check1_Click
End Sub
Private Sub CheckTransparencyValues()
  If Check1.Value = 1 Then
   With TChart1
    .Series(0).asArea.Transparency = HScroll1.Value
    .Series(1).asArea.Transparency = HScroll2.Value
    .Series(2).asArea.Transparency = HScroll3.Value
   End With
  End If
End Sub
Private Sub HScroll1_Change()
  CheckTransparencyValues
End Sub

Private Sub HScroll1_Scroll()
  CheckTransparencyValues
End Sub

Private Sub HScroll2_Change()
  CheckTransparencyValues
End Sub

Private Sub HScroll2_Scroll()
  CheckTransparencyValues
End Sub

Private Sub HScroll3_Change()
  CheckTransparencyValues
End Sub

Private Sub HScroll3_Scroll()
  CheckTransparencyValues
End Sub
