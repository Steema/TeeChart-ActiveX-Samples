VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Point3DEventForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3000
   ClientTop       =   2955
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   555
      Left            =   0
      OleObjectBlob   =   "Point3DEventForm.frx":0000
      TabIndex        =   2
      Top             =   510
      Width           =   7035
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"Point3DEventForm.frx":0066
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use event"
      Height          =   195
      Left            =   0
      TabIndex        =   3
      Top             =   1170
      Value           =   1  'Checked
      Width           =   2235
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Point 3D series now has an event to supply each point style, color, etc."
      Height          =   495
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Point3DEventForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  With TChart1
    .Series(0).FillSampleValues 20
  End With
End Sub

Private Sub TChart1_OnGetSeriesPointerStyle(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, AStyle As TeeChart.EPointerStyle)
  AStyle = psRectangle
  With TChart1
    If Check1.Value = 1 Then
      Select Case ValueIndex Mod 3
        Case 0: AStyle = psCircle
                .Series(0).asPoint3D.Pointer.Brush.Color = vbRed
        Case 1: AStyle = psTriangle
                .Series(0).asPoint3D.Pointer.Brush.Color = vbBlue
        Case 2: AStyle = psRectangle
                .Series(0).asPoint3D.Pointer.Brush.Color = vbYellow
      End Select
    Else
    AStyle = psRectangle
      .Series(0).asPoint3D.Pointer.Brush.Color = clTeeColor
    End If
  End With
End Sub
