VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_HorizBarForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"SeriesType_HorizBarForm.frx":0000
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "SeriesType_HorizBarForm.frx":043A
      Left            =   3465
      List            =   "SeriesType_HorizBarForm.frx":0456
      TabIndex        =   5
      Text            =   "Combo1"
      Top             =   1215
      Width           =   1590
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesType_HorizBarForm.frx":04AF
      Left            =   900
      List            =   "SeriesType_HorizBarForm.frx":04C5
      TabIndex        =   4
      Text            =   "Combo1"
      Top             =   1215
      Width           =   1320
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SeriesType_HorizBarForm.frx":050A
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit"
      Height          =   345
      Left            =   5355
      TabIndex        =   1
      Top             =   1215
      Width           =   1140
   End
   Begin VB.Label Label2 
      Caption         =   "Style Bar 2 :"
      Height          =   240
      Left            =   2475
      TabIndex        =   6
      Top             =   1260
      Width           =   825
   End
   Begin VB.Label Label1 
      Caption         =   "Layout:"
      Height          =   240
      Left            =   135
      TabIndex        =   3
      Top             =   1260
      Width           =   735
   End
End
Attribute VB_Name = "SeriesType_HorizBarForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
Dim tmp As Boolean
With TChart1
  Select Case Combo1.ListIndex
    Case 0: .Series(0).asHorizBar.MultiBar = mbNone
    Case 1: .Series(0).asHorizBar.MultiBar = mbSide
    Case 2: .Series(0).asHorizBar.MultiBar = mbStacked
    Case 3: .Series(0).asHorizBar.MultiBar = mbStacked100
    Case 4: .Series(0).asHorizBar.MultiBar = mbSideAll
    Case 5: .Series(0).asHorizBar.MultiBar = mbSelfStack
  End Select

  ' remove "Marks" when stacking...
  tmp = (.Series(0).asHorizBar.MultiBar <> mbStacked) And _
       (.Series(0).asHorizBar.MultiBar <> mbStacked100) And _
       (.Series(0).asHorizBar.MultiBar <> mbSelfStack)
       
  .Series(0).Marks.Visible = tmp
  .Series(1).Marks.Visible = tmp
  .Series(2).Marks.Visible = tmp
End With
End Sub

Private Sub Combo2_Click()
With TChart1
  Select Case Combo2.ListIndex
    Case 0: .Series(2).asHorizBar.BarStyle = bsRectangle
    Case 1: .Series(2).asHorizBar.BarStyle = bsPyramid
    Case 2: .Series(2).asHorizBar.BarStyle = bsInvPyramid
    Case 3: .Series(2).asHorizBar.BarStyle = bsCilinder
    Case 4: .Series(2).asHorizBar.BarStyle = bsEllipse
    Case 5: .Series(2).asHorizBar.BarStyle = bsArrow
    Case 6: .Series(2).asHorizBar.BarStyle = bsRectGradient
    Case 7: .Series(2).asHorizBar.BarStyle = bsCone
  End Select
End With
End Sub

Private Sub Command2_Click()
TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
With TChart1
    For i = 0 To 2
        .AddSeries scHorizBar
        .Series(i).FillSampleValues (3)
        .Series(i).Marks.Visible = True
        .Series(i).asHorizBar.MultiBar = mbNone
    Next i
End With
Combo1.ListIndex = 0
Combo2.ListIndex = 0
End Sub
