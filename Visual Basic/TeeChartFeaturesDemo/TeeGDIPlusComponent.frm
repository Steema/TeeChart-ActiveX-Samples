VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TeeGDIPlusComponent 
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
   Begin VB.CheckBox Check3 
      Caption         =   "Anti-Alias &Text"
      Height          =   285
      Left            =   3645
      TabIndex        =   4
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1410
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&Anti-Alias"
      Height          =   285
      Left            =   2070
      TabIndex        =   3
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1185
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&GDI+ Active"
      Height          =   285
      Left            =   270
      TabIndex        =   2
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1500
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"TeeGDIPlusComponent.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "TeeGDIPlusComponent.frx":2A4C
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "TeeGDIPlusComponent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Aspect.GDIPlus.Active = Check1.Value

  ' Some options for GDI Plus canvas
  TChart1.Aspect.GDIPlus.Antialias = Check1.Value
  TChart1.Aspect.GDIPlus.AntiAliasText = Check2.Value

  
  Check2.Enabled = Check1.Value
  Check3.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Aspect.GDIPlus.Antialias = Check1.Value
End Sub

Private Sub Check3_Click()
  TChart1.Aspect.GDIPlus.AntiAliasText = Check2.Value
End Sub

Private Sub Form_Load()
  Check1_Click
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
