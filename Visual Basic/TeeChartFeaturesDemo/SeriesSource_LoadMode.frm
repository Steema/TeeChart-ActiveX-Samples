VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesSource_LoadMode 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Load Memo2"
      Height          =   345
      Left            =   4680
      TabIndex        =   7
      Top             =   1020
      Width           =   1605
   End
   Begin VB.TextBox Text3 
      Height          =   5355
      Left            =   1740
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "SeriesSource_LoadMode.frx":0000
      Top             =   1530
      Width           =   1755
   End
   Begin VB.TextBox Text2 
      Height          =   5385
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   5
      Text            =   "SeriesSource_LoadMode.frx":007B
      Top             =   1500
      Width           =   1755
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Load Memo1"
      Height          =   345
      Left            =   2970
      TabIndex        =   4
      Top             =   1020
      Width           =   1605
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "SeriesSource_LoadMode.frx":00F4
      Left            =   1140
      List            =   "SeriesSource_LoadMode.frx":00FE
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1050
      Width           =   1365
   End
   Begin TeeChart.SeriesTextSource SeriesTextSource1 
      Left            =   9300
      OleObjectBlob   =   "SeriesSource_LoadMode.frx":0111
      Top             =   990
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5385
      Left            =   3510
      TabIndex        =   1
      Top             =   1485
      Width           =   7950
      Base64          =   $"SeriesSource_LoadMode.frx":015D
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "SeriesSource_LoadMode.frx":0995
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Load Mode:"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1110
      Width           =   855
   End
End
Attribute VB_Name = "SeriesSource_LoadMode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  If Combo1.ListIndex = 0 Then
    SeriesTextSource1.LoadMode = lmClear
  Else
    SeriesTextSource1.LoadMode = lmAppend
  End If
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  SeriesTextSource1.LoadFromStrings Text2.Text
End Sub

Private Sub Command2_Click()
  SeriesTextSource1.LoadFromStrings Text3.Text
End Sub

Private Sub Form_Load()
  SeriesTextSource1.LoadMode = lmAppend
  Combo1.ListIndex = 1

  With SeriesTextSource1
    .Chart = TChart1
    .Series = TChart1.Series(0)
    .FieldSeparator = ","
    .HeaderLines = 3
    .AddField "X", 1
    .AddField "Bar", 2
    .AddField "Text", 3
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
