VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form ChartEditorPanelFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2340
   ClientTop       =   2295
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   8007.042
   ScaleMode       =   0  'User
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   5520
      OleObjectBlob   =   "ChartEditorPanelFormForm.frx":0000
      Top             =   600
   End
   Begin TeeChart.ChartEditorPanel ChartEditorPanel1 
      Height          =   5775
      Left            =   240
      OleObjectBlob   =   "ChartEditorPanelFormForm.frx":005C
      TabIndex        =   7
      Top             =   1080
      Width           =   5775
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5835
      Left            =   6120
      TabIndex        =   0
      Top             =   1050
      Width           =   5340
      Base64          =   $"ChartEditorPanelFormForm.frx":00AD
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "ChartEditorPanelFormForm.frx":121B
      Left            =   3630
      List            =   "ChartEditorPanelFormForm.frx":1228
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   630
      Width           =   1455
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "ChartEditorPanelFormForm.frx":1249
      Left            =   1290
      List            =   "ChartEditorPanelFormForm.frx":1259
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   630
      Width           =   1155
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   555
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartEditorPanelFormForm.frx":1277
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      Caption         =   "Tabs style:"
      Height          =   195
      Left            =   2730
      TabIndex        =   6
      Top             =   690
      Width           =   795
   End
   Begin VB.Label Label1 
      Caption         =   "Tabs position:"
      Height          =   195
      Left            =   210
      TabIndex        =   5
      Top             =   690
      Width           =   1035
   End
End
Attribute VB_Name = "ChartEditorPanelFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
  With ChartEditorPanel1.MainPage
   If Combo1.ListIndex <> 0 Then
     .TabStyle = tsTabs
   End If
   Select Case Combo1.ListIndex
    Case 0: .TabPosition = tpTop
    Case 1: .TabPosition = tpBottom
    Case 2: .TabPosition = tpLeft
    Case 3: .TabPosition = tpRight
  End Select
  End With
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo2_Change()
  With ChartEditorPanel1.MainPage
   If Combo2.ListIndex <> 0 Then
     .TabPosition = tpTop
   End If
   Select Case Combo2.ListIndex
    Case 0: .TabStyle = tsTabs
    Case 1: .TabStyle = tsButtons
    Case 2: .TabStyle = tsFlatButtons
  End Select
  End With
End Sub

Private Sub Combo2_Click()
  Combo2_Change
End Sub

Private Sub Form_Load()
  TeeEditor1.Chart = TChart1
  ChartEditorPanel1.Chart = TChart1
  ChartEditorPanel1.Editor = TeeEditor1
  TChart1.Series(0).FillSampleValues 10
  
  Combo1.ListIndex = 0
  Combo2.ListIndex = 0
End Sub
