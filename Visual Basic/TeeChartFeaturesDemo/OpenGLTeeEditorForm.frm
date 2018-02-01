VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form OpenGLTeeEditorForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2520
   ClientTop       =   3270
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"OpenGLTeeEditorForm.frx":0000
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "OpenGLTeeEditorForm.frx":0480
      TabIndex        =   2
      Top             =   480
      Width           =   7035
   End
   Begin VB.CheckBox Check1 
      Caption         =   "OpenGL Editor page active"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1080
      Value           =   1  'Checked
      Width           =   2535
   End
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   6300
      OleObjectBlob   =   "OpenGLTeeEditorForm.frx":04CC
      Top             =   60
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   495
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "OpenGLTeeEditorForm.frx":0528
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "OpenGLTeeEditorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TeeEditor1.ShowPages.OpenGL = Check1.Value
End Sub

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  TeeEditor1.Chart = TChart1
  TeeCommander1.Editor = TeeEditor1
  
  TChart1.Series(0).FillSampleValues 30
End Sub
