VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisTitleVisibleForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2220
   ClientTop       =   1890
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5865
      Left            =   0
      TabIndex        =   0
      Top             =   1050
      Width           =   11505
      Base64          =   $"AxisTitleVisibleForm.frx":0000
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00C0FFFF&
      Height          =   555
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "AxisTitleVisibleForm.frx":07B2
      Top             =   0
      Width           =   11460
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   3000
      TabIndex        =   2
      Top             =   630
      Width           =   2055
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Axis Title visible"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   690
      Value           =   1  'Checked
      Width           =   1545
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Axis Title text"
      Height          =   195
      Left            =   5160
      TabIndex        =   3
      Top             =   690
      Width           =   930
   End
End
Attribute VB_Name = "AxisTitleVisibleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Axis.Left.Title.Visible = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 15
  Text1.Text = TChart1.Axis.Left.Title.Caption
End Sub

Private Sub Text1_Change()
  TChart1.Axis.Left.Title.Caption = Text1.Text
End Sub
