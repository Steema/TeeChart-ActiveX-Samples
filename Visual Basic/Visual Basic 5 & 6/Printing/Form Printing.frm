VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro Activex -- Printing example"
   ClientHeight    =   4275
   ClientLeft      =   3540
   ClientTop       =   4140
   ClientWidth     =   6525
   LinkTopic       =   "Form1"
   ScaleHeight     =   4275
   ScaleWidth      =   6525
   Begin TeeChart.TChart TChart1 
      Height          =   3375
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   6375
      Base64          =   $"Form Printing.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   495
      Left            =   5340
      TabIndex        =   6
      Top             =   3720
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Paper &Orientation:"
      Height          =   615
      Left            =   2700
      TabIndex        =   3
      Top             =   3600
      Width           =   2415
      Begin VB.OptionButton Option2 
         Caption         =   "&Landscape"
         Height          =   255
         Left            =   1200
         TabIndex        =   5
         Top             =   240
         Value           =   -1  'True
         Width           =   1155
      End
      Begin VB.OptionButton Option1 
         Caption         =   "P&ortrait"
         Height          =   255
         Left            =   180
         TabIndex        =   4
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "High detail"
      Height          =   255
      Left            =   1500
      TabIndex        =   2
      Top             =   3720
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Print Preview..."
      Height          =   435
      Left            =   60
      TabIndex        =   1
      Top             =   3600
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Check1.Value Then
     TChart1.Printer.Detail = 100
  Else
     TChart1.Printer.Detail = 0
  End If
End Sub

Private Sub Command1_Click()
    TChart1.Printer.ShowPreview
End Sub

Private Sub Command2_Click()
  End
End Sub

Private Sub Form_Load()
    TChart1.AddSeries scArea
    TChart1.AddSeries scPoint
    TChart1.AddSeries scLine
    TChart1.AddSeries scFastLine
    TChart1.Series(0).FillSampleValues 6
    TChart1.Series(1).FillSampleValues 6
    TChart1.Series(2).FillSampleValues 6
    TChart1.Series(3).FillSampleValues 6
End Sub

Private Sub Option1_Click()
    TChart1.Printer.Orientation = poPortrait
End Sub

Private Sub Option2_Click()
    TChart1.Printer.Orientation = poLandscape
End Sub

Private Sub TChart1_OnDblClick()
    TChart1.ShowEditor
    TChart1.StopMouse
End Sub



