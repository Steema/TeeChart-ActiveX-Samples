VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Marks_UseSeriesTransparency 
   BackColor       =   &H80000005&
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
   Begin ComctlLib.Slider Slider1 
      Height          =   405
      Left            =   5520
      TabIndex        =   3
      Top             =   1260
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   714
      _Version        =   327682
      Max             =   100
      SelStart        =   50
      TickStyle       =   3
      Value           =   50
   End
   Begin VB.CheckBox cbMarksUseTransparency 
      BackColor       =   &H80000005&
      Caption         =   "&Use Series transparency"
      Height          =   255
      Left            =   90
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   3690
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5190
      Left            =   0
      TabIndex        =   0
      Top             =   1725
      Width           =   11505
      Base64          =   $"Marks_UseSeriesTransparency.frx":0000
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   1140
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Marks_UseSeriesTransparency.frx":1AAA
      Top             =   60
      Width           =   11250
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000005&
      Caption         =   "Series transparency :"
      Height          =   255
      Left            =   3840
      TabIndex        =   4
      Top             =   1350
      Width           =   1605
   End
End
Attribute VB_Name = "Marks_UseSeriesTransparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cbMarksUseTransparency_Click()
  TChart1.Series(0).Marks.UseSeriesTransparency = cbMarksUseTransparency.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).Transparency = Slider1.Value
  TChart1.Series(0).Marks.Transparent = False
End Sub

Private Sub Slider1_Click()
  TChart1.Series(0).Transparency = Slider1.Value
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

