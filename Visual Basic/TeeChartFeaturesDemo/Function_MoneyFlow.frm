VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_MoneyFlow 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6825
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6825
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Edit..."
      Height          =   375
      Left            =   1980
      TabIndex        =   3
      Top             =   1755
      Width           =   1140
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Random values"
      Height          =   375
      Left            =   90
      TabIndex        =   2
      Top             =   1755
      Width           =   1860
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4620
      Left            =   0
      TabIndex        =   0
      Top             =   2205
      Width           =   11505
      Base64          =   $"Function_MoneyFlow.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1695
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_MoneyFlow.frx":07D6
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Function_MoneyFlow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Series(0).FillSampleValues (10)
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  With TChart1
   .Series(0).FillSampleValues (10)
   .Series(1).FillSampleValues (10)
   .AddSeries scLine
  
   .Series(2).VerticalAxisCustom = 1 'index 2nd Cust Axis
   
   .Series(2).SetFunction tfMoneyFlow
   .Series(2).DataSource = .Series(0)
   .Series(2).FunctionType.asMoneyFlow.Volume = .Series(1)
   .Series(2).CheckDataSource
   .Series(2).FunctionType.asMoneyFlow.CMFStyle = cmfHistogram
   .Series(2).FunctionType.asMoneyFlow.HistogramPen.Visible = False
  End With
End Sub

