VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro ActiveX Charting Control"
   ClientHeight    =   4710
   ClientLeft      =   2400
   ClientTop       =   2355
   ClientWidth     =   7860
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4710
   ScaleWidth      =   7860
   Begin TeeChart.TChart TChart1 
      Height          =   4650
      Left            =   0
      OleObjectBlob   =   "InteractForm1.frx":0000
      TabIndex        =   0
      Top             =   60
      Width           =   6135
   End
   Begin VB.ListBox List2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1230
      ItemData        =   "InteractForm1.frx":02EC
      Left            =   6240
      List            =   "InteractForm1.frx":0302
      TabIndex        =   7
      Top             =   600
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Draw data"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6240
      TabIndex        =   2
      Top             =   1920
      Width           =   1455
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1230
      ItemData        =   "InteractForm1.frx":0330
      Left            =   7200
      List            =   "InteractForm1.frx":0346
      TabIndex        =   1
      Top             =   600
      Width           =   495
   End
   Begin VB.Label Label8 
      Caption         =   "To update the data table, select the Chart bar and do a mouseclick on the new value (higher or lower) to modify the value"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   6240
      TabIndex        =   11
      Top             =   3120
      Width           =   1455
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "Production"
      Height          =   255
      Left            =   6360
      TabIndex        =   10
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Caption         =   "Quantity"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6960
      TabIndex        =   9
      Top             =   360
      Width           =   735
   End
   Begin VB.Label Label5 
      Caption         =   "Item"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6240
      TabIndex        =   8
      Top             =   360
      Width           =   495
   End
   Begin VB.Label Label4 
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   6840
      TabIndex        =   6
      Top             =   2760
      Width           =   735
   End
   Begin VB.Label Label3 
      Caption         =   "Value:"
      Height          =   255
      Left            =   6240
      TabIndex        =   5
      Top             =   2760
      Width           =   975
   End
   Begin VB.Label Label2 
      ForeColor       =   &H0080FF80&
      Height          =   255
      Left            =   6840
      TabIndex        =   4
      Top             =   2400
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Bar: "
      Height          =   255
      Left            =   6240
      TabIndex        =   3
      Top             =   2400
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
' add data manually...
Dim i As Integer
  TChart1.Scroll.Enable = pmHorizontal
  TChart1.Zoom.Enable = False
  With TChart1.Series(0)
    For i = 0 To List1.ListCount - 1
      .Add List1.List(i), List2.List(i), clTeeColor
    Next i
  End With
  Command1.Enabled = False
End Sub

Private Sub TChart1_OnClickBackground(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)

' if we clicked the chart with left mouse button,
' change the Bar point value...
If CInt(TChart1.Axis.Bottom.CalcPosPoint(X)) > -1 Then
  Select Case Button
  Case 1
    UpdatePoint CInt(TChart1.Axis.Bottom.CalcPosPoint(X)), CInt(TChart1.Axis.Left.CalcPosPoint(Y))
  End Select
End If

End Sub

Private Sub UpdatePoint(Bar, Y As Double)
'refresh both the Series and the ListBox...
  If Bar < TChart1.Series(0).Count Then
    List1.List(Bar) = Trim(Str$(Int(Y)))
    TChart1.Series(0).YValues.Value(Bar) = Int(Y)
  End If
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
' change the Bar value when clicking it...
  UpdatePoint ValueIndex, CInt(TChart1.Axis.Left.CalcPosPoint(Y))
End Sub



Private Sub TChart1_OnMouseDown(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
If CInt(TChart1.Axis.Bottom.CalcPosPoint(X)) > -1 Then
  Select Case Button
  Case 1
   UpdatePoint CInt(TChart1.Axis.Bottom.CalcPosPoint(X)), CInt(TChart1.Axis.Left.CalcPosPoint(Y))
  End Select
End If
End Sub



Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Label2.Caption = List2.List(CInt(TChart1.Axis.Bottom.CalcPosPoint(X)))
  Label4.Caption = CInt(TChart1.Axis.Left.CalcPosPoint(Y))
End Sub


