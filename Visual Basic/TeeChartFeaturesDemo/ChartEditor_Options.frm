VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartEditor_Options 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Show &Gallery Custom Size..."
      Height          =   375
      Left            =   4860
      TabIndex        =   26
      Top             =   1935
      Width           =   2220
   End
   Begin VB.Frame Frame4 
      Caption         =   "Gallery Custom Size"
      Height          =   1185
      Left            =   4860
      TabIndex        =   19
      Top             =   630
      Width           =   2220
      Begin VB.VScrollBar UpDown6 
         Height          =   300
         Left            =   1455
         Max             =   1
         Min             =   1000
         TabIndex        =   25
         Top             =   690
         Value           =   400
         Width           =   255
      End
      Begin VB.TextBox EEditorCustGalleryHeight 
         Height          =   285
         Left            =   990
         TabIndex        =   24
         Text            =   "400"
         Top             =   675
         Width           =   435
      End
      Begin VB.VScrollBar UpDown5 
         Height          =   300
         Left            =   1455
         Max             =   1
         Min             =   1000
         TabIndex        =   23
         Top             =   330
         Value           =   600
         Width           =   255
      End
      Begin VB.TextBox EEditorCustGalleryWidth 
         Height          =   285
         Left            =   990
         TabIndex        =   22
         Text            =   "600"
         Top             =   315
         Width           =   435
      End
      Begin VB.Label Label6 
         Caption         =   "&Width:"
         Height          =   195
         Left            =   315
         TabIndex        =   21
         Top             =   360
         Width           =   600
      End
      Begin VB.Label Label5 
         Caption         =   "&Height:"
         Height          =   240
         Left            =   270
         TabIndex        =   20
         Top             =   720
         Width           =   555
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1770
      Left            =   45
      TabIndex        =   3
      Top             =   630
      Width           =   4470
      Begin VB.Frame Frame3 
         Caption         =   "Editor Gallery Size"
         Height          =   1005
         Left            =   2070
         TabIndex        =   6
         Top             =   630
         Width           =   2175
         Begin VB.VScrollBar UpDown4 
            Height          =   300
            Left            =   1500
            Max             =   1
            Min             =   1000
            TabIndex        =   14
            Top             =   600
            Value           =   400
            Width           =   255
         End
         Begin VB.TextBox EEditorGalleryHeight 
            Height          =   285
            Left            =   1035
            TabIndex        =   13
            Text            =   "400"
            Top             =   585
            Width           =   435
         End
         Begin VB.VScrollBar UpDown3 
            Height          =   300
            Left            =   1500
            Max             =   1
            Min             =   1000
            TabIndex        =   12
            Top             =   240
            Value           =   600
            Width           =   255
         End
         Begin VB.TextBox EEditorGalleryWidth 
            Height          =   285
            Left            =   1035
            TabIndex        =   11
            Text            =   "600"
            Top             =   225
            Width           =   435
         End
         Begin VB.Label Label4 
            Caption         =   "&Width:"
            Height          =   195
            Left            =   360
            TabIndex        =   10
            Top             =   270
            Width           =   600
         End
         Begin VB.Label Label3 
            Caption         =   "&Height:"
            Height          =   240
            Left            =   315
            TabIndex        =   9
            Top             =   630
            Width           =   555
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Editor Size"
         Height          =   1005
         Left            =   180
         TabIndex        =   5
         Top             =   630
         Width           =   1725
         Begin VB.VScrollBar UpDown2 
            Height          =   300
            Left            =   1320
            Max             =   1
            Min             =   1000
            TabIndex        =   18
            Top             =   600
            Value           =   400
            Width           =   255
         End
         Begin VB.TextBox EEditorSizeHeight 
            Height          =   285
            Left            =   855
            TabIndex        =   17
            Text            =   "400"
            Top             =   585
            Width           =   435
         End
         Begin VB.VScrollBar UpDown1 
            Height          =   300
            Left            =   1320
            Max             =   1
            Min             =   1000
            TabIndex        =   16
            Top             =   240
            Value           =   600
            Width           =   255
         End
         Begin VB.TextBox EEditorSizeWidth 
            Height          =   285
            Left            =   855
            TabIndex        =   15
            Text            =   "600"
            Top             =   225
            Width           =   435
         End
         Begin VB.Label Label2 
            Caption         =   "&Height:"
            Height          =   240
            Left            =   135
            TabIndex        =   8
            Top             =   630
            Width           =   510
         End
         Begin VB.Label Label1 
            Caption         =   "&Width:"
            Height          =   195
            Left            =   180
            TabIndex        =   7
            Top             =   270
            Width           =   645
         End
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&Show Editor Runtime..."
         Height          =   375
         Left            =   180
         TabIndex        =   4
         Top             =   180
         Width           =   2535
      End
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   555
      Left            =   90
      OleObjectBlob   =   "ChartEditor_Options.frx":0000
      TabIndex        =   2
      Top             =   2430
      Width           =   11400
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   3975
      Left            =   0
      TabIndex        =   0
      Top             =   2940
      Width           =   11505
      Base64          =   $"ChartEditor_Options.frx":004D
      Begin TeeChart.TeeEditor TeeEditor1 
         Left            =   225
         OleObjectBlob   =   "ChartEditor_Options.frx":0F05
         Top             =   3465
      End
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   585
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartEditor_Options.frx":0F61
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "ChartEditor_Options"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TeeEditor1.ShowEditor
End Sub

