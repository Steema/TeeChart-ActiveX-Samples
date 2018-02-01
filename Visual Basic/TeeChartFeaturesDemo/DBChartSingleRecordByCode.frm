VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form DBChartSingleRecordByCode 
   BorderStyle     =   0  'None
   Caption         =   "DBChartSingleRecordByCode"
   ClientHeight    =   6915
   ClientLeft      =   2445
   ClientTop       =   2670
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5415
      Left            =   0
      TabIndex        =   5
      Top             =   1560
      Width           =   11535
      Base64          =   $"DBChartSingleRecordByCode.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "DBChartSingleRecordByCode.frx":058C
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "<"
      Height          =   375
      Left            =   2880
      TabIndex        =   4
      Top             =   1080
      Width           =   375
   End
   Begin VB.CommandButton Command2 
      Caption         =   ">"
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   1080
      Width           =   375
   End
   Begin VB.CommandButton Command3 
      Caption         =   ">>"
      Height          =   375
      Left            =   3840
      TabIndex        =   2
      Top             =   1080
      Width           =   375
   End
   Begin VB.CommandButton Command4 
      Caption         =   "<<"
      Height          =   375
      Left            =   2400
      TabIndex        =   1
      Top             =   1080
      Width           =   375
   End
End
Attribute VB_Name = "DBChartSingleRecordByCode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim rst

Private Sub Command1_Click()
  rst.MovePrevious
  TChart1.RefreshData
  CheckKeys
End Sub

Private Sub Command2_Click()
  rst.MoveNext
  TChart1.RefreshData
  CheckKeys
End Sub

Private Sub Command3_Click()
  rst.MoveLast
  TChart1.RefreshData
  CheckKeys
End Sub

Private Sub Command4_Click()
  rst.MoveFirst
  TChart1.RefreshData
  CheckKeys
End Sub

Private Sub Form_Load()
  Set Conn = CreateObject("ADODB.Connection")
  Set rst = CreateObject("ADODB.Recordset")
  Conn.Open "DSN=TeeChart Pro Database"
  rst.Open "select * from months", Conn, 1, 1
  
     
  With TChart1.Series(0)
    ' ****************************************************************
    ' The DatasourceType line should be run before the Recordset is
    ' applied to the Series. The default is dstAllRecords so this
    ' method only really needs to be called for Single Record charting.
    ' ****************************************************************
    .DatasourceType = dstSingleRecord
    .DataSource = rst
    .YValues.ValueSource = "Jan;Feb;Mar;Apr;May;Jun;Jul;Aug;Sep;Oct;Nov;Dec"
  End With
  
  With TChart1.Tools
    .Add tcAnnotate
    .Items(0).asAnnotation.Position = ppLeftTop
  End With
  
  CheckKeys
End Sub

Private Sub CheckKeys()
  TChart1.Tools.Items(0).asAnnotation.Text = "Year: " & rst!Year
  If rst.AbsolutePosition = 1 Then
     Command4.Enabled = False
     Command1.Enabled = False
     Command2.Enabled = True
     Command3.Enabled = True
  ElseIf rst.AbsolutePosition = rst.RecordCount Then
     Command2.Enabled = False
     Command3.Enabled = False
     Command1.Enabled = True
     Command4.Enabled = True
  Else
     Command4.Enabled = True
     Command1.Enabled = True
     Command2.Enabled = True
     Command3.Enabled = True
  End If
  
End Sub

