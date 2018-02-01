VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form New_Chart_Themes 
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
   Begin VB.ListBox List1 
      Height          =   5130
      ItemData        =   "New_Chart_Themes.frx":0000
      Left            =   0
      List            =   "New_Chart_Themes.frx":002B
      TabIndex        =   5
      Top             =   1710
      Width           =   1905
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Apply by code"
      Height          =   375
      Left            =   3825
      TabIndex        =   3
      Top             =   1260
      Width           =   1770
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Theme Editor..."
      Height          =   375
      Left            =   1980
      TabIndex        =   2
      Top             =   1260
      Width           =   1770
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5205
      Left            =   1935
      TabIndex        =   0
      Top             =   1710
      Width           =   9570
      Base64          =   $"New_Chart_Themes.frx":00B2
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "New_Chart_Themes.frx":12B4
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label1 
      Caption         =   "&Select Theme:"
      Height          =   195
      Left            =   270
      TabIndex        =   4
      Top             =   1350
      Width           =   1365
   End
End
Attribute VB_Name = "New_Chart_Themes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.ShowThemesEditor
End Sub

Private Sub Command2_Click()
  TChart1.SetTheme ctBlackIsBack, cpBlackIsBack
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues
    .Series(0).ColorEachPoint = True
    
    ' Select first theme (TeeChart default theme)
    List1.ListIndex = 8
  End With
End Sub

Private Sub List1_Click()
   Select Case List1.ListIndex
     Case 0: TChart1.SetTheme ctDefault, cpDefault
     Case 1: TChart1.SetTheme ctExcel, cpDefault
     Case 2: TChart1.SetTheme ctClassic, cpDefault
     Case 3: TChart1.SetTheme ctBusiness, cpDefault
     Case 4: TChart1.SetTheme ctWeb, cpDefault
     Case 5: TChart1.SetTheme ctWindowsXP, cpDefault
     Case 6: TChart1.SetTheme ctBlueSky, cpDefault
     Case 7: TChart1.SetTheme ctFacts, cpDefault
     Case 8: TChart1.SetTheme ctRandom, cpTeeChart
     Case 9: TChart1.SetTheme ctOpera, cpOpera
     Case 10: TChart1.SetTheme ctBlackIsBack, cpBlackIsBack
     Case 11: TChart1.SetTheme ctgGrayscale, cpGrayScale
     Case 12: TChart1.SetTheme ctSpeed, cpTeeChart
   End Select
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
