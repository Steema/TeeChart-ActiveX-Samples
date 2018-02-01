VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_SubSet 
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
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   5550
      Max             =   0
      Min             =   100
      TabIndex        =   9
      Top             =   1200
      Value           =   100
      Width           =   225
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3720
      Max             =   0
      Min             =   100
      TabIndex        =   8
      Top             =   1200
      Width           =   225
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4680
      TabIndex        =   7
      Text            =   "Text3"
      Top             =   1200
      Width           =   855
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2850
      TabIndex        =   6
      Text            =   "Text2"
      Top             =   1200
      Width           =   855
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Function_SubSet.frx":0000
      Left            =   750
      List            =   "Function_SubSet.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1170
      Width           =   945
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Function_SubSet.frx":0014
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Function_SubSet.frx":0B18
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "End:"
      Height          =   195
      Left            =   4320
      TabIndex        =   4
      Top             =   1230
      Width           =   330
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Start:"
      Height          =   195
      Left            =   2430
      TabIndex        =   3
      Top             =   1230
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Values:"
      Height          =   195
      Left            =   150
      TabIndex        =   2
      Top             =   1230
      Width           =   525
   End
End
Attribute VB_Name = "Function_SubSet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  If Combo1.ListIndex = 0 Then
    ' change series type to TBarSeries
    TChart1.ChangeSeriesType 0, scBar
    TChart1.Series(1).MandatoryValueList.ValueSource = X
    Text2.Text = TChart1.Series(0).XValues.Minimum
    VScroll1.Value = TChart1.Series(0).XValues.Minimum
    VScroll1.Min = Round(TChart1.Series(0).XValues.Maximum)
    Text3.Text = TChart1.Series(0).XValues.Maximum
    VScroll2.Value = TChart1.Series(0).XValues.Maximum
    VScroll2.Min = Round(TChart1.Series(0).XValues.Maximum)
  Else
    ' change series type to THorizBarSeries
    TChart1.ChangeSeriesType 0, scHorizBar
    TChart1.Series(1).MandatoryValueList.ValueSource = Y
    Text2.Text = TChart1.Series(0).YValues.Minimum
    VScroll1.Value = TChart1.Series(0).YValues.Minimum
    VScroll1.Min = Round(TChart1.Series(0).YValues.Maximum)
    Text3.Text = TChart1.Series(0).YValues.Maximum
    VScroll2.Value = TChart1.Series(0).YValues.Maximum
    VScroll2.Min = Round(TChart1.Series(0).YValues.Maximum)
  End If
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  TChart1.Series(0).Title = "Values"
  TChart1.Series(1).Title = "Subset"
  
  Combo1.ListIndex = 0
  
  VScroll1.Min = Round(TChart1.Series(0).XValues.Maximum)
  VScroll2.Min = Round(TChart1.Series(0).XValues.Maximum)
  VScroll1.Value = 2
  VScroll2.Value = 4
  Text2.Text = Str(VScroll1.Value)
  Text3.Text = Str(VScroll2.Value)
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
    MsgBox "Please insert a numeric value", , "Start"
  Else
    If (val(Text2.Text) > VScroll1.Min Or val(Text2.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(VScroll1.Min), , "Start"
    Else
      VScroll1.Value = val(Text2.Text)
      TChart1.Series(1).FunctionType.asSubset.StartValue = VScroll1.Value
      TChart1.Series(1).CheckDataSource
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

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "End"
  Else
    If (val(Text3.Text) > VScroll2.Min Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(VScroll2.Min), , "End"
    Else
      VScroll2.Value = val(Text3.Text)
      TChart1.Series(1).FunctionType.asSubset.EndValue = VScroll2.Value
      TChart1.Series(1).CheckDataSource
    End If
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text3_Confirm
End Sub
