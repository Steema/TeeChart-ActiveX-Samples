VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesDepthForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2415
   ClientTop       =   3210
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"SeriesDepthForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   5
      Left            =   2010
      Max             =   0
      Min             =   360
      SmallChange     =   5
      TabIndex        =   4
      Top             =   1350
      Value           =   5
      Width           =   255
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1440
      TabIndex        =   3
      Top             =   1350
      Width           =   555
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Automatic depth"
      Height          =   195
      Left            =   3060
      TabIndex        =   2
      Top             =   1410
      Width           =   1695
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Series depth:"
      Height          =   195
      Left            =   420
      TabIndex        =   5
      Top             =   1380
      Width           =   930
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1275
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "SeriesDepthForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
Dim tmp
  If Check1.Value = 1 Then
    tmp = -1
  Else
    tmp = VScroll1.Value
  End If
  With TChart1
    .Series(0).Depth = tmp
    .Series(1).Depth = tmp
    .Series(2).Depth = tmp
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = "Most Series have a new property to control the size in the Z (Depth) direction. By default, Depth is -1, meaning ""automatic"" depth calculation." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).Depth = 3"
  With TChart1
    .Series(0).FillSampleValues 8
    .Series(1).FillSampleValues 8
    .Series(2).FillSampleValues 8
  End With
  VScroll1_Change
End Sub
Private Sub Text1_Change()
Text1_Validate (True)
End Sub
Private Sub Text1_Validate(Cancel As Boolean)
If Not IsNumeric(Text1.Text) Or val(Text1.Text) > 360 Then
KeepFocus = True
MsgBox "Please insert a number", , "Text1"
Else
With TChart1
.Series(0).Depth = val(Text1.Text)
.Series(1).Depth = val(Text1.Text)
.Series(2).Depth = val(Text1.Text)
End With
VScroll1.Value = val(Text1.Text)
End If
End Sub
Private Sub VScroll1_Change()
VScroll1_Scroll
End Sub
Private Sub VScroll1_Scroll()
Text1.Text = Str$(VScroll1.Value)
Text1_Validate (False)
End Sub
