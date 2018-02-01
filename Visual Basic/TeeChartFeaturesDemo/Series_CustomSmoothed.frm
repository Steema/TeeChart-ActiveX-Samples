VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_CustomSmoothed 
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
   Begin VB.OptionButton Option1 
      Caption         =   "&Line series"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   4
      Top             =   1320
      Value           =   -1  'True
      Width           =   1245
   End
   Begin VB.OptionButton Option1 
      Caption         =   "&Area series"
      Height          =   285
      Index           =   1
      Left            =   3330
      TabIndex        =   3
      Top             =   1320
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Smoothed"
      Height          =   285
      Left            =   210
      TabIndex        =   2
      Top             =   1320
      Width           =   1275
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Series_CustomSmoothed.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Series_CustomSmoothed.frx":0F64
      Top             =   0
      Width           =   11730
   End
   Begin VB.Frame Frame1 
      Height          =   555
      Left            =   1890
      TabIndex        =   5
      Top             =   1110
      Width           =   2805
   End
End
Attribute VB_Name = "Series_CustomSmoothed"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Option1.Item(0).Value Then
     TChart1.Series(0).asLine.Smoothed = Check1.Value
  Else
     TChart1.Series(0).asArea.Smoothed = Check1.Value
  End If
End Sub

Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .Legend.Visible = False
    .Header.Font.Color = RGB(255, 255, 255)
    .Header.Caption = "Euribor"
    .Panel.BevelInner = bvNone
    .Panel.BevelOuter = bvNone
    .Panel.Color = clWhite
    .Panel.Gradient.Visible = False
    .Axis.Left.AxisPen.Color = RGB(120, 60, 20)
    .Axis.Left.AxisPen.Width = 4
    .Axis.Left.MinorTicks.Visible = False
    .Axis.Left.GridPen.Color = RGB(245, 225, 170)
    .Axis.Left.GridPen.Style = psSolid
    .Axis.Bottom.AxisPen.Color = RGB(120, 60, 20)
    .Axis.Bottom.GridPen.Visible = False
    .Axis.Bottom.MinorTicks.Visible = False
    .Axis.Bottom.AxisPen.Width = 4
    .Walls.Back.Pen.Visible = False
    .Walls.Back.Gradient.Visible = False
    .Walls.Back.Color = clWhite

    .AddSeries scLine
    .Series(0).Color = RGB(128, 128, 128)
    .Series(0).asLine.Pointer.Style = psCircle
    .Series(0).asLine.Pointer.Visible = True
    .Series(0).asLine.ColorEachLine = False
    .Series(0).asLine.Smoothed = True
  
    .Series(0).FillSampleValues
    
    If .Series(0).asLine.Smoothed Then
      Check1.Value = 1
    Else
      Check1.Value = 0
    End If
  End With
End Sub

Private Sub Option1_Click(Index As Integer)
  If Option1.Item(inex).Value Then
    TChart1.Aspect.View3D = False
    TChart1.RemoveSeries (0)
    
    TChart1.AddSeries scLine
    TChart1.Series(0).Color = RGB(128, 128, 128)
    TChart1.Series(0).asLine.Pointer.Style = psCircle
    TChart1.Series(0).asLine.Pointer.Visible = True
    TChart1.Series(0).asLine.ColorEachLine = False
    TChart1.Series(0).asLine.Smoothed = Check1.Value
  Else
    TChart1.Aspect.View3D = True
    TChart1.RemoveSeries (0)
    
    TChart1.AddSeries scArea
    TChart1.Series(0).Color = RGB(128, 128, 128)
    TChart1.Series(0).asArea.ColorEachLine = False
    TChart1.Series(0).asArea.Smoothed = Check1.Value
    TChart1.Series(0).asArea.AreaPen.Visible = False
  End If
  TChart1.Series(0).FillSampleValues
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
