VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CalendarSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   2085
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   7890
      Base64          =   $"CalendarSeriesFormForm.frx":0000
   End
   Begin TeeChart.TChart TChart2 
      Height          =   2535
      Left            =   7890
      TabIndex        =   2
      Top             =   1530
      Width           =   3555
      Base64          =   $"CalendarSeriesFormForm.frx":03D0
   End
   Begin TeeChart.TChart TChart3 
      Height          =   2775
      Left            =   7890
      TabIndex        =   3
      Top             =   4050
      Width           =   3555
      Base64          =   $"CalendarSeriesFormForm.frx":0978
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Month name"
      Height          =   315
      Left            =   1380
      TabIndex        =   6
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Weekdays"
      Height          =   315
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   375
      Left            =   2760
      TabIndex        =   4
      Top             =   1080
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CalendarSeriesFormForm.frx":0EEE
      Top             =   0
      Width           =   11400
   End
   Begin VB.Label Label2 
      Caption         =   "..."
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Left            =   6060
      TabIndex        =   8
      Top             =   1140
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Clicked on date (left Chart):"
      Height          =   255
      Left            =   4020
      TabIndex        =   7
      Top             =   1140
      Width           =   1995
   End
End
Attribute VB_Name = "CalendarSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asCalendar.Weekdays.Visible = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asCalendar.Months.Visible = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim ccc
  If TChart1.Series(0).clicked(X, Y) = 0 Then
     Label2.Caption = Format(TChart1.Series(0).asCalendar.Date, "dd/mmm/yyyy")
  End If
End Sub
