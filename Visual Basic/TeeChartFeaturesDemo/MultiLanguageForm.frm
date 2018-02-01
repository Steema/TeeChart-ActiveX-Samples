VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form MultiLanguageForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Height          =   5640
      Left            =   45
      TabIndex        =   4
      Top             =   1305
      Width           =   11490
      Base64          =   $"MultiLanguageForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   376
      Object.Left            =   3
      Object.Top             =   87
      Object.Visible         =   -1  'True
      Object.Width           =   766
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   0
      Languaged       =   0
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   285
      Left            =   3555
      TabIndex        =   0
      Top             =   990
      Width           =   1185
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "MultiLanguageForm.frx":0DD6
      Left            =   1305
      List            =   "MultiLanguageForm.frx":0E43
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   945
      Width           =   2085
   End
   Begin VB.TextBox AntiAliasForm 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MultiLanguageForm.frx":0F8D
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Language :"
      Height          =   240
      Left            =   180
      TabIndex        =   2
      Top             =   990
      Width           =   1185
   End
End
Attribute VB_Name = "MultiLanguageForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
With TChart1
   Select Case Combo1.ListIndex
        Case 0:
           .Language = laEnglish
        Case 1:
           .Language = laArabic
        Case 2:
           .Language = laBrazilianPortuguese
        Case 3:
           .Language = laCatalan
        Case 4:
           .Language = laChineseSimple
        Case 5:
           .Language = laChineseTraditional
        Case 6:
           .Language = laCzech
        Case 7:
           .Language = laDanish
        Case 8:
           .Language = laDutch
        Case 9:
           .Language = laFarsi
        Case 10:
           .Language = laFinnish
        Case 11:
           .Language = laFrench
        Case 12:
           .Language = laGalician
        Case 13:
           .Language = laGerman
        Case 14:
           .Language = laHebrew
        Case 15:
           .Language = laHellenic
        Case 16:
           .Language = laHindi
        Case 17:
           .Language = laHungarian
        Case 18:
           .Language = laIndonesian
        Case 19:
           .Language = laItalian
        Case 20:
           .Language = laJapanese
        Case 21:
           .Language = laKorean
        Case 22:
           .Language = laNorwegian
        Case 23:
           .Language = laPolish
        Case 24:
           .Language = laPortuguese
        Case 25:
           .Language = laRomanian
        Case 26:
           .Language = laRussian
        Case 27:
           .Language = laSerbian
        Case 28:
           .Language = laSlovak
        Case 29:
           .Language = laSlovene
        Case 30:
           .Language = laSpanish
        Case 31:
           .Language = laSwedish
        Case 32:
           .Language = laTurkish
        Case 33:
           .Language = laUkrainian
        Case 34:
           .Language = laUrdu
        Case Else
           .Language = laEnglish
    End Select
End With
End Sub

Private Sub Command1_Click()
TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 20
End Sub
