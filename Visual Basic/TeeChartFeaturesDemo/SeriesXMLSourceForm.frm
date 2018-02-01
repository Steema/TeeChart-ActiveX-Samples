VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesXMLSourceForm 
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
      Base64          =   $"SeriesXMLSourceForm.frx":0000
   End
   Begin TeeChart.SeriesXMLSource SeriesXMLSource1 
      Left            =   3600
      OleObjectBlob   =   "SeriesXMLSourceForm.frx":06F0
      Top             =   1050
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Load File"
      Height          =   345
      Left            =   480
      TabIndex        =   2
      Top             =   1065
      Width           =   1200
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesXMLSourceForm.frx":071D
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      Height          =   195
      Left            =   1920
      TabIndex        =   3
      Top             =   1140
      Width           =   480
   End
End
Attribute VB_Name = "SeriesXMLSourceForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  With SeriesXMLSource1
    .FileName = Label1.Caption
    .Series = TChart1.Series(0)
    
    ' or Series may be passed as Index but you would then
    ' have to set the Chart for the source
    'eg.
    ' .Chart = TChart1
    ' .Series = 0
    
    .SeriesNode = "Series1"
    .ValueSource = "Y"
    .Open
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = App.Path + "\SampleData.xml"
End Sub
