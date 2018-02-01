VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorGridBitmapForm 
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
      Height          =   4935
      Left            =   0
      TabIndex        =   0
      Top             =   1980
      Width           =   11505
      Base64          =   $"ColorGridBitmapForm.frx":0000
   End
   Begin VB.PictureBox Picture1 
      Height          =   615
      Left            =   7170
      Picture         =   "ColorGridBitmapForm.frx":0180
      ScaleHeight     =   555
      ScaleWidth      =   555
      TabIndex        =   7
      Top             =   1230
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.PictureBox Picture2 
      Height          =   975
      Left            =   5880
      ScaleHeight     =   915
      ScaleWidth      =   1035
      TabIndex        =   6
      Top             =   1440
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Grid..."
      Height          =   345
      Left            =   4425
      TabIndex        =   5
      Top             =   1215
      Width           =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "ColorGridBitmapForm.frx":1050
      Left            =   2160
      List            =   "ColorGridBitmapForm.frx":105D
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1245
      Width           =   2055
   End
   Begin VB.CommandButton Command2 
      Caption         =   "-Zoom"
      Height          =   345
      Left            =   1020
      TabIndex        =   3
      Top             =   1215
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "+Zoom"
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   1215
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorGridBitmapForm.frx":108E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Image Image1 
      Height          =   2085
      Left            =   1890
      Picture         =   "ColorGridBitmapForm.frx":1196
      Stretch         =   -1  'True
      Top             =   360
      Visible         =   0   'False
      Width           =   2925
   End
End
Attribute VB_Name = "ColorGridBitmapForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
Dim i As Integer
TChart1.Environment.InternalRepaint
  If Combo1.ListIndex = 0 Then
    TChart1.Series(0).asColorGrid.Bitmap = Picture1.Picture
  Else
    ' Reset colors to "default" colors
    For i = 0 To TChart1.Series(0).Count - 1
      TChart1.Series(0).PointColor(i) = clTeeColor
    Next i
    TChart1.Series(0).RefreshSeries
    If Combo1.ListIndex = 1 Then
      TChart1.Series(0).asColorGrid.UseColorRange = True
      TChart1.Series(0).asColorGrid.UsePalette = False
    Else
      TChart1.Series(0).asColorGrid.UseColorRange = False
      TChart1.Series(0).asColorGrid.UsePalette = True
    End If
  End If
  TChart1.Repaint
End Sub

Private Sub Command1_Click()
  TChart1.Zoom.ZoomPercent 105
End Sub

Private Sub Command2_Click()
  TChart1.Zoom.ZoomPercent 95
End Sub

Private Sub Command3_Click()
  TChart1.Series(0).asColorGrid.Pen.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.RemoveAllSeries
  TChart1.AddSeries scColorGrid
  TChart1.Series(0).asColorGrid.UsePalette = True
  'TChart1.Series(0).asColorGrid.Bitmap = Picture1.Picture
  Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
