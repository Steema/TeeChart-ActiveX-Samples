VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PageNumToolDemoForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   4230
   ClientTop       =   2790
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   270
      Left            =   3540
      OleObjectBlob   =   "PageNumToolDemoForm.frx":0000
      TabIndex        =   3
      Top             =   990
      Width           =   1740
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"PageNumToolDemoForm.frx":0052
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   5700
      TabIndex        =   6
      Top             =   930
      Width           =   1335
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   720
      TabIndex        =   2
      Text            =   "Page %d of %d"
      Top             =   930
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PageNumToolDemoForm.frx":0ABE
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Page:"
      Height          =   255
      Left            =   2880
      TabIndex        =   5
      Top             =   990
      Width           =   615
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Format:"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   990
      Width           =   555
   End
End
Attribute VB_Name = "PageNumToolDemoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  ChartPageNavigator1.Chart = TChart1

  TChart1.Tools(0).asPageNum.Shape.Font.Color = vbRed
  TChart1.Series(0).FillSampleValues 50
  TChart1.Series(1).FillSampleValues 50
End Sub

Private Sub Text2_Change()
  TChart1.Tools(0).asPageNum.Format = Text2.Text
End Sub
