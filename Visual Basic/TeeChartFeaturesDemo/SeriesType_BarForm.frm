VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_BarForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"SeriesType_BarForm.frx":0000
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "SeriesType_BarForm.frx":0464
      Left            =   3465
      List            =   "SeriesType_BarForm.frx":0480
      TabIndex        =   6
      Text            =   "Combo1"
      Top             =   1245
      Width           =   1320
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesType_BarForm.frx":04D9
      Left            =   945
      List            =   "SeriesType_BarForm.frx":04EF
      TabIndex        =   4
      Text            =   "Combo1"
      Top             =   1245
      Width           =   1320
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SeriesType_BarForm.frx":0534
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   5310
      TabIndex        =   1
      Top             =   1230
      Width           =   1050
   End
   Begin VB.Label Label2 
      Caption         =   "Style Bar 2 :"
      Height          =   240
      Left            =   2475
      TabIndex        =   5
      Top             =   1290
      Width           =   825
   End
   Begin VB.Label Label1 
      Caption         =   "Layout :"
      Height          =   240
      Left            =   180
      TabIndex        =   3
      Top             =   1290
      Width           =   825
   End
End
Attribute VB_Name = "SeriesType_BarForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
Dim tmp As Boolean
With TChart1
  Select Case Combo1.ListIndex
    Case 0: .Series(0).asBar.MultiBar = mbNone
    Case 1: .Series(0).asBar.MultiBar = mbSide
    Case 2: .Series(0).asBar.MultiBar = mbStacked
    Case 3: .Series(0).asBar.MultiBar = mbStacked100
    Case 4: .Series(0).asBar.MultiBar = mbSideAll
    Case 5: .Series(0).asBar.MultiBar = mbSelfStack
  End Select

  ' remove "Marks" when stacking...
  tmp = (.Series(0).asBar.MultiBar <> mbStacked) And _
       (.Series(0).asBar.MultiBar <> mbStacked100) And _
       (.Series(0).asBar.MultiBar <> mbSelfStack)
       
  .Series(0).Marks.Visible = tmp
  .Series(1).Marks.Visible = tmp
  .Series(2).Marks.Visible = tmp
End With
End Sub

Private Sub Combo2_Click()
With TChart1
  Select Case Combo2.ListIndex
    Case 0: .Series(2).asBar.BarStyle = bsRectangle
    Case 1: .Series(2).asBar.BarStyle = bsPyramid
    Case 2: .Series(2).asBar.BarStyle = bsInvPyramid
    Case 3: .Series(2).asBar.BarStyle = bsCilinder
    Case 4: .Series(2).asBar.BarStyle = bsEllipse
    Case 5: .Series(2).asBar.BarStyle = bsArrow
    Case 6: .Series(2).asBar.BarStyle = bsRectGradient
    Case 7: .Series(2).asBar.BarStyle = bsCone
  End Select
End With
End Sub

Private Sub Command2_Click()
TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
With TChart1
    For i = 0 To 2
      .AddSeries scBar
      .Series(i).FillSampleValues (6)
      .Series(i).Marks.Visible = True
      .Series(i).asBar.MultiBar = mbNone
    Next i
End With
Combo1.ListIndex = 0
Combo2.ListIndex = 0
End Sub
