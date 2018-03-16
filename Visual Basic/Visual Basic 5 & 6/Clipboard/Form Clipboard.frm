VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro Clipboard Example"
   ClientHeight    =   4800
   ClientLeft      =   3345
   ClientTop       =   2430
   ClientWidth     =   6990
   LinkTopic       =   "Form1"
   ScaleHeight     =   4800
   ScaleWidth      =   6990
   Begin TeeChart.TChart TChart1 
      Height          =   3255
      Left            =   60
      OleObjectBlob   =   "Form Clipboard.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   3315
   End
   Begin VB.Frame Frame1 
      Caption         =   "Clipboard &format:"
      Height          =   555
      Left            =   1980
      TabIndex        =   5
      Top             =   4140
      Width           =   2895
      Begin VB.OptionButton OptionMetafile 
         Caption         =   "&Metafile"
         Height          =   255
         Left            =   1500
         TabIndex        =   7
         Top             =   240
         Width           =   1035
      End
      Begin VB.OptionButton OptionBitmap 
         Caption         =   "&Bitmap"
         Height          =   255
         Left            =   180
         TabIndex        =   6
         Top             =   240
         Value           =   -1  'True
         Width           =   975
      End
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Close"
      Height          =   435
      Left            =   5820
      TabIndex        =   4
      Top             =   4320
      Width           =   1095
   End
   Begin VB.CommandButton CommandPaste 
      Caption         =   "2) &Paste Chart from Clipboard"
      Enabled         =   0   'False
      Height          =   435
      Left            =   4020
      TabIndex        =   3
      Top             =   3540
      Width           =   2475
   End
   Begin VB.PictureBox Picture1 
      Height          =   3255
      Left            =   3540
      ScaleHeight     =   3195
      ScaleWidth      =   3315
      TabIndex        =   2
      Top             =   120
      Width           =   3375
   End
   Begin VB.CommandButton CommandCopy 
      Caption         =   "1) &Copy Chart to clipboard..."
      Height          =   435
      Left            =   480
      TabIndex        =   1
      Top             =   3540
      Width           =   2475
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command3_Click()
  End
End Sub

Private Sub CommandCopy_Click()
' Copy !
 If OptionBitmap.Value Then
    TChart1.Export.CopyToClipboardBitmap
 Else
    TChart1.Export.CopyToClipboardMetafile (True)
 End If
 ' enable pasting...
 CommandPaste.Enabled = True
 ' clear picture...
 Picture1 = Nothing
End Sub

Private Sub CommandPaste_Click()
' Paste !
 Picture1 = Clipboard.GetData
End Sub

Private Sub Form_Load()
 TChart1.Series(0).FillSampleValues 6
 TChart1.Series(1).FillSampleValues 6
 TChart1.Series(2).FillSampleValues 6
 TChart1.Series(3).FillSampleValues 6
End Sub


