VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BarImageForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2940
   ClientTop       =   2295
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5655
      Left            =   0
      TabIndex        =   0
      Top             =   1260
      Width           =   11505
      Base64          =   $"BarImageForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   825
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "BarImageForm.frx":02D2
      Top             =   0
      Width           =   11460
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use patterns"
      Height          =   195
      Left            =   240
      TabIndex        =   1
      Top             =   930
      Value           =   1  'Checked
      Width           =   2055
   End
End
Attribute VB_Name = "BarImageForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 0 Then
      .Series(0).asBar.BarBrush.ClearImage
      .Series(1).asBar.BarBrush.ClearImage
    Else
      .Series(0).asBar.BarBrush.LoadImage App.Path & "\Pattern1.bmp"
      .Series(1).asBar.BarBrush.LoadImage App.Path & "\Pattern2.bmp"
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 3
    .Series(1).FillSampleValues 3
    .Series(0).asBar.BarBrush.LoadImage App.Path & "\Pattern1.bmp"
    .Series(1).asBar.BarBrush.LoadImage App.Path & "\Pattern2.bmp"
  End With
End Sub
