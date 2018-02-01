VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesXMLSourceWebForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"SeriesXMLSourceWebForm.frx":0000
   End
   Begin TeeChart.SeriesXMLSource SeriesXMLSource1 
      Left            =   6480
      OleObjectBlob   =   "SeriesXMLSourceWebForm.frx":00DC
      Top             =   1080
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   960
      TabIndex        =   2
      Text            =   "http://www.steema.com/SampleData.xml"
      Top             =   1110
      Width           =   3855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Load"
      Height          =   345
      Left            =   5160
      TabIndex        =   3
      Top             =   1065
      Width           =   1080
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesXMLSourceWebForm.frx":0109
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "URL:"
      Height          =   195
      Left            =   450
      TabIndex        =   4
      Top             =   1170
      Width           =   375
   End
End
Attribute VB_Name = "SeriesXMLSourceWebForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  With SeriesXMLSource1
    .FileName = Text2.Text
    .Chart = TChart1
    .Load      '<-- retrieve data and create series
    '.Active = True
  End With
End Sub

Private Sub Form_Load()
'  Text2.Text = App.Path + "\SampleDataSteema.xml"
End Sub
