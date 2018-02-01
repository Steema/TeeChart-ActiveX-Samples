VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_ScrollbarForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   4
      Top             =   1470
      Width           =   11505
      Base64          =   $"Legend_ScrollbarForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   930
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Legend_ScrollbarForm.frx":02EA
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Legend scrollbar..."
      Height          =   345
      Left            =   270
      TabIndex        =   0
      Top             =   1020
      Width           =   1920
   End
   Begin VB.Label Label2 
      Caption         =   "0"
      Height          =   240
      Left            =   4455
      TabIndex        =   3
      Top             =   1080
      Width           =   420
   End
   Begin VB.Label Label1 
      Caption         =   "Legend first value : "
      Height          =   240
      Left            =   2655
      TabIndex        =   2
      Top             =   1080
      Width           =   1545
   End
End
Attribute VB_Name = "Legend_ScrollbarForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues (50)
    .Series(0).ColorEachPoint = True
    .Tools.Add tcLegendScrollBar
    With .Tools.Items(0).asLegendScrollBar
        .ThumbBrush.LoadImage App.Path + "\BrushStyles\TeeBrush10.bmp"
        .BackColor = vbGreen
        .ArrowBrush.Color = vbBlue
    End With
End With
End Sub

Private Sub TChart1_OnLegendScrollBarToolScrolled()
    Label2.Caption = TChart1.Legend.FirstValue
End Sub
