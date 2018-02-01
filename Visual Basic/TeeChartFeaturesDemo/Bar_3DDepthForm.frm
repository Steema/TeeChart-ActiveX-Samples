VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Bar_3DDepthForm 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5250
      Left            =   0
      TabIndex        =   0
      Top             =   1665
      Width           =   11505
      Base64          =   $"Bar_3DDepthForm.frx":0000
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   285
      Left            =   4530
      Max             =   100
      TabIndex        =   5
      Top             =   1245
      Width           =   2265
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   285
      Left            =   825
      Max             =   100
      TabIndex        =   4
      Top             =   1245
      Width           =   2265
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Bar_3DDepthForm.frx":0E86
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Width:"
      Height          =   195
      Left            =   3915
      TabIndex        =   3
      Top             =   1290
      Width           =   465
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Depth:"
      Height          =   195
      Left            =   195
      TabIndex        =   2
      Top             =   1290
      Width           =   480
   End
End
Attribute VB_Name = "Bar_3DDepthForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
With TChart1
    For i = 0 To 4
        '.AddSeries scBar
        .Series(i).FillSampleValues (5)
        .Series(i).asBar.DepthPercent = 40
        .Series(i).asBar.BarWidthPercent = 40
    Next i
    HScroll1.Value = .Series(0).asBar.DepthPercent
    HScroll2.Value = .Series(0).asBar.BarWidthPercent
End With
  
End Sub

Private Sub HScroll1_Change()
With TChart1
  .Series(0).asBar.DepthPercent = HScroll1.Value
  .Series(1).asBar.DepthPercent = HScroll1.Value
  .Series(2).asBar.DepthPercent = HScroll1.Value
  .Series(3).asBar.DepthPercent = HScroll1.Value
  .Series(4).asBar.DepthPercent = HScroll1.Value
End With
End Sub

Private Sub HScroll2_Change()
With TChart1
  .Series(0).asBar.BarWidthPercent = HScroll2.Value
  .Series(1).asBar.BarWidthPercent = HScroll2.Value
  .Series(2).asBar.BarWidthPercent = HScroll2.Value
  .Series(3).asBar.BarWidthPercent = HScroll2.Value
  .Series(4).asBar.BarWidthPercent = HScroll2.Value
End With
End Sub

