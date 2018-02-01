VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LinePatternFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3045
   ClientTop       =   2580
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5025
      Left            =   0
      TabIndex        =   0
      Top             =   1890
      Width           =   11505
      Base64          =   $"LinePatternFormForm.frx":0000
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   240
      Top             =   1140
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Image Image1 
      Height          =   855
      Index           =   2
      Left            =   3300
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image Image1 
      Height          =   855
      Index           =   1
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image Image1 
      Height          =   855
      Index           =   0
      Left            =   1260
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   855
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "LinePatternFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
Dim i
  Label1.Caption = "Small bitmap pictures can be used to fill Line series." _
    & " Click on the Series to load your custom small bitmaps..."
  With TChart1
    For i = 0 To 2
      .Series(i).FillSampleValues 8
      .Series(i).asLine.Brush.LoadImage (App.Path & "\Pattern" & Trim$(Str$(i)) & ".bmp")
      .Series(i).Cursor = -21
      Image1(i).Picture = LoadPicture(App.Path & "\Pattern" & Trim$(Str$(i)) & ".bmp")
    Next i
  End With
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  CommonDialog1.Filter = "Pictures(*.bmp,*.wmf)|*.bmp;*.wmf;"
  CommonDialog1.ShowOpen
  If CommonDialog1.FileName <> "" Then
    TChart1.Series(SeriesIndex).asLine.Brush.LoadImage (CommonDialog1.FileName)
    Image1(SeriesIndex).Picture = LoadPicture(CommonDialog1.FileName)
  End If
  TChart1.StopMouse
End Sub
