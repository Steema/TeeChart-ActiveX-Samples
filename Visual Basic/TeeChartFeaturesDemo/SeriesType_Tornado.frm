VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_Tornado 
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
      Base64          =   $"SeriesType_Tornado.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SeriesType_Tornado.frx":00CC
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
Attribute VB_Name = "SeriesType_Tornado"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
 TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scTornado
    .Aspect.View3D = false;
    
    .AddSeries scTornado
	.Series(0).asTornado.MarksOnBar = true
    .Series(0).Marks.Font.Size = 12
    .Series(0).Marks.Font.Bold = true

    .Series(0).asTornado.SortBy = ETornadoSortBy.sbLeft
    .Series(0).asTornado.Add 1.2, 2.1, "Potatoes", vbBlue
    .Series(0).asTornado.Add 4.8, 3.7, "Cabbages", vbBlue
    .Series(0).asTornado.Add 3.1, 6.1, "Carrots", vbBlue
    .Series(0).asTornado.Add 5.1, 4.2, "Turnips", vbBlue

    .Legend.Visible = false
    .Header.Text.Text = "Greenhouse       Open air"
    .Axis.Bottom.Title.Caption = "tonnes"
    .Axis.Bottom.Title.Visible = false  
  End With
  
End Sub


