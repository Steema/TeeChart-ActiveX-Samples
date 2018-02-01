VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DBChartSpeedForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2850
   ClientTop       =   3285
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5100
      Left            =   0
      TabIndex        =   6
      Top             =   1845
      Width           =   11535
      Base64          =   $"DBChartSpeedForm.frx":0000
   End
   Begin VB.Frame Frame2 
      Height          =   735
      Left            =   60
      TabIndex        =   4
      Top             =   1140
      Width           =   2055
      Begin VB.CommandButton Command2 
         Caption         =   "Editor"
         Height          =   345
         Left            =   180
         TabIndex        =   5
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Load data by code"
      Height          =   735
      Left            =   2160
      TabIndex        =   1
      Top             =   1140
      Width           =   4875
      Begin VB.CommandButton Command3 
         Caption         =   "Set Datasource as string"
         Height          =   345
         Left            =   2460
         TabIndex        =   3
         Top             =   240
         Width           =   2295
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Set Datasource as Recordset"
         Height          =   345
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   2295
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "DBChartSpeedForm.frx":08A8
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "DBChartSpeedForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim FilledRst As Boolean
Dim FilledStr As Boolean

Private Sub Command1_Click()
  With TChart1
    .Series(0).Active = False
    .Series(1).Active = True
    .Series(2).Active = False
    If FilledRst = False Then
      FilledRst = True
      Set Conn = CreateObject("ADODB.Connection")
      Set rst = CreateObject("ADODB.Recordset")
      Conn.Open "DSN=TeeChart Pro Database"
      rst.Open "select * from stock", Conn, 1, 1
      With .Series(1)
        .DataSource = rst
        .asCandle.OpenValues.ValueSource = "Open"
        .asCandle.HighValues.ValueSource = "High"
        .asCandle.LowValues.ValueSource = "Low"
        .asCandle.CloseValues.ValueSource = "Close"
        .LabelsSource = "Date"
      End With
      rst.Close
      Conn.Close
    End If
    'eg.    .Axis.Bottom.Title.Caption = rst.Fields.Items(0).Name
  End With
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor
End Sub

Private Sub Command3_Click()
  With TChart1
    .Series(0).Active = False
    .Series(1).Active = False
    .Series(2).Active = True
    If FilledStr = False Then
      FilledStr = True
      With .Series(2)
        .DataSource = "DSN=TeeChart Pro Database;SQL=select * from stock"
        .asCandle.OpenValues.ValueSource = "OPEN"
        .asCandle.HighValues.ValueSource = "HIGH"
        .asCandle.LowValues.ValueSource = "LOW"
        .asCandle.CloseValues.ValueSource = "CLOSE"
        .LabelsSource = "DATE"
      End With
    End If
    'eg.    .Axis.Bottom.Title.Caption = .Series(0).LabelsSource
  End With
End Sub

Private Sub Form_Load()
  FilledRst = False
  FilledStr = False
End Sub

Private Sub TChart1_OnAfterDraw()
  With TChart1
    With .Canvas.Font
      .Height = 14
      .Bold = True
      .Color = vbYellow
    End With
    .Canvas.Brush.Style = bsClear
    If .Series(0).Active = True Then
      .Canvas.TextOut 100, 50, "Datasource set at design time"
    ElseIf .Series(1).Active = True Then
      .Canvas.TextOut 100, 50, "Datasource set as Recordset"
    ElseIf .Series(2).Active = True Then
      .Canvas.TextOut 100, 50, "Datasource set as ""DSN="" string"
    End If
  End With
End Sub
