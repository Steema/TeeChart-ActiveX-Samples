Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		If m_vb6FormDefInstance Is Nothing Then
			If m_InitializingDefInstance Then
				m_vb6FormDefInstance = Me
			Else
				Try 
					'For the start-up form, the first instance created is the default instance.
					If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
						m_vb6FormDefInstance = Me
					End If
				Catch
				End Try
			End If
		End If
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents TChart1 As AxTeeChart.AxTChart
	Public WithEvents Combo1 As System.Windows.Forms.ComboBox
	Public WithEvents Command2 As System.Windows.Forms.Button
	Public WithEvents HScroll1 As System.Windows.Forms.HScrollBar
	Public WithEvents Check1 As System.Windows.Forms.CheckBox
	Public WithEvents Command1 As System.Windows.Forms.Button
	Public WithEvents Label1 As System.Windows.Forms.Label
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.Combo1 = New System.Windows.Forms.ComboBox()
        Me.TChart1 = New AxTeeChart.AxTChart()
        Me.Command2 = New System.Windows.Forms.Button()
        Me.HScroll1 = New System.Windows.Forms.HScrollBar()
        Me.Check1 = New System.Windows.Forms.CheckBox()
        Me.Command1 = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        CType(Me.TChart1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Combo1
        '
        Me.Combo1.BackColor = System.Drawing.SystemColors.Window
        Me.Combo1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Combo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Combo1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Combo1.ForeColor = System.Drawing.SystemColors.WindowText
        Me.Combo1.Items.AddRange(New Object() {"Rectangle", "Pyramid", "Inv. Pyramid"})
        Me.Combo1.Location = New System.Drawing.Point(248, 300)
        Me.Combo1.Name = "Combo1"
        Me.Combo1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Combo1.Size = New System.Drawing.Size(89, 22)
        Me.Combo1.TabIndex = 6
        Me.ToolTip1.SetToolTip(Me.Combo1, "Choose a Bar style...")
        '
        'TChart1
        '
        Me.TChart1.Enabled = True
        Me.TChart1.Location = New System.Drawing.Point(4, 8)
        Me.TChart1.Name = "TChart1"
        Me.TChart1.OcxState = CType(resources.GetObject("TChart1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.TChart1.Size = New System.Drawing.Size(532, 285)
        Me.TChart1.TabIndex = 0
        '
        'Command2
        '
        Me.Command2.BackColor = System.Drawing.SystemColors.Control
        Me.Command2.Cursor = System.Windows.Forms.Cursors.Default
        Me.Command2.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Command2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Command2.Location = New System.Drawing.Point(368, 300)
        Me.Command2.Name = "Command2"
        Me.Command2.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Command2.Size = New System.Drawing.Size(73, 25)
        Me.Command2.TabIndex = 5
        Me.Command2.Text = "&About..."
        '
        'HScroll1
        '
        Me.HScroll1.Cursor = System.Windows.Forms.Cursors.Default
        Me.HScroll1.LargeChange = 15
        Me.HScroll1.Location = New System.Drawing.Point(136, 304)
        Me.HScroll1.Maximum = 114
        Me.HScroll1.Minimum = 1
        Me.HScroll1.Name = "HScroll1"
        Me.HScroll1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.HScroll1.Size = New System.Drawing.Size(85, 17)
        Me.HScroll1.SmallChange = 5
        Me.HScroll1.TabIndex = 4
        Me.HScroll1.TabStop = True
        Me.HScroll1.Value = 1
        '
        'Check1
        '
        Me.Check1.BackColor = System.Drawing.SystemColors.Control
        Me.Check1.Checked = True
        Me.Check1.CheckState = System.Windows.Forms.CheckState.Checked
        Me.Check1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Check1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Check1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Check1.Location = New System.Drawing.Point(8, 304)
        Me.Check1.Name = "Check1"
        Me.Check1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Check1.Size = New System.Drawing.Size(61, 17)
        Me.Check1.TabIndex = 2
        Me.Check1.Text = "View &3D"
        '
        'Command1
        '
        Me.Command1.BackColor = System.Drawing.SystemColors.Control
        Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Command1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Command1.Location = New System.Drawing.Point(458, 300)
        Me.Command1.Name = "Command1"
        Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Command1.Size = New System.Drawing.Size(77, 25)
        Me.Command1.TabIndex = 1
        Me.Command1.Text = "&Close"
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.Control
        Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label1.Location = New System.Drawing.Point(88, 304)
        Me.Label1.Name = "Label1"
        Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label1.Size = New System.Drawing.Size(40, 17)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "3D %:"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(544, 328)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.TChart1, Me.Combo1, Me.Command2, Me.HScroll1, Me.Check1, Me.Command1, Me.Label1})
        Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Location = New System.Drawing.Point(203, 211)
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "TeeChart Pro -- Dragging points example"
        CType(Me.TChart1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
#End Region 
#Region "Upgrade Support "
	Private Shared m_vb6FormDefInstance As Form1
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As Form1
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New Form1()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
    Dim TheClickedPyramid As Short

    Dim OK_To_Run As Boolean

    Private Sub Check1_CheckStateChanged(ByVal eventSender As System.Object, _
                                         ByVal eventArgs As System.EventArgs) _
                                         Handles Check1.CheckStateChanged
        ' switch 2D / 3D view...
        If OK_To_Run = True Then
            TChart1.Aspect.View3D = Check1.CheckState
        End If
        ' enable scroll-bar only in 3D...
        HScroll1.Enabled = Check1.CheckState
    End Sub

    Private Sub Combo1_SelectedIndexChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Combo1.SelectedIndexChanged
        ' change the bar style when combo1 changes...
        TChart1.Series(0).asBar.BarStyle = Combo1.SelectedIndex
    End Sub

    Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
        End
    End Sub

    Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
        TChart1.AboutBox()
    End Sub

    Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load

        OK_To_Run = False
        ' some sample data for the pyramids...
        TChart1.Series(0).FillSampleValues(8)

        ' change pyramids cursor...
        TChart1.Series(0).Cursor = 2020

        ' do not allow zoom and scroll
        TChart1.Zoom.Enable = False
        TChart1.Scroll.Enable = TeeChart.EChartScroll.pmNone

        ' set temporary variables...
        TheClickedPyramid = -1

        ' set starting scroll-bar position...
        HScroll1.Value = TChart1.Aspect.Chart3DPercent

        ' set starting combo value
        Combo1.SelectedIndex = 1

        'TChart1.Environment.InternalRepaint()
        OK_To_Run = True
    End Sub

    Private Sub HScroll1_Change(ByVal newScrollValue As Integer)
        TChart1.Aspect.Chart3DPercent = newScrollValue
    End Sub

    Private Sub TChart1_OnAfterDraw(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles TChart1.OnAfterDraw
        ' Custom draw a white circle around the clicked pyramid...
        Dim X As Short
        Dim Y As Short
        If TheClickedPyramid <> -1 Then
            With TChart1.Canvas
                .Pen.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
                .Pen.Width = 1
                .Pen.Style = TeeChart.EChartPenStyle.psDot
                .Brush.Style = TeeChart.EBrushStyle.bsClear
            End With
            With TChart1.Series(0)
                X = .CalcXPos(TheClickedPyramid)
                Y = .CalcYPos(TheClickedPyramid)
                TChart1.Canvas.Ellipse(X, Y, X + 40, Y + 40)
            End With
        End If
    End Sub

    Private Sub TChart1_OnMouseDownEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxTeeChart.ITChartEvents_OnMouseDownEvent) Handles TChart1.OnMouseDown
        ' calculate if mouse has clicked a Pyramid...
        TheClickedPyramid = TChart1.Series(0).Clicked(eventArgs.x, eventArgs.y)
    End Sub

    Private Sub TChart1_OnMouseMoveEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxTeeChart.ITChartEvents_OnMouseMoveEvent) Handles TChart1.OnMouseMove
        ' drag the pyramid !!!
        If TheClickedPyramid <> -1 Then
            With TChart1.Series(0)
                .PointValue(TheClickedPyramid) = .YScreenToValue(eventArgs.y)
            End With
        End If
    End Sub

    Private Sub TChart1_OnMouseUpEvent(ByVal eventSender As System.Object, _
                                       ByVal eventArgs As AxTeeChart.ITChartEvents_OnMouseUpEvent) _
                                       Handles TChart1.OnMouseUp
        ' when releasing mouse, stop dragging...
        TheClickedPyramid = -1
        TChart1.Repaint()
    End Sub

    Private Sub HScroll1_Scroll(ByVal eventSender As System.Object, _
                                ByVal eventArgs As System.Windows.Forms.ScrollEventArgs) _
                                Handles HScroll1.Scroll
        Select Case eventArgs.Type
            Case System.Windows.Forms.ScrollEventType.EndScroll
                HScroll1_Change(eventArgs.NewValue)
        End Select
    End Sub

  Private Sub HScroll1_ValueChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles HScroll1.ValueChanged
    TChart1.Aspect.Chart3DPercent = HScroll1.Value
  End Sub
End Class