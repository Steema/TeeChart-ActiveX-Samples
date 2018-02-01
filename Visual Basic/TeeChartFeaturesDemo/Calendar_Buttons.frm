VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Calendar_Buttons 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3765
   ClientTop       =   2325
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5775
      Left            =   0
      TabIndex        =   1
      Top             =   1140
      Width           =   11505
      Base64          =   $"Calendar_Buttons.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Transparency"
      Height          =   195
      Left            =   2160
      TabIndex        =   3
      Top             =   810
      Width           =   1635
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Buttons"
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   810
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Calendar_Buttons.frx":0412
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Calendar_Buttons"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  With TChart1.Series(0).asCalendar
    .NextButtonVisible = Check1.Value
    .PreviousButtonVisible = Check1.Value
  End With
End Sub

Private Sub Check2_Click()
 Dim tmp
  If Check2.Value = 1 Then
   tmp = 50
  Else
   tmp = 0
  End If
  With TChart1.Series(0).asCalendar
    .Days.Transparency = tmp
    .Sunday.Transparency = tmp
    .Today.Transparency = tmp
  End With
End Sub
