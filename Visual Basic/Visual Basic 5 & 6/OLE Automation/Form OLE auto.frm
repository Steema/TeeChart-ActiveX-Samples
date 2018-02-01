VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "TeeChart OLE Automation Test"
   ClientHeight    =   4290
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   5760
   LinkTopic       =   "Form1"
   ScaleHeight     =   4290
   ScaleWidth      =   5760
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   435
      Left            =   4560
      TabIndex        =   2
      Top             =   3660
      Width           =   1095
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   2595
      Left            =   120
      ScaleHeight     =   2535
      ScaleWidth      =   5475
      TabIndex        =   1
      Top             =   840
      Width           =   5535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Execute Example"
      Height          =   555
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   $"Form OLE auto.frx":0000
      Height          =   675
      Left            =   120
      TabIndex        =   3
      Top             =   3540
      Width           =   4155
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim Chart As Object
 ' create the ole automated object...
 Set Chart = CreateObject("TeeChart.TChart")
 ' set properties...
  Chart.Width = 360
  Chart.Height = 170
  Chart.AddSeries (1)
 ' add some random values...
  Chart.Series(0).FillSampleValues 6
  Chart.Series(0).ColorEachPoint = True
 ' save the chart to bitmap file...
  Chart.Export.SaveToBitmapFile ("c:\mychart.bmp")
 ' release the object...
 Set Chart = Nothing
 ' load the bitmap file back to Picture control...
 Picture1 = LoadPicture("c:\mychart.bmp")
End Sub

Private Sub Command2_Click()
 End
End Sub


