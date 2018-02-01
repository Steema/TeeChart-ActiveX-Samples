VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_DepthDateTimeForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5820
      Left            =   0
      TabIndex        =   2
      Top             =   1095
      Width           =   11505
      Base64          =   $"Axis_DepthDateTimeForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Date-time Depth axes"
      Height          =   195
      Left            =   135
      TabIndex        =   1
      Top             =   765
      Value           =   1  'Checked
      Width           =   2805
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Axis_DepthDateTimeForm.frx":06BC
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Axis_DepthDateTimeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
   TChart1.Series(0).asTower.ZValues.DateTime = Check1.Value
End Sub

Private Sub Form_Load()
With TChart1
  .Series(0).XValues.DateTime = True
  .Series(0).asTower.ZValues.DateTime = True
  .Series(0).FillSampleValues (10)
  
  .Axis.Bottom.Labels.DateTimeFormat = "mmm-dd"
  .Axis.Depth.Labels.DateTimeFormat = "mmm-dd"
  .Axis.DepthTop.Labels.DateTimeFormat = "mmm-dd"
  
  .Axis.DepthTop.Visible = True
  .Axis.Depth.Visible = True
End With
End Sub
