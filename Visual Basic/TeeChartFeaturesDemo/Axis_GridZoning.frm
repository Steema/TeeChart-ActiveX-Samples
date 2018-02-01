VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_GridZoning 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox Check1 
      Caption         =   "&Show custom axes"
      Height          =   285
      Left            =   210
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2115
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Axis_GridZoning.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Axis_GridZoning.frx":239C
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Axis_GridZoning"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
Dim t As Integer
  With TChart1.Axis
   For t = 0 To .CustomCount - 1
     .Custom(t).Visible = Check1.Value
   Next t
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    'Use of elected Partner Axes to limit GridLine zone
    .Axis.Bottom.UsePartnerAxis = True
    .Axis.Bottom.PartnerAxis = .Axis.Custom(0)
    .Axis.Custom(0).UsePartnerAxis = True
    .Axis.Custom(0).PartnerAxis = .Axis.Bottom

    .Axis.Custom(1).UsePartnerAxis = True
    .Axis.Custom(1).PartnerAxis = .Axis.Left

    .Axis.Custom(3).UsePartnerAxis = True
    .Axis.Custom(3).PartnerAxis = .Axis.Custom(2)
    .Axis.Custom(2).UsePartnerAxis = True
    .Axis.Custom(2).PartnerAxis = .Axis.Custom(3)

    .Series(0).FillSampleValues (20)
    .Series(1).FillSampleValues (20)
    .Series(2).FillSampleValues (20)
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
