VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- JPEG Exporting Example"
   ClientHeight    =   5235
   ClientLeft      =   1740
   ClientTop       =   795
   ClientWidth     =   8550
   LinkTopic       =   "Form1"
   ScaleHeight     =   5235
   ScaleWidth      =   8550
   Begin TeeChart.TChart TChart1 
      Height          =   2955
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4035
      Base64          =   $"Form JPEG.frx":0000
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Show &Editor..."
      Height          =   435
      Left            =   3300
      TabIndex        =   11
      Top             =   4680
      Width           =   1815
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&Gray scale"
      Height          =   315
      Left            =   840
      TabIndex        =   10
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Close"
      Height          =   435
      Left            =   7080
      TabIndex        =   9
      Top             =   4680
      Width           =   1335
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   840
      Max             =   100
      Min             =   5
      TabIndex        =   5
      Top             =   4080
      Value           =   90
      Width           =   2355
   End
   Begin VB.CommandButton Command2 
      Caption         =   "2) &Load JPEG file"
      Enabled         =   0   'False
      Height          =   555
      Left            =   4920
      TabIndex        =   3
      Top             =   3240
      Width           =   2835
   End
   Begin VB.CommandButton Command1 
      Caption         =   "1) &Save Chart to JPEG file"
      Height          =   555
      Left            =   600
      TabIndex        =   2
      Top             =   3240
      Width           =   2835
   End
   Begin VB.PictureBox Picture1 
      Height          =   2955
      Left            =   4200
      ScaleHeight     =   2895
      ScaleWidth      =   4155
      TabIndex        =   1
      Top             =   60
      Width           =   4215
   End
   Begin VB.Label Label4 
      Caption         =   "0 bytes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6240
      TabIndex        =   8
      Top             =   4200
      Width           =   1575
   End
   Begin VB.Label Label3 
      Caption         =   "JPEG file size:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4620
      TabIndex        =   7
      Top             =   4200
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "90%"
      Height          =   255
      Left            =   3300
      TabIndex        =   6
      Top             =   4080
      Width           =   555
   End
   Begin VB.Label Label1 
      Caption         =   "Quality:"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   4080
      Width           =   555
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim Optimize As EJPEGPerformance

  With TChart1.Export.asJPEG
    Picture1 = LoadPicture("")
    .CompressionQuality = HScroll1.Value
    ' save to JPEG file...
    .Width = 280
    .Height = 196
    .GrayScale = Check2.Value
    .SaveToFile App.Path + "\mychart.jpg"
 
    MsgBox "Chart saved to " + App.Path + "\mychart.jpg file ! "
    Label4.Caption = Str$(FileLen(App.Path + "\mychart.jpg")) + " bytes"
    Command2.Enabled = True
  End With
End Sub

Private Sub Command2_Click()
  Picture1.Picture = LoadPicture(App.Path + "\mychart.jpg")
  MsgBox "JPEG image loaded ! "
  Command2.Enabled = False
End Sub

Private Sub Command3_Click()
  End
End Sub

Private Sub Command4_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 200
End Sub

Private Sub HScroll1_Change()
  Label2.Caption = Str$(HScroll1.Value) + "%"
End Sub


