VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form FunctionOBVForm 
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
      Height          =   5655
      Left            =   120
      TabIndex        =   1
      Top             =   1200
      Width           =   11295
      Base64          =   $"FunctionOBVForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "FunctionOBVForm.frx":05BC
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FunctionOBVForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .AddSeries scCandle
    .AddSeries scVolume
    .AddSeries scLine
    
    ' Sample random Candle and Volume values...
    .Series(0).FillSampleValues 40
    .Series(1).FillSampleValues 40
  
    ' Commented temporary due to VCL bug
    .Series(2).SetFunction tfOBV
    .Series(2).DataSource = TChart1.Series(0)
    ' Prepare OBV function:
    .Series(2).FunctionType.asOBV.Volume = TChart1.Series(1)
    .Series(2).FunctionType.BeginUpdate
    .Series(2).FunctionType.EndUpdate
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
