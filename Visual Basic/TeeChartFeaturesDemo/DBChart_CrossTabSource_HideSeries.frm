VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DBChart_CrossTabSource_HideSeries 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "Edit"
      Height          =   345
      Left            =   7170
      TabIndex        =   8
      Top             =   990
      Width           =   855
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Hide series"
      Height          =   195
      Left            =   5640
      TabIndex        =   7
      Top             =   1050
      Value           =   1  'Checked
      Width           =   1155
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Open table"
      Height          =   195
      Left            =   210
      TabIndex        =   6
      Top             =   1050
      Width           =   1185
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Swap"
      Height          =   345
      Left            =   4500
      TabIndex        =   5
      Top             =   990
      Width           =   825
   End
   Begin VB.Frame Frame1 
      Height          =   495
      Left            =   1860
      TabIndex        =   2
      Top             =   870
      Width           =   2295
      Begin VB.OptionButton Option1 
         Caption         =   "Sum"
         Height          =   195
         Index           =   1
         Left            =   1350
         TabIndex        =   4
         Top             =   210
         Value           =   -1  'True
         Width           =   645
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Count"
         Height          =   195
         Index           =   0
         Left            =   210
         TabIndex        =   3
         Top             =   210
         Width           =   735
      End
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   1
      Top             =   1410
      Width           =   11505
      Base64          =   $"DBChart_CrossTabSource_HideSeries.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "DBChart_CrossTabSource_HideSeries.frx":01F0
      Top             =   0
      Width           =   11490
   End
   Begin TeeChart.CrossTabSource CrossTabSource1 
      Left            =   9480
      OleObjectBlob   =   "DBChart_CrossTabSource_HideSeries.frx":02A6
      Top             =   960
   End
End
Attribute VB_Name = "DBChart_CrossTabSource_HideSeries"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  CrossTabSource1.Active = Check1.Value = 1
  TChart1.RefreshData
End Sub

Private Sub Check2_Click()
  CrossTabSource1.HideSeries = Check2.Value
  TChart1.RefreshData
End Sub

Private Sub Command1_Click()
Dim tmp As String

  With CrossTabSource1
    tmp = .GroupField
    .GroupField = .LabelField
    .LabelField = tmp
    .Active = Check1.Value = 1
  End With
  TChart1.RefreshData
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  With CrossTabSource1
    .DataSet = "DSN=TeeChart Pro Database; SQL=select * from orders"
    .Series = TChart1.Series(0)
    .GroupField = "Terms"
    .LabelField = "PaymType"
    .ValueField = "AmntPaid"
  End With
End Sub

Private Sub Option1_Click(Index As Integer)
  CrossTabSource1.Formula = IIf(Index = 0, gfCount, gfSum)
  CrossTabSource1.Active = Check1.Value = 1
  TChart1.RefreshData
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
