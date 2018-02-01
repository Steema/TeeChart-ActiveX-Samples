VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartTransparentForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3465
   ClientTop       =   3750
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"ChartTransparentForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Copy Chart"
      Height          =   345
      Left            =   360
      TabIndex        =   2
      Top             =   1110
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartTransparentForm.frx":07A6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ChartTransparentForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()

Dim tmpcolor
Dim tmpbevel

 With TChart1
  tmpbevel = .Panel.BevelOuter
  tmpcolor = .Panel.Color
 
  ' no border
  .Panel.BevelOuter = bvNone

  ' set transparent
  .Panel.Color = clNone

  ' copy to clipboard in metafile mode
  .Export.CopyToClipboardMetafile True

  ' restore previous color
  .Panel.Color = tmpcolor

  ' previous border
  .Panel.BevelOuter = tmpbevel
 End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 10
End Sub


