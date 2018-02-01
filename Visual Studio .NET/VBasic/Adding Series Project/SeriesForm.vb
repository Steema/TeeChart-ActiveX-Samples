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
	Public WithEvents ComboSeries As System.Windows.Forms.ComboBox
	Public WithEvents Label1 As System.Windows.Forms.Label
	Public WithEvents Frame2 As System.Windows.Forms.GroupBox
	Public WithEvents ComboFunctions As System.Windows.Forms.ComboBox
	Public WithEvents FunctionAdd As System.Windows.Forms.Button
	Public WithEvents HScroll1 As System.Windows.Forms.HScrollBar
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents Label4 As System.Windows.Forms.Label
	Public WithEvents Label5 As System.Windows.Forms.Label
	Public WithEvents Frame1 As System.Windows.Forms.GroupBox
	Public WithEvents Command1 As System.Windows.Forms.Button
	Public WithEvents Label3 As System.Windows.Forms.Label
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.TChart1 = New AxTeeChart.AxTChart()
        Me.Frame2 = New System.Windows.Forms.GroupBox()
        Me.ComboSeries = New System.Windows.Forms.ComboBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Frame1 = New System.Windows.Forms.GroupBox()
        Me.ComboFunctions = New System.Windows.Forms.ComboBox()
        Me.FunctionAdd = New System.Windows.Forms.Button()
        Me.HScroll1 = New System.Windows.Forms.HScrollBar()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Command1 = New System.Windows.Forms.Button()
        Me.Label3 = New System.Windows.Forms.Label()
        CType(Me.TChart1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Frame2.SuspendLayout()
        Me.Frame1.SuspendLayout()
        Me.SuspendLayout()
        '
        'TChart1
        '
        Me.TChart1.Enabled = True
        Me.TChart1.Location = New System.Drawing.Point(0, 39)
        Me.TChart1.Name = "TChart1"
        Me.TChart1.OcxState = CType(resources.GetObject("TChart1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.TChart1.Size = New System.Drawing.Size(481, 327)
        Me.TChart1.TabIndex = 0
        '
        'Frame2
        '
        Me.Frame2.BackColor = System.Drawing.SystemColors.Control
        Me.Frame2.Controls.Add(Me.ComboSeries)
        Me.Frame2.Controls.Add(Me.Label1)
        Me.Frame2.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Frame2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Frame2.Location = New System.Drawing.Point(0, 364)
        Me.Frame2.Name = "Frame2"
        Me.Frame2.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Frame2.Size = New System.Drawing.Size(251, 130)
        Me.Frame2.TabIndex = 10
        Me.Frame2.TabStop = False
        '
        'ComboSeries
        '
        Me.ComboSeries.BackColor = System.Drawing.SystemColors.Window
        Me.ComboSeries.Cursor = System.Windows.Forms.Cursors.Default
        Me.ComboSeries.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ComboSeries.ForeColor = System.Drawing.SystemColors.WindowText
        Me.ComboSeries.Items.AddRange(New Object() {"Line", "Bar", "HorizBar", "Area", "Point", "Pie", "FastLine", "Shape", "Gantt", "Bubble", "Arrow", "Candle", "Polar", "Surface", "Volume", "ErrorBar", "Bezier", "Contour", "Error", "Point3D", "Radar"})
        Me.ComboSeries.Location = New System.Drawing.Point(48, 63)
        Me.ComboSeries.Name = "ComboSeries"
        Me.ComboSeries.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.ComboSeries.Size = New System.Drawing.Size(107, 24)
        Me.ComboSeries.TabIndex = 11
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.Control
        Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label1.Location = New System.Drawing.Point(19, 20)
        Me.Label1.Name = "Label1"
        Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label1.Size = New System.Drawing.Size(150, 29)
        Me.Label1.TabIndex = 12
        Me.Label1.Text = "Pick a Series type to Chart"
        '
        'Frame1
        '
        Me.Frame1.BackColor = System.Drawing.SystemColors.Control
        Me.Frame1.Controls.Add(Me.ComboFunctions)
        Me.Frame1.Controls.Add(Me.FunctionAdd)
        Me.Frame1.Controls.Add(Me.HScroll1)
        Me.Frame1.Controls.Add(Me.Label2)
        Me.Frame1.Controls.Add(Me.Label4)
        Me.Frame1.Controls.Add(Me.Label5)
        Me.Frame1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Frame1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Frame1.Location = New System.Drawing.Point(250, 364)
        Me.Frame1.Name = "Frame1"
        Me.Frame1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Frame1.Size = New System.Drawing.Size(231, 130)
        Me.Frame1.TabIndex = 3
        Me.Frame1.TabStop = False
        '
        'ComboFunctions
        '
        Me.ComboFunctions.BackColor = System.Drawing.SystemColors.Window
        Me.ComboFunctions.Cursor = System.Windows.Forms.Cursors.Default
        Me.ComboFunctions.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ComboFunctions.ForeColor = System.Drawing.SystemColors.WindowText
        Me.ComboFunctions.Items.AddRange(New Object() {"Add", "Subtract", "Multiply", "Divide", "Average", "High", "Low"})
        Me.ComboFunctions.Location = New System.Drawing.Point(12, 42)
        Me.ComboFunctions.Name = "ComboFunctions"
        Me.ComboFunctions.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.ComboFunctions.Size = New System.Drawing.Size(102, 24)
        Me.ComboFunctions.TabIndex = 6
        '
        'FunctionAdd
        '
        Me.FunctionAdd.BackColor = System.Drawing.SystemColors.Control
        Me.FunctionAdd.Cursor = System.Windows.Forms.Cursors.Default
        Me.FunctionAdd.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FunctionAdd.ForeColor = System.Drawing.SystemColors.ControlText
        Me.FunctionAdd.Location = New System.Drawing.Point(121, 42)
        Me.FunctionAdd.Name = "FunctionAdd"
        Me.FunctionAdd.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.FunctionAdd.Size = New System.Drawing.Size(100, 24)
        Me.FunctionAdd.TabIndex = 5
        Me.FunctionAdd.Text = "ShowFunction"
        Me.FunctionAdd.UseVisualStyleBackColor = False
        '
        'HScroll1
        '
        Me.HScroll1.Cursor = System.Windows.Forms.Cursors.Default
        Me.HScroll1.LargeChange = 1
        Me.HScroll1.Location = New System.Drawing.Point(11, 74)
        Me.HScroll1.Maximum = 10
        Me.HScroll1.Name = "HScroll1"
        Me.HScroll1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.HScroll1.Size = New System.Drawing.Size(210, 23)
        Me.HScroll1.TabIndex = 4
        Me.HScroll1.TabStop = True
        Me.HScroll1.Value = 1
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.Control
        Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label2.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label2.Location = New System.Drawing.Point(10, 20)
        Me.Label2.Name = "Label2"
        Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label2.Size = New System.Drawing.Size(145, 19)
        Me.Label2.TabIndex = 9
        Me.Label2.Text = "Add a function"
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.Color.Transparent
        Me.Label4.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label4.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label4.Location = New System.Drawing.Point(12, 105)
        Me.Label4.Name = "Label4"
        Me.Label4.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label4.Size = New System.Drawing.Size(103, 19)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Function Period:"
        '
        'Label5
        '
        Me.Label5.BackColor = System.Drawing.Color.Transparent
        Me.Label5.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label5.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label5.Location = New System.Drawing.Point(134, 103)
        Me.Label5.Name = "Label5"
        Me.Label5.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label5.Size = New System.Drawing.Size(48, 23)
        Me.Label5.TabIndex = 7
        '
        'Command1
        '
        Me.Command1.BackColor = System.Drawing.SystemColors.Control
        Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Command1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Command1.Location = New System.Drawing.Point(0, 500)
        Me.Command1.Name = "Command1"
        Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Command1.Size = New System.Drawing.Size(481, 28)
        Me.Command1.TabIndex = 1
        Me.Command1.Text = "Show Chart Editor"
        Me.Command1.UseVisualStyleBackColor = False
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.SystemColors.Control
        Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label3.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label3.Location = New System.Drawing.Point(10, 2)
        Me.Label3.Name = "Label3"
        Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label3.Size = New System.Drawing.Size(460, 30)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Add / Remove Series and Functions"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(6, 16)
        Me.ClientSize = New System.Drawing.Size(509, 539)
        Me.Controls.Add(Me.TChart1)
        Me.Controls.Add(Me.Frame2)
        Me.Controls.Add(Me.Frame1)
        Me.Controls.Add(Me.Command1)
        Me.Controls.Add(Me.Label3)
        Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Location = New System.Drawing.Point(163, 106)
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "Operations with Series and Functions"
        CType(Me.TChart1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Frame2.ResumeLayout(False)
        Me.Frame1.ResumeLayout(False)
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
	
	
	'UPGRADE_WARNING: Event ComboSeries.SelectedIndexChanged may fire when form is intialized. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub ComboSeries_SelectedIndexChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles ComboSeries.SelectedIndexChanged
		With TChart1
			'Look to see if there's already a Series in the Chart
			'Remove the existing Series
			.RemoveAllSeries()
			'Add and randomly populate the new Series
			'eg. .AddSeries(scHorizBar) is the same as .AddSeries(2)
			.AddSeries(ComboSeries.SelectedIndex)
			.Series(0).FillSampleValues(15)
			'Name the Series to visualise in the Chart Editor.
			.Series(0).Title = VB6.GetItemString(ComboSeries, ComboSeries.SelectedIndex) & "Series"
			'Modify the Chart Title
			'UPGRADE_WARNING: Couldn't resolve default property of object TChart1.Header.Text(). Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			.Header.Text(0) = .Series(0).Title
		End With
	End Sub
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		' show the Editor dialog...
		TChart1.ShowEditor()
	End Sub
	
	Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		' initialize comboboxes...
		ComboSeries.SelectedIndex = 0
		ComboFunctions.SelectedIndex = 0
		HScroll1.Value = 0
	End Sub
	
	Private Sub FunctionAdd_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles FunctionAdd.Click
		With TChart1
			' the function will create a second Series on the
			' Chart. So, remove the second Series each time
			' we click this button...
			If .SeriesCount > 1 Then
				.RemoveSeries((1))
			End If
			
			' add a new Line Series to show the Function...
			.AddSeries(TeeChart.ESeriesClass.scLine)
			
			' set the Function type (Add, Subtract, etc... )
			.Series(1).SetFunction((ComboFunctions.SelectedIndex + 1))
			
			' set the Function Source (the first Series)...
			.Series(1).DataSource = .Series(0).Name
			
			' change the Series title to be the Function name...
			.Series(1).Title = VB6.GetItemString(ComboFunctions, ComboFunctions.SelectedIndex) & "Function"
		End With
		HScroll1.Value = 0
	End Sub
	
	'UPGRADE_NOTE: HScroll1.Change was changed from an event to a procedure. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup2010"'
	'UPGRADE_WARNING: HScrollBar event HScroll1.Change has a new behavior. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup2065"'
	Private Sub HScroll1_Change(ByVal newScrollValue As Integer)
		' Change the Function "Period" property...
		If TChart1.SeriesCount > 1 Then
			TChart1.Series(1).FunctionType.Period = newScrollValue
			Label5.Text = CStr(newScrollValue)
		End If
	End Sub
	Private Sub HScroll1_Scroll(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.ScrollEventArgs) Handles HScroll1.Scroll
		Select Case eventArgs.type
			Case System.Windows.Forms.ScrollEventType.EndScroll
				HScroll1_Change(eventArgs.newValue)
		End Select
	End Sub
End Class