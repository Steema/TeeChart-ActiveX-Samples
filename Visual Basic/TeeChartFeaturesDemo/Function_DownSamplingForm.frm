VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_DownSamplingForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4515
      Left            =   0
      TabIndex        =   0
      Top             =   2400
      Width           =   11505
      Base64          =   $"Function_DownSamplingForm.frx":0000
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   270
      Left            =   1845
      Max             =   1
      Min             =   100
      TabIndex        =   11
      Top             =   2025
      Value           =   4
      Width           =   255
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   1845
      Max             =   1
      Min             =   2000
      TabIndex        =   10
      Top             =   1710
      Value           =   200
      Width           =   255
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Function_DownSamplingForm.frx":0446
      Left            =   3915
      List            =   "Function_DownSamplingForm.frx":0459
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   1710
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Recalculate"
      Height          =   285
      Left            =   2340
      TabIndex        =   7
      Top             =   2070
      Width           =   1590
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   1080
      TabIndex        =   5
      Text            =   "4"
      Top             =   2025
      Width           =   780
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1080
      TabIndex        =   4
      Text            =   "200"
      Top             =   1710
      Width           =   780
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1650
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_DownSamplingForm.frx":0482
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      Caption         =   "Number of Reduced points : "
      Height          =   195
      Left            =   4140
      TabIndex        =   9
      Top             =   2115
      Width           =   2580
   End
   Begin VB.Label Label3 
      Caption         =   "Reduction Method :"
      Height          =   240
      Left            =   2340
      TabIndex        =   6
      Top             =   1755
      Width           =   1545
   End
   Begin VB.Label Label2 
      Caption         =   "Tolerance :"
      Height          =   240
      Left            =   90
      TabIndex        =   3
      Top             =   2070
      Width           =   1005
   End
   Begin VB.Label Label1 
      Caption         =   "Data Points :"
      Height          =   240
      Left            =   90
      TabIndex        =   2
      Top             =   1755
      Width           =   1005
   End
End
Attribute VB_Name = "Function_DownSamplingForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Series(1).FunctionType.asDownSampling.DownSampleMethod = dsDouglas
    Case 1: TChart1.Series(1).FunctionType.asDownSampling.DownSampleMethod = dsMax
    Case 2: TChart1.Series(1).FunctionType.asDownSampling.DownSampleMethod = dsMin
    Case 3: TChart1.Series(1).FunctionType.asDownSampling.DownSampleMethod = dsMinMax
    Case 4: TChart1.Series(1).FunctionType.asDownSampling.DownSampleMethod = dsAverage
  End Select
  Label4.Caption = "Number of reduced points: " & TChart1.Series(1).FunctionType.asDownSampling.ReducedSize
End Sub

Private Sub Command1_Click()
    TChart1.Series(1).CheckDataSource
    Label4.Caption = "Number of reduced points: " & TChart1.Series(1).FunctionType.asDownSampling.ReducedSize
End Sub

Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .AddSeries scPoint
    .Series(0).FillSampleValues (200)
    .Series(0).asPoint.Pointer.VerticalSize = 1
    .Series(0).asPoint.Pointer.HorizontalSize = 1
    .Series(0).asPoint.Pointer.Pen.Visible = False
    .AddSeries scLine
    .Series(1).SetFunction tfDownSampleFun
    .Series(1).FunctionType.asDownSampling.Tolerance = 4
    .Series(1).FunctionType.asDownSampling.DownSampleMethod = dsAverage
    .Series(1).DataSource = TChart1.Series(0)
  End With
  Combo1.ListIndex = 0
  
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
Dim NumPoints As Integer
  NumPoints = Text2.Text
  TChart1.Series(0).FillSampleValues (NumPoints)
  'UpDown1.Position := NumPoints;
  TChart1.Series(1).Clear
  Label4.Caption = ""
End Sub

Private Sub Text3_Change()
  TChart1.Series(1).FunctionType.asDownSampling.Tolerance = Text3.Text
  'UpDown2.Position := Round(DownSampleFun.Tolerance);
  Label4.Caption = "Number of reduced points: " & TChart1.Series(1).FunctionType.asDownSampling.ReducedSize
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

