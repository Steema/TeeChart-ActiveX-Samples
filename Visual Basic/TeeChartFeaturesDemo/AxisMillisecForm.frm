VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisMillisecForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2100
   ClientTop       =   2025
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "AxisMillisecForm.frx":0000
      TabIndex        =   1
      Top             =   690
      Width           =   7035
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5685
      Left            =   0
      TabIndex        =   0
      Top             =   1230
      Width           =   11505
      Base64          =   $"AxisMillisecForm.frx":0066
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      ForeColor       =   &H00000000&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "AxisMillisecForm.frx":0790
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "AxisMillisecForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  MsgBox (CDbl(Now))
End Sub

Private Sub Form_Load()
Dim MilliSecTimeConst As Variant
  TeeCommander1.Chart = TChart1
  ' How do we add Milliseconds in VB ?
  ' Don't know ... therefore we'll put double equivalent in this case
  ' 0 in Windows terms = 30th Dec 1899 midnight
  ' 1 = 1 day
  ' Days to now 14th July 2000 = 36721
  ' 1 Sec = 1/86400
  MilliSecTimeConst = (1 / 86400) / 1000
  With TChart1
    .Series(0).XValues.DateTime = True
    .Axis.Bottom.Labels.DateTimeFormat = "ss.zzz"
    .Axis.Bottom.Labels.Angle = 90
    .Axis.Bottom.Labels.OnAxis = False
    .Series(0).AddXY 36721 + (MilliSecTimeConst * 3), Rnd * 3, "", clTeeColor
    .Series(0).AddXY 36721 + (MilliSecTimeConst * 5), Rnd * 3, "", clTeeColor
    .Series(0).AddXY 36721 + (MilliSecTimeConst * 7), Rnd * 3, "", clTeeColor
    .Series(0).AddXY 36721 + (MilliSecTimeConst * 11), Rnd * 3, "", clTeeColor
  End With
End Sub
