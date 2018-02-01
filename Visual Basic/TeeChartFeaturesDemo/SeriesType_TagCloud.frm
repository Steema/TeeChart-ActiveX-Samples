VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form SeriesType_TagCloud 
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
      ItemData        =   "SeriesType_TagCloud.frx":0000
      Left            =   6150
      List            =   "SeriesType_TagCloud.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   1230
      Width           =   1395
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4620
      TabIndex        =   6
      Top             =   1230
      Width           =   1155
   End
   Begin ComctlLib.Slider Slider1 
      Height          =   285
      Left            =   2250
      TabIndex        =   4
      Top             =   1260
      Width           =   1305
      _ExtentX        =   2302
      _ExtentY        =   503
      _Version        =   327682
      Max             =   100
      TickFrequency   =   10
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Font..."
      Height          =   345
      Left            =   210
      TabIndex        =   2
      Top             =   1230
      Width           =   945
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"SeriesType_TagCloud.frx":002B
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "SeriesType_TagCloud.frx":0537
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Filter:"
      Height          =   195
      Left            =   4140
      TabIndex        =   5
      Top             =   1290
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Max. Size:"
      Height          =   195
      Left            =   1440
      TabIndex        =   3
      Top             =   1290
      Width           =   735
   End
End
Attribute VB_Name = "SeriesType_TagCloud"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SelectedTag As Integer

Private Sub Combo1_Change()
  If Combo1.ListIndex = 0 Then
     TChart1.Series(0).asTagCloud.Sort toText, loAscending
  Else
     TChart1.Series(0).asTagCloud.Sort toValue, loDescending
  End If
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).asTagCloud.Font.ShowEditor
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  SelectedTag = -1

'   Some sample values
  TChart1.Series(0).FillSampleValues

'   Add more tags:
  TChart1.Series(0).asTagCloud.AddTag "Hello", 100
  TChart1.Series(0).asTagCloud.AddTag "World", 200
    
  Slider1.Value = TChart1.Series(0).asTagCloud.Font.Size
End Sub

Private Sub UnderLineSelectedTag()
Dim R As TeeRect
  If SelectedTag <> -1 Then
    With TChart1.Canvas.Pen
      .Color = TChart1.Series(0).PointColor(SelectedTag)
      .Width = 2
      .Style = psSolid
      
      TChart1.Cursor = -21
    End With
'    R = TChart1.Series(0).asTagCloud.Positions
'    TChart1.Canvas.DrawLine R.Left, R.Bottom, R.Right, R.Bottom
  Else
    TChart1.Cursor = 0
  End If
End Sub

Private Sub Slider1_Click()
  TChart1.Series(0).asTagCloud.Font.Size = Slider1.Value
End Sub

Private Sub Slider1_Scroll()
  Slider1_Click
End Sub

Private Sub TChart1_OnAfterDraw()
  UnderLineSelectedTag
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  MsgBox "Clicked Tag: " + TChart1.Series(0).ValueMarkText(ValueIndex) + " Value: " + Str$(FormatNumber(TChart1.Series(0).YValues.Value(ValueIndex)))
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim tmp As Integer
  tmp = TChart1.Series(0).clicked(X, Y)
  
  If tmp <> SelectedTag Then
    SelectedTag = tmp
    TChart1.Repaint
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Series(0).asTagCloud.Filter = Text2.Text
End Sub
