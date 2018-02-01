VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "Database Stream"
   ClientHeight    =   7815
   ClientLeft      =   1650
   ClientTop       =   1545
   ClientWidth     =   10065
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   10065
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   1  'Align Top
      Height          =   555
      Left            =   0
      OleObjectBlob   =   "DatabaseStream1.frx":0000
      TabIndex        =   1
      Top             =   0
      Width           =   10065
   End
   Begin TeeChart.TChart TChart2 
      Height          =   2115
      Left            =   180
      OleObjectBlob   =   "DatabaseStream1.frx":004C
      TabIndex        =   2
      Top             =   5340
      Width           =   4635
   End
   Begin TeeChart.TChart TChart3 
      Height          =   1395
      Index           =   0
      Left            =   7980
      OleObjectBlob   =   "DatabaseStream1.frx":00C4
      TabIndex        =   5
      Top             =   1200
      Width           =   1875
   End
   Begin TeeChart.TChart TChart3 
      Height          =   1395
      Index           =   1
      Left            =   7980
      OleObjectBlob   =   "DatabaseStream1.frx":013A
      TabIndex        =   6
      Top             =   2640
      Width           =   1875
   End
   Begin TeeChart.TChart TChart3 
      Height          =   1395
      Index           =   2
      Left            =   7980
      OleObjectBlob   =   "DatabaseStream1.frx":01B1
      TabIndex        =   7
      Top             =   4080
      Width           =   1875
   End
   Begin TeeChart.TChart TChart3 
      Height          =   1395
      Index           =   3
      Left            =   7980
      OleObjectBlob   =   "DatabaseStream1.frx":0228
      TabIndex        =   8
      Top             =   5520
      Width           =   1875
   End
   Begin VB.Frame Frame4 
      Caption         =   "Chart displayer"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   60
      TabIndex        =   15
      Top             =   1800
      Width           =   7755
      Begin TeeChart.TChart TChart1 
         Height          =   2895
         Left            =   120
         OleObjectBlob   =   "DatabaseStream1.frx":029F
         TabIndex        =   16
         Top             =   240
         Width           =   7335
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "START HERE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   60
      TabIndex        =   14
      Top             =   660
      Width           =   7755
      Begin VB.TextBox Text1 
         BackColor       =   &H80000004&
         BorderStyle     =   0  'None
         Height          =   735
         Left            =   60
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   17
         Text            =   "DatabaseStream1.frx":0316
         Top             =   240
         Width           =   7635
      End
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Save TEE file to .mdb"
      Height          =   500
      Left            =   5040
      TabIndex        =   4
      Top             =   6120
      Width           =   2500
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Edit ""Chart maker"" TeeChart"
      Height          =   500
      Left            =   5040
      TabIndex        =   3
      Top             =   5400
      Width           =   2500
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test the TEE file you have made"
      Height          =   500
      Left            =   5040
      TabIndex        =   0
      Top             =   6840
      Width           =   2500
   End
   Begin VB.Frame Frame1 
      Caption         =   "Chart gallery"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6915
      Left            =   7860
      TabIndex        =   9
      Top             =   660
      Width           =   2115
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         Left            =   120
         Max             =   1
         TabIndex        =   12
         Top             =   6360
         Width           =   1875
      End
      Begin VB.Label Label2 
         Caption         =   "<- Page ->"
         Height          =   195
         Left            =   720
         TabIndex        =   13
         Top             =   6660
         Width           =   795
      End
      Begin VB.Label Label1 
         Caption         =   "To select, click on a Chart:"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   300
         Width           =   1935
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Chart maker"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2475
      Left            =   60
      TabIndex        =   11
      Top             =   5100
      Width           =   7755
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Data As New ADODB.Connection
Dim rst As New ADODB.Recordset
Dim recordindex, page As Integer

Private Sub Command1_Click()
   'Import the last TEE file created into the "Chart displayer"
    Dim bData()  As Byte
    rst.MoveLast
    bData = rst!Chart.Value
    TChart1.Import.LoadFromStream (bData)
End Sub

Private Sub Command2_Click()
    'Show the Chart Editor of the "Chart maker"
    TChart2.ShowEditor
End Sub

Private Sub Command3_Click()
    'Add a Chart to the table
    rst.Close
    rst.CursorType = adOpenKeyset
    rst.LockType = adLockOptimistic
    rst.Open "StoreChart", Data, , , adCmdTable
    rst.AddNew
    rst!Chart = TChart2.Export.asNative.SaveToStream(True)
    rst.MoveFirst
    rst.Delete
    rst.Update
    HScroll1.Value = 0
    LoadCharts
End Sub

Private Sub Form_Load()
'Open database and stream TEE files into "Chart gallery"
Dim bData() As Byte
    Data.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" _
               & App.Path & "\DatabaseStream.mdb;Persist Security Info=False"
    rst.Open "select * from StoreChart", Data, 1, 1
    rst.MoveFirst
    TeeCommander1.Chart = TChart1
    LoadCharts
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rst.Close
    Data.Close
End Sub

Private Sub LoadCharts()
'Streams files from Database to "Chart gallery"
Dim i
  rst.MoveFirst
  page = HScroll1.Value
  If page = 0 Then
    rst.Move 4, 0
  End If
  For i = 3 To 0 Step -1
    bData = rst!Chart.Value
    TChart3(i).ClearChart
    TChart3(i).Import.LoadFromStream bData
    TChart3(i).Aspect.Zoom = 90
    rst.MoveNext
  Next i
End Sub

Private Sub HScroll1_Change()
    LoadCharts
End Sub

Private Sub TChart3_OnClick(Index As Integer)
    SetIndex (Index)
End Sub

Private Sub SetIndex(Index As Integer)
'Imports TeeChart TEE "template" from "Chart gallery" to "Chart display"
    rst.MoveFirst
    If page = 0 Then
        rst.Move 4, 0
    End If
    For i = 0 To (3 - Index - 1)
        rst.MoveNext
    Next i
    TChart1.ClearChart
    TChart1.Import.LoadFromStream rst!Chart.Value
End Sub
