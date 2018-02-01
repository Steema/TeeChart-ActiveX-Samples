VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PageNavigatorFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   2625
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   315
      Left            =   2040
      OleObjectBlob   =   "PageNavigatorFormForm.frx":0000
      TabIndex        =   2
      Top             =   960
      Width           =   3360
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"PageNavigatorFormForm.frx":0053
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PageNavigatorFormForm.frx":069B
      Top             =   0
      Width           =   11235
   End
   Begin VB.Label Label1 
      Caption         =   "Page:"
      Height          =   255
      Left            =   60
      TabIndex        =   3
      Top             =   1020
      Width           =   1695
   End
End
Attribute VB_Name = "PageNavigatorFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  ChartPageNavigator1.Chart = TChart1
  TChart1.Series(0).FillSampleValues 705
  UpdateLabel
End Sub

Private Sub UpdateLabel()
  With TChart1.Page
    Label1.Caption = "Page " & .Current & " of " & .Count & " pages"
  End With
End Sub

Private Sub TChart1_OnAfterDraw()
  UpdateLabel
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
