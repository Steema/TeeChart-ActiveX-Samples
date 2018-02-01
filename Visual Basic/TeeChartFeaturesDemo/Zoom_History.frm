VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Zoom_History 
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
   Begin VB.CheckBox Check1 
      Caption         =   "&Historical unzoom steps"
      Height          =   285
      Left            =   2100
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2835
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Zoom_History.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Zoom_History.frx":149E
      Top             =   0
      Width           =   11520
   End
   Begin VB.Label Label1 
      Caption         =   "Drag to zoom..."
      Height          =   255
      Left            =   180
      TabIndex        =   3
      Top             =   1350
      Width           =   1665
   End
End
Attribute VB_Name = "Zoom_History"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Zoom.History = Check1.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Zoom.Pen.Color = RGB(176, 196, 222)
    .Zoom.Pen.Width = 2
    .Zoom.Brush.Style = bsSolid
    .Zoom.Brush.Color = vbDkGray
    .Zoom.History = True

    .Series(0).FillSampleValues (50)
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
