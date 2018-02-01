VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   Caption         =   "TeeChart Canvas handle"
   ClientHeight    =   5040
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7260
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5040
   ScaleWidth      =   7260
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   1  'Align Top
      Height          =   600
      Left            =   0
      OleObjectBlob   =   "HandleForm.frx":0000
      TabIndex        =   1
      Top             =   0
      Width           =   7260
   End
   Begin TeeChart.TChart TChart1 
      Height          =   3915
      Left            =   0
      OleObjectBlob   =   "HandleForm.frx":004C
      TabIndex        =   0
      Top             =   600
      Width           =   7260
   End
   Begin VB.Frame Frame1 
      Height          =   525
      Left            =   15
      TabIndex        =   2
      Top             =   4485
      Width           =   7200
      Begin VB.CheckBox Check1 
         Caption         =   "Animate !"
         Height          =   285
         Left            =   3210
         TabIndex        =   3
         Top             =   180
         Width           =   1005
      End
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   6120
      Top             =   2460
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim imageNum

Private Sub Check1_Click()
 If Check1.Value = 1 Then
   imageNum = 1
   TChart1.TimerEnabled = True
 Else
   TChart1.TimerEnabled = False
 End If
End Sub

Private Sub Form_Load()
Dim i As Integer
Dim X As ListImage
    'Load images into the ImageList.
    For i = 1 To 9
      Set X = ImageList1.ListImages. _
      Add(, , LoadPicture(App.Path & "\OnTree" & i & ".jpg"))
    Next i
    'Relate TChart1 to TeeCommander1
    TeeCommander1.Chart = TChart1
    'Fill Chart
    TChart1.Series(0).FillSampleValues 15
    'Set Timer interval
    TChart1.TimerInterval = 350
    'Set start image
    imageNum = 1
End Sub

Private Sub TChart1_OnBeforeDrawChart()
  'Draw image to Chart Canvas
  ImageList1.ListImages(imageNum).Draw TChart1.Canvas.HandleDC, 2000, 1000, imlNormal
End Sub

Private Sub TChart1_OnTimer()
 If imageNum < 9 Then
   imageNum = imageNum + 1
   TChart1.Repaint
 Else
   imageNum = 1
   TChart1.Repaint
 End If
End Sub

Private Sub TeeCommander1_OnEditedChart()
  TChart1.Repaint
End Sub



