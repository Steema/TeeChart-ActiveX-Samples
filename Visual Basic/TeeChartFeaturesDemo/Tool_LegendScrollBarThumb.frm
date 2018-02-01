VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_LegendScrollBarThumb 
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6510
      Top             =   1170
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   255
      Left            =   6120
      Max             =   0
      Min             =   30000
      TabIndex        =   8
      Top             =   1225
      Value           =   25
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5520
      TabIndex        =   7
      Text            =   "25"
      Top             =   1225
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Browse..."
      Height          =   345
      Left            =   3720
      TabIndex        =   5
      Top             =   1200
      Width           =   1095
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_LegendScrollBarThumb.frx":0000
      Left            =   2040
      List            =   "Tool_LegendScrollBarThumb.frx":0010
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1230
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool_LegendScrollBarThumb.frx":0037
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_LegendScrollBarThumb.frx":0523
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Size:"
      Height          =   195
      Left            =   5040
      TabIndex        =   6
      Top             =   1275
      Width           =   345
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Image:"
      Height          =   195
      Left            =   1440
      TabIndex        =   3
      Top             =   1275
      Width           =   480
   End
End
Attribute VB_Name = "Tool_LegendScrollBarThumb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  TChart1.Tools.Items(0).asLegendScrollBar.Thumb.Style = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Command2_Click()
  CommonDialog1.ShowOpen
  If CommonDialog1.FileName <> "" Then
    TChart1.Tools.Items(0).asLegendScrollBar.Thumb.Image.LoadImage CommonDialog1.FileName
  End If
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcLegendScrollBar
  
  With TChart1.Tools.Items(0).asLegendScrollBar
    .Thumb.Style = stsThumb3
    .Thumb.Size = 25
  End With
  
  Combo1.ListIndex = 3
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
    MsgBox "Please insert a numeric value", , "Size"
  Else
    If (val(Text2.Text) > 30000 Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 30.000", , "Size"
    Else
      TChart1.Tools.Items(0).asLegendScrollBar.ThumbSize = val(Text2.Text)
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

