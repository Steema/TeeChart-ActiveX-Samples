VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form DBChartSingleRowForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2220
   ClientTop       =   2160
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   11295
      Base64          =   $"DBChartSingleRowForm.frx":0000
   End
   Begin VB.CommandButton Command4 
      Caption         =   "<<"
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   1080
      Width           =   375
   End
   Begin VB.CommandButton Command3 
      Caption         =   ">>"
      Height          =   375
      Left            =   3840
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
   Begin VB.CommandButton Command1 
      Caption         =   "<"
      Height          =   375
      Left            =   2880
      TabIndex        =   2
      Top             =   1080
      Width           =   375
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "DBChartSingleRowForm.frx":05B4
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "DBChartSingleRowForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim rst

Private Sub Form_Load()
 TChart1.AddSeries scBar
 Set rst = CreateObject("adodb.Recordset")
 
 Set rst = TChart1.Series(0).DataSource
 
 With TChart1
   .Tools.Add tcAnnotate
   .Series(0).Marks.Transparency = 35
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

Private Sub Command1_Click()
  If rst.AbsolutePosition <> 1 Then
    rst.MovePrevious
    TChart1.RefreshData
  End If
  CheckKeys
End Sub

Private Sub Command2_Click()
  If rst.AbsolutePosition <> rst.RecordCount Then
    rst.MoveNext
    TChart1.RefreshData
  End If
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

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
