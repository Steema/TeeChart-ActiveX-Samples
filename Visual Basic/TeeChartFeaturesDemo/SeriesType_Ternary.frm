VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_Ternary 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6825
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6825
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"SeriesType_Ternary.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SeriesType_Ternary.frx":00CC
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   1230
      Width           =   1515
   End
End
Attribute VB_Name = "SeriesType_Ternary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
 TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scTernary
    .Series(0).FillSampleValues
    .Series(0).asTernary.Pointer.Style = psCircle
    .Series(0).asTernary.Pointer.Transparency = 20
    .Series(0).asTernary.TernaryStyle = tsBubble
    .Series(0).asTernary.TernaryLegendStyle = tlsBubbleWeight
    
    .Legend.Title.Text.Add "Radius " & ",Weight"
    .Legend.Title.Visible = True
  End With
  
End Sub


Private Sub TChart1_OnBeforeDrawAxes()
  TChart1.Legend.Title.Visible = TChart1.Series(0).ColorEachPoint
End Sub
