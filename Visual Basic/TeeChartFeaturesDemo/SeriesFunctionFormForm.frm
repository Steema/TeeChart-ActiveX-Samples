VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesFunctionFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2970
   ClientTop       =   2100
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart2 
      Align           =   2  'Align Bottom
      Height          =   3225
      Left            =   0
      TabIndex        =   2
      Top             =   3690
      Width           =   11505
      Base64          =   $"SeriesFunctionFormForm.frx":0000
   End
   Begin TeeChart.TChart TChart1 
      Height          =   3105
      Left            =   0
      TabIndex        =   0
      Top             =   540
      Width           =   11460
      Base64          =   $"SeriesFunctionFormForm.frx":04D2
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   555
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesFunctionFormForm.frx":09EA
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesFunctionFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  With TChart1
    .Axis.Left.Labels.Size = 20
    .Series(0).FillSampleValues 50
    .Zoom.Direction = tzdHorizontal
  End With
  With TChart2
    .Axis.Left.Labels.Size = 20
    .Zoom.Enable = False
    .Scroll.Enable = pmNone
    '.ClipPoints = False
    .Series(0).DataSource = TChart1.Series(0)
    .Series(0).CheckDataSource
    .Axis.Left.SetMinMax .Series(0).YValues.Minimum - 3, .Series(0).YValues.Maximum + 3
  End With
  
End Sub

Private Sub TChart1_OnScroll()
  UpdateAxes
End Sub

Private Sub TChart1_OnUndoZoom()
  UpdateAxes
End Sub

Private Sub TChart1_OnZoom()
  UpdateAxes
End Sub

Private Sub UpdateAxes()
  TChart1.Environment.InternalRepaint
  With TChart1.Axis
    TChart2.Axis.Bottom.SetMinMax .Bottom.Minimum, _
                                  .Bottom.Maximum
  End With
End Sub
