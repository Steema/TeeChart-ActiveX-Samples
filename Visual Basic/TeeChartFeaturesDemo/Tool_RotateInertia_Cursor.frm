VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form Tool_RotateInertia_Cursor 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_RotateInertia_Cursor.frx":0000
      Left            =   5640
      List            =   "Tool_RotateInertia_Cursor.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   1235
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   3360
      Max             =   100
      TabIndex        =   7
      Top             =   1255
      Width           =   1095
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   255
      Left            =   2400
      Max             =   0
      Min             =   300
      TabIndex        =   5
      Top             =   1255
      Value           =   50
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1920
      TabIndex        =   4
      Text            =   "50"
      Top             =   1255
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   975
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   1
      Top             =   1680
      Width           =   11505
      Base64          =   $"Tool_RotateInertia_Cursor.frx":0022
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   349
      Object.Left            =   0
      Object.Top             =   112
      Object.Visible         =   -1  'True
      Object.Width           =   767
      TimerEnabled    =   0   'False
      TimerInterval   =   1000
      AutoRepaint     =   -1  'True
      Hint            =   ""
      ShowHint        =   0   'False
      CustomChartRect =   0   'False
      Monochrome      =   0   'False
      OriginalCursor  =   0
      BufferedDisplay =   -1  'True
      Language        =   0
      Languaged       =   0
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_RotateInertia_Cursor.frx":17EE
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   195
      Left            =   4560
      TabIndex        =   10
      Top             =   1290
      Width           =   90
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Cursor:"
      Height          =   195
      Left            =   5040
      TabIndex        =   8
      Top             =   1290
      Width           =   495
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Inertia:"
      Height          =   195
      Left            =   2820
      TabIndex        =   6
      Top             =   1290
      Width           =   480
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Speed:"
      Height          =   195
      Left            =   1320
      TabIndex        =   3
      Top             =   1290
      Width           =   510
   End
End
Attribute VB_Name = "Tool_RotateInertia_Cursor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
If Combo1.ListIndex = 0 Then
  TChart1.Tools.Items(0).asRotate.Cursor = 0
Else
  TChart1.Tools.Items(0).asRotate.Cursor = 2020
End If
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcRotate
  
  TChart1.Tools.Items(0).asRotate.Speed = 50
  TChart1.Tools.Items(0).asRotate.Inertia = 0
  
  Combo1.ListIndex = 1
  TChart1.Tools.Items(0).asRotate.Cursor = 2020
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asRotate.Inertia = HScroll1.Value
  Label4.Caption = HScroll1.Value
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Speed"
  Else
    If (val(Text2.Text) > 300 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 300", , "Speed"
    Else
      TChart1.Tools.Items(0).asRotate.Speed = val(Text2.Text)
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
