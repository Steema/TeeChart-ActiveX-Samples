VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Chart_ThemesForm 
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
      Height          =   5400
      Left            =   2220
      TabIndex        =   0
      Top             =   1470
      Width           =   9240
      Base64          =   $"Chart_ThemesForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Apply by code"
      Height          =   345
      Left            =   3870
      TabIndex        =   5
      Top             =   1035
      Width           =   1860
   End
   Begin VB.ListBox List1 
      Height          =   5325
      Index           =   1
      ItemData        =   "Chart_ThemesForm.frx":0612
      Left            =   0
      List            =   "Chart_ThemesForm.frx":062E
      TabIndex        =   3
      Top             =   1470
      Width           =   2220
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   945
      Left            =   30
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Chart_ThemesForm.frx":0687
      Top             =   0
      Width           =   11430
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Theme Editor"
      Height          =   345
      Left            =   2040
      TabIndex        =   1
      Top             =   1035
      Width           =   1860
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Selected Theme :"
      Height          =   195
      Left            =   90
      TabIndex        =   4
      Top             =   1095
      Width           =   1260
   End
End
Attribute VB_Name = "Chart_ThemesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.SetTheme ctWindowsXP, cpWindowsXP
End Sub

Private Sub Command2_Click()
  ' Show the Chart Theme editor
  TChart1.ShowThemesEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (6)
    List1.Item(1).ListIndex = 0
  End With
End Sub

Private Sub List1_Click(Index As Integer)
   Select Case List1.Item(1).ListIndex
     Case 0: TChart1.SetTheme ctDefault, cpDefault
     Case 1: TChart1.SetTheme ctExcel, cpDefault
     Case 2: TChart1.SetTheme ctClassic, cpDefault
     Case 3: TChart1.SetTheme ctBusiness, cpDefault
     Case 4: TChart1.SetTheme ctWeb, cpDefault
     Case 5: TChart1.SetTheme ctWindowsXP, cpDefault
     Case 6: TChart1.SetTheme ctBlueSky, cpDefault
     Case 7: TChart1.SetTheme ctFacts, cpDefault
   End Select
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

