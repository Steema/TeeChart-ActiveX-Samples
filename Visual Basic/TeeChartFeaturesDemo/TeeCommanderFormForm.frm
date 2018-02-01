VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TeeCommanderFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3585
   ClientTop       =   2640
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Height          =   4635
      Left            =   600
      TabIndex        =   2
      Top             =   1560
      Width           =   10650
      Begin VB.CheckBox Check1 
         Caption         =   "Vertical"
         Height          =   255
         Left            =   330
         TabIndex        =   4
         Top             =   120
         Width           =   1395
      End
      Begin TeeChart.TChart TChart1 
         Height          =   4095
         Left            =   1740
         TabIndex        =   3
         Top             =   420
         Width           =   6360
         Base64          =   $"TeeCommanderFormForm.frx":0000
      End
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "TeeCommanderFormForm.frx":022A
      TabIndex        =   1
      Top             =   570
      Width           =   6915
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   555
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "TeeCommanderFormForm.frx":0290
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "TeeCommanderFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OrigHeight

Private Sub Check1_Click()
 With TeeCommander1
   If Check1.Value = 1 Then
     .Vertical = True
     .Top = Text1.Top + Text1.Height + 400
     .Height = Me.ScaleHeight - (Text1.Top + Text1.Height + 400)
     .Left = 0
     .Width = 550
     TChart1.Left = .Left + .Width
     TChart1.Top = .Top - 550
     TChart1.Width = Me.ScaleWidth - .Width
     TChart1.Height = OrigHeight + 550
   Else
     .Vertical = False
     .Top = Text1.Top + Text1.Height + 400
     .Height = 550
     .Left = 0
     .Width = Me.ScaleWidth - 35
     TChart1.Top = .Top ' + .Height
     TChart1.Left = .Left
     TChart1.Width = .Width
     TChart1.Height = OrigHeight
   End If
 End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 10
  With TeeCommander1
     .Chart = TChart1
     .Top = Text1.Top + Text1.Height + 400
     .Height = 550
     .Left = 0
     .Width = Me.ScaleWidth - 35
     TChart1.Left = .Left
     TChart1.Width = .Width
  End With
  TChart1.Panel.MarginRight = 10
  OrigHeight = TChart1.Height
End Sub
