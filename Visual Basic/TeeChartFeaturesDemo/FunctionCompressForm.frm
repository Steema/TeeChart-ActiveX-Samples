VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FunctionCompressForm 
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
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"FunctionCompressForm.frx":0000
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "FunctionCompressForm.frx":0B40
      Left            =   4530
      List            =   "FunctionCompressForm.frx":0B4D
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1170
      Width           =   1335
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "FunctionCompressForm.frx":0B69
      Left            =   1755
      List            =   "FunctionCompressForm.frx":0B7F
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1170
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "FunctionCompressForm.frx":0BC1
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "View:"
      Height          =   195
      Left            =   4080
      TabIndex        =   4
      Top             =   1230
      Width           =   390
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Compression period:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Width           =   1425
   End
End
Attribute VB_Name = "FunctionCompressForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then ' No Compression
    ' Show original data and hide compression series
    TChart1.Series(0).Active = True
    TChart1.Series(1).Active = False
  Else
    ' Show compression series and hide original data
    TChart1.Series(0).Active = False
    TChart1.Series(1).Active = True

    ' Set compression datetime period:

    With TChart1.Series(1).FunctionType.asCompress
      Select Case Combo1.ListIndex
        Case 1: .Compress = ocWeek
        Case 2: .Compress = ocMonth
        Case 3: .Compress = ocBiMonth
        Case 4: .Compress = ocQuarter
        Case 5: .Compress = ocYear
      End Select
    End With
  End If
End Sub

Private Sub Combo2_Click()
  ' Switch between different display modes
  Select Case Combo2.ListIndex
    Case 0: TChart1.Series(0).asCandle.CandleStyle = csCandleStick
    Case 1: TChart1.Series(0).asCandle.CandleStyle = csCandleBar
    Case 2: TChart1.Series(0).asCandle.CandleStyle = csOpenClose
  End Select

  ' Set compression Series(1) style
  TChart1.Series(1).asCandle.CandleStyle = TChart1.Series(0).asCandle.CandleStyle
End Sub

Private Sub Form_Load()
  ' Example: How to create a Compression function
  TChart1.Series(1).DataSource = TChart1.Series(0)
  TChart1.Series(1).SetFunction (tfCompress)

  ' Sample Candle values
  TChart1.Series(0).FillSampleValues 500

  Combo1.ListIndex = 0
  Combo2.ListIndex = 1
End Sub
