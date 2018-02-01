VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesSortByLabelsForm 
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
      Base64          =   $"SeriesSortByLabelsForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesSortByLabelsForm.frx":040A
      Left            =   960
      List            =   "SeriesSortByLabelsForm.frx":0414
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1215
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesSortByLabelsForm.frx":042F
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Data is not sorted"
      Height          =   195
      Left            =   2880
      TabIndex        =   4
      Top             =   1290
      Width           =   1245
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Sort type:"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   1260
      Width           =   675
   End
End
Attribute VB_Name = "SeriesSortByLabelsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
    TChart1.Series(0).SortByLabels loAscending
    Label2.Caption = "Data is sorted by text (ascending)"
  Else
    TChart1.Series(0).SortByLabels loDescending
    Label2.Caption = "Data is sorted by text (descending)"
  End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).Add 323, "John", vbBlue
  TChart1.Series(0).Add 222, "Anne", vbBlue
  TChart1.Series(0).Add 456, "Matt", vbBlue
  TChart1.Series(0).Add 188, "Sean", vbBlue
  TChart1.Series(0).Add 701, "Andrew", vbBlue
  TChart1.Series(0).Add 411, "Marc", vbBlue
End Sub
