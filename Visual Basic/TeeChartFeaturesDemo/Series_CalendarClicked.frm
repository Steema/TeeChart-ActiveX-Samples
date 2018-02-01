VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_CalendarClicked 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11460
      Base64          =   $"Series_CalendarClicked.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_CalendarClicked.frx":03E4
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Date under mouse cursor..."
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Width           =   2835
   End
End
Attribute VB_Name = "Series_CalendarClicked"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim ClickedDate As Date
  If TChart1.Series(0).asCalendar.ClickedDate(X, Y, ClickedDate) Then
    Label1.Caption = "Date: " + Format(ClickedDate, "dd/mm/yyyy")
  Else
    Label1.Caption = "Move mouse over dates..."
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
