VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- Connecting Series to ODBC databases programatically"
   ClientHeight    =   4290
   ClientLeft      =   4005
   ClientTop       =   3585
   ClientWidth     =   6675
   LinkTopic       =   "Form1"
   ScaleHeight     =   4290
   ScaleWidth      =   6675
   Begin TeeChart.TChart TChart1 
      Height          =   3555
      Left            =   60
      OleObjectBlob   =   "ODBC Prog Form1.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   6495
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D"
      Height          =   255
      Left            =   4560
      TabIndex        =   4
      Top             =   3900
      Width           =   615
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Add Trends"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2580
      TabIndex        =   3
      Top             =   3840
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   375
      Left            =   5520
      TabIndex        =   2
      Top             =   3840
      Width           =   1035
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Connect to &ODBC"
      Height          =   375
      Left            =   60
      TabIndex        =   1
      Top             =   3840
      Width           =   2115
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Command1_Click()
' in this example, remove existing Series...
 TChart1.RemoveAllSeries
 
' add two Area Series to the Chart...
 TChart1.AddSeries (scArea)
 TChart1.AddSeries (scArea)

' Connect first Area to "high" field in table "stock"...
 With TChart1.Series(0)
   .XValues.DateTime = True
   .XValues.ValueSource = "date"
   .YValues.ValueSource = "high"
   'datasource accepts DSN strings or Recordsets as
   'pointer (see ADO example) or other TChart Series as input
   .DataSource = "DSN=TeeChart Pro Database; TABLE=stock"
 End With
 
' Connect second Area to "low" field in table "stock"...
 With TChart1.Series(1)
   .XValues.DateTime = True
   .XValues.ValueSource = "date"
   .YValues.ValueSource = "low"
   .DataSource = "DSN=TeeChart Pro Database; TABLE=stock"
 End With
  
 Command3.Enabled = True
End Sub

Private Sub Command2_Click()
  End
End Sub

Private Sub Command3_Click()
' add two curves, one connected to "high" field...
  TChart1.AddSeries (scLine)
  With TChart1.Series(2)
    .SetFunction (tfTrend)
    .DataSource = "Series0"
    .Title = "Trend Series0"
  End With

' and the other connected to "low" field...
  TChart1.AddSeries (scLine)
  With TChart1.Series(3)
    .SetFunction (tfTrend)
    .DataSource = "Series1"
    .Title = "Trend Series1"
  End With
  
' and the other average of 2 Candle Series...
  TChart1.AddSeries (scLine)
  With TChart1.Series(4)
    .SetFunction (tfAverage)
    .DataSource = "Series0,Series1"
    .Title = "Average"
  End With
  
  Command3.Enabled = False
End Sub


