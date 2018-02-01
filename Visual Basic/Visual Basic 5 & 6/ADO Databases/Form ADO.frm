VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- Example of connecting to ADO databases"
   ClientHeight    =   4350
   ClientLeft      =   3705
   ClientTop       =   3120
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   ScaleHeight     =   4350
   ScaleWidth      =   5895
   Begin TeeChart.TChart TChart1 
      Height          =   3615
      Left            =   120
      OleObjectBlob   =   "Form ADO.frx":0000
      TabIndex        =   1
      Top             =   60
      Width           =   5655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   375
      Left            =   4560
      TabIndex        =   2
      Top             =   3840
      Width           =   1155
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Open Database !"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   3840
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
' This example uses Microsoft OLE DB
' ActiveX Data Objects 2.0 Library.

' declare a Connection and RecordSet variables...
Dim Data As New ADODB.Connection
Dim Record As New ADODB.Recordset

  ' Open the sample table and database...
  ' The "TeeChart Pro Database" ODBC DSN is
  ' automatically added when installing TeeChart Pro...
  Data.Open "TeeChart Pro Database"
  Record.Open "employee", Data, 1, 1

  ' Retrieve records....
  TChart1.Series(0).Clear

  TChart1.Series(0).DataSource = Record
  TChart1.Series(0).YValues.ValueSource = Record.Fields(1).Name
  TChart1.Series(0).LabelsSource = Record.Fields(0).Name

  ' release variables...
  Set Record = Nothing
  Set Data = Nothing
End Sub

Private Sub Command2_Click()
  End
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.ShowEditor
End Sub
