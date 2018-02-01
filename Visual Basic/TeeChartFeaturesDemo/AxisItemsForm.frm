VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form AxisItemsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"AxisItemsForm.frx":0000
      ClipPoints      =   -1  'True
      Cursor          =   0
      DragCursor      =   -12
      Object.DragMode        =   0
      Enabled         =   -1  'True
      Object.Height          =   353
      Object.Left            =   0
      Object.Top             =   108
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
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   4920
      TabIndex        =   8
      Top             =   1200
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom labels"
      Height          =   255
      Left            =   135
      TabIndex        =   7
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   270
      Left            =   4410
      Max             =   -100
      Min             =   650
      TabIndex        =   5
      Top             =   1230
      Width           =   255
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   3600
      TabIndex        =   4
      Top             =   1230
      Width           =   810
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   3270
      Max             =   0
      Min             =   3
      TabIndex        =   3
      Top             =   1230
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2715
      TabIndex        =   2
      Top             =   1215
      Width           =   570
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisItemsForm.frx":0800
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Label:"
      Height          =   195
      Left            =   2160
      TabIndex        =   6
      Top             =   1260
      Width           =   435
   End
End
Attribute VB_Name = "AxisItemsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Axis.Left.Labels.Item(val(Text2.Text)).Format.ShowEditorShape
End Sub

Private Sub Check1_Click()
  If Check1.Value = 1 Then
    AddCustomLabels
  Else
    TChart1.Axis.Left.Labels.Clear
  End If
  SetDemoControls
End Sub

Private Sub Form_Load()
Dim v As Variant
  v = Array(200, 0, 123, 300, 260, -100, 650, 400)
  TChart1.Series(0).AddArray 8, v

  AddCustomLabels
  SetDemoControls
End Sub

Private Sub Text2_Change()
  If val(Text2.Text) < 0 Or val(Text2.Text) > 3 Then
    KeepFocus = True
    MsgBox "Please enter label number (0, 1, 2, 3)", , "Label"
  Else
    VScroll1.Value = val(Text2.Text)
    Text3.Text = TChart1.Axis.Left.Labels.Item(val(Text2.Text)).Value
  End If
End Sub

Private Sub Text3_Change()
  If val(Text3.Text) < -100 Or val(Text3.Text) > 650 Then
    KeepFocus = True
    MsgBox "Please enter a numeric value between -100 and 650", , "Value"
    Text3.Text = IIf(val(Text3.Text) < -100, "-100", "650")
  Else
    VScroll2.Value = val(Text3.Text)
    TChart1.Axis.Left.Labels.Item(val(Text2.Text)).Value = val(Text3.Text)
    Text3.SelStart = Len(Text3.Text)
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = LTrim$(Str$(VScroll2.Value))
End Sub

Private Sub AddCustomLabels()
  TChart1.Axis.Left.Labels.Clear
  TChart1.Axis.Left.Labels.Add 123, "Hello"
  TChart1.Axis.Left.Labels.Item(0).Format.Font.Size = 16
    
  TChart1.Axis.Left.Labels.Add 466, "Good" & Chr(13) & "Bye"
  TChart1.Axis.Left.Labels.Item(1).Format.Transparent = False

  TChart1.Axis.Left.Labels.Add 300, ""
  
  TChart1.Axis.Left.Labels.Add -100, ""
  With TChart1.Axis.Left.Labels.Item(3).Format
    .Transparent = False
    .Transparency = 50
    .Color = vbBlue
  End With
  Text2.Text = 0
  Text3.Text = 123
End Sub

Private Sub SetDemoControls()
  VScroll1.Enabled = TChart1.Axis.Left.Labels.Count > 0
  Text2.Enabled = VScroll1.Enabled
  VScroll2.Enabled = VScroll1.Enabled
  Text3.Enabled = VScroll2.Enabled
  Command1.Enabled = VScroll2.Enabled
End Sub
