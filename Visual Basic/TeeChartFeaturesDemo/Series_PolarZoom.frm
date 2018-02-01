VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_PolarZoom 
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
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   525
      Left            =   90
      OleObjectBlob   =   "Series_PolarZoom.frx":0000
      TabIndex        =   2
      Top             =   540
      Width           =   11415
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5805
      Left            =   0
      TabIndex        =   0
      Top             =   1110
      Width           =   11505
      Base64          =   $"Series_PolarZoom.frx":004C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   525
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Series_PolarZoom.frx":1BC8
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Series_PolarZoom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  With TChart1
    .Series(0).FillSampleValues
    .Series(1).FillSampleValues
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
