VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ErrorForm 
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
      Height          =   5820
      Left            =   0
      TabIndex        =   0
      Top             =   1095
      Width           =   11505
      Base64          =   $"Series_ErrorForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   285
      Left            =   4590
      Max             =   200
      TabIndex        =   6
      Top             =   630
      Value           =   100
      Width           =   1500
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_ErrorForm.frx":0436
      Left            =   1935
      List            =   "Series_ErrorForm.frx":044C
      TabIndex        =   4
      Text            =   "Combo1"
      Top             =   630
      Width           =   1770
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   525
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Series_ErrorForm.frx":048A
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   180
      TabIndex        =   1
      Top             =   615
      Width           =   930
   End
   Begin VB.Label Label2 
      Caption         =   "Size:"
      Height          =   240
      Left            =   4005
      TabIndex        =   5
      Top             =   675
      Width           =   510
   End
   Begin VB.Label Label1 
      Caption         =   "Style:"
      Height          =   240
      Left            =   1350
      TabIndex        =   3
      Top             =   675
      Width           =   510
   End
End
Attribute VB_Name = "Series_ErrorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
With TChart1
  Select Case Combo1.ListIndex
    Case 0: .Series(0).asError.ErrorStyle = essLeft
    Case 1: .Series(0).asError.ErrorStyle = essTop
    Case 2: .Series(0).asError.ErrorStyle = essRight
    Case 3: .Series(0).asError.ErrorStyle = essBottom
    Case 4: .Series(0).asError.ErrorStyle = essLeftRight
    Case 5: .Series(0).asError.ErrorStyle = essTopBottom
  End Select
End With
End Sub

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scError
   ' Index Value Error Label Color }
   With .Series(0).asError
     .AddErrorBar 0, 50, 10, "A", vbRed
     .AddErrorBar 1, 80, 20, "B", vbYellow
     .AddErrorBar 2, 20, 8, "C", vbGreen
     .AddErrorBar 3, 60, 30, "D", vbBlue
     .AddErrorBar 4, 40, 5, "E", vbWhite
   End With
   .Series(0).Pen.Width = 2
End With
  Combo1.ListIndex = 5
End Sub

Private Sub HScroll1_Scroll()
  TChart1.Series(0).asError.ErrorWidth = HScroll1.Value
End Sub
