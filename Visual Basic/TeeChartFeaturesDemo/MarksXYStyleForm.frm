VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksXYStyleForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2580
   ClientTop       =   2280
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5775
      Left            =   0
      TabIndex        =   0
      Top             =   1140
      Width           =   11505
      Base64          =   $"MarksXYStyleForm.frx":0000
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "MarksXYStyleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  Label1.Caption = "Series Marks can now display the X and Y values for the point." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).Marks.Style=smsXY"
  With TChart1
    .Series(0).FillSampleValues 15
    .Series(0).Marks.Visible = True
    .Series(0).Marks.Style = smsXY
  End With
End Sub
