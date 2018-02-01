VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Surface_SmoothingForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"Surface_SmoothingForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "OpenGL"
      Height          =   240
      Left            =   5160
      TabIndex        =   4
      Top             =   1290
      Width           =   1185
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Surface_SmoothingForm.frx":0402
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Smooth Surface x 2"
      Height          =   345
      Left            =   120
      TabIndex        =   1
      Top             =   1230
      Width           =   2145
   End
   Begin VB.Label Label1 
      Caption         =   "Grid size =  5 x 5"
      Height          =   195
      Left            =   2475
      TabIndex        =   3
      Top             =   1290
      Width           =   2265
   End
End
Attribute VB_Name = "Surface_SmoothingForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Aspect.OpenGL.Active = Check1.Value
End Sub

Private Sub Command1_Click()
  With TChart1
    ' Smooth the surface !
    .Series(0).asSurface.SmoothGrid3D
    ' Now re-calculate NumX and NumX to display at Label1.Caption
    .Series(0).asSurface.FillGridIndex 0
    ' Display new grid size at Label1
    Label1.Caption = "Grid size = " + Str(TChart1.Series(0).asSurface.NumXValues) + " x " + _
       Str(.Series(0).asSurface.NumZValues)
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    ' Create a Surface with a small number of cells:
    .Series(0).FillSampleValues (5)  ' 5 x 5 surface grid
    'Remove surface grid lines (they disturb when the surface has lots of cells)
    .Series(0).asSurface.Pen.Visible = False
    ' Some speed tricks:
    .Axis.FastCalc = True  ' speed trick
    .Series(0).asSurface.FastBrush = True ' speed trick (XP,2000 and 2003 only)
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