Private Sub Command2_Click()
  TChart1.CreateNewSeriesGallery UpDown5.Value, UpDown6.Value
End Sub

Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  TeeEditor1.Chart = TChart1
  With TeeEditor1
    .Width = EEditorSizeWidth.Text
    .Height = EEditorSizeHeight.Text
    .GalleryWidth = EEditorGalleryWidth.Text
    .GalleryHeight = EEditorGalleryHeight.Text
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub UpDown1_Scroll()
  EEditorSizeWidth.Text = LTrim$(Str$(UpDown1.Value))
End Sub

Private Sub UpDown1_Change()
 UpDown1_Scroll
End Sub

Private Sub EEditorSizeWidth_Change()
  TeeEditor1.Width = UpDown1.Value
End Sub

Private Sub UpDown2_Scroll()
  EEditorSizeHeight.Text = LTrim$(Str$(UpDown2.Value))
End Sub

Private Sub UpDown2_Change()
 UpDown2_Scroll
End Sub

Private Sub EEditorSizeHeight_Change()
  TeeEditor1.Height = UpDown2.Value
End Sub

Private Sub UpDown3_Scroll()
  EEditorGalleryWidth.Text = LTrim$(Str$(UpDown3.Value))
End Sub

Private Sub UpDown3_Change()
 UpDown3_Scroll
End Sub

Private Sub EEditorGalleryWidth_Change()
  TeeEditor1.GalleryWidth = UpDown3.Value
End Sub

Private Sub UpDown4_Scroll()
  EEditorGalleryHeight.Text = LTrim$(Str$(UpDown4.Value))
End Sub

Private Sub UpDown4_Change()
 UpDown4_Scroll
End Sub

Private Sub EEditorGalleryHeight_Change()
  TeeEditor1.GalleryHeight = UpDown4.Value
End Sub

Private Sub UpDown5_Scroll()
  EEditorCustGalleryWidth.Text = LTrim$(Str$(UpDown5.Value))
End Sub

Private Sub UpDown5_Change()
 UpDown5_Scroll
End Sub

Private Sub EEditorCustGalleryWidth_Change()
  UpDown5.Value = EEditorCustGalleryWidth.Text
End Sub

Private Sub UpDown6_Scroll()
  EEditorCustGalleryHeight.Text = LTrim$(Str$(UpDown6.Value))
End Sub

Private Sub UpDown6_Change()
 UpDown6_Scroll
End Sub

Private Sub EEditorCustGalleryHeight_Change()
 UpDown6.Value = EEditorCustGalleryHeight.Text
End Sub

