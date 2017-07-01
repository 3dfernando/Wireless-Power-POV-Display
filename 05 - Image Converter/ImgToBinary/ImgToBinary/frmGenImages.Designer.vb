<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmGenImages
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.cmdOpen = New System.Windows.Forms.Button()
        Me.OpenFile = New System.Windows.Forms.OpenFileDialog()
        Me.OriginalPic = New System.Windows.Forms.PictureBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Frame = New System.Windows.Forms.GroupBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.txtVarName = New System.Windows.Forms.TextBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.txtCode = New System.Windows.Forms.TextBox()
        Me.chkInvert = New System.Windows.Forms.CheckBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.SensitivityBar = New System.Windows.Forms.TrackBar()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.colorSample = New System.Windows.Forms.PictureBox()
        Me.newPic = New System.Windows.Forms.PictureBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.BackgroundWorker1 = New System.ComponentModel.BackgroundWorker()
        CType(Me.OriginalPic, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Frame.SuspendLayout()
        CType(Me.SensitivityBar, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.colorSample, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.newPic, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'cmdOpen
        '
        Me.cmdOpen.Location = New System.Drawing.Point(392, 19)
        Me.cmdOpen.Name = "cmdOpen"
        Me.cmdOpen.Size = New System.Drawing.Size(103, 26)
        Me.cmdOpen.TabIndex = 0
        Me.cmdOpen.Text = "Open"
        Me.cmdOpen.UseVisualStyleBackColor = True
        '
        'OpenFile
        '
        Me.OpenFile.FileName = "OpenFileDialog1"
        '
        'OriginalPic
        '
        Me.OriginalPic.Location = New System.Drawing.Point(6, 29)
        Me.OriginalPic.Name = "OriginalPic"
        Me.OriginalPic.Size = New System.Drawing.Size(360, 96)
        Me.OriginalPic.TabIndex = 1
        Me.OriginalPic.TabStop = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(6, 13)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(81, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Original Picture:"
        '
        'Frame
        '
        Me.Frame.Controls.Add(Me.Label6)
        Me.Frame.Controls.Add(Me.txtVarName)
        Me.Frame.Controls.Add(Me.Label5)
        Me.Frame.Controls.Add(Me.txtCode)
        Me.Frame.Controls.Add(Me.cmdOpen)
        Me.Frame.Controls.Add(Me.chkInvert)
        Me.Frame.Controls.Add(Me.Label4)
        Me.Frame.Controls.Add(Me.SensitivityBar)
        Me.Frame.Controls.Add(Me.Label3)
        Me.Frame.Controls.Add(Me.colorSample)
        Me.Frame.Controls.Add(Me.newPic)
        Me.Frame.Controls.Add(Me.Label2)
        Me.Frame.Controls.Add(Me.Label1)
        Me.Frame.Controls.Add(Me.OriginalPic)
        Me.Frame.Location = New System.Drawing.Point(12, 12)
        Me.Frame.Name = "Frame"
        Me.Frame.Size = New System.Drawing.Size(509, 497)
        Me.Frame.TabIndex = 3
        Me.Frame.TabStop = False
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(372, 216)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(79, 13)
        Me.Label6.TabIndex = 13
        Me.Label6.Text = "Variable Name:"
        '
        'txtVarName
        '
        Me.txtVarName.Location = New System.Drawing.Point(374, 232)
        Me.txtVarName.Name = "txtVarName"
        Me.txtVarName.Size = New System.Drawing.Size(100, 20)
        Me.txtVarName.TabIndex = 12
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(6, 259)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(80, 13)
        Me.Label5.TabIndex = 11
        Me.Label5.Text = "C Code for PIC:"
        '
        'txtCode
        '
        Me.txtCode.Location = New System.Drawing.Point(10, 277)
        Me.txtCode.Multiline = True
        Me.txtCode.Name = "txtCode"
        Me.txtCode.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtCode.Size = New System.Drawing.Size(485, 205)
        Me.txtCode.TabIndex = 10
        '
        'chkInvert
        '
        Me.chkInvert.AutoSize = True
        Me.chkInvert.Location = New System.Drawing.Point(374, 156)
        Me.chkInvert.Name = "chkInvert"
        Me.chkInvert.Size = New System.Drawing.Size(79, 17)
        Me.chkInvert.TabIndex = 9
        Me.chkInvert.Text = "Invert B/W"
        Me.chkInvert.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(371, 108)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(57, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Sensitivity:"
        '
        'SensitivityBar
        '
        Me.SensitivityBar.Location = New System.Drawing.Point(372, 123)
        Me.SensitivityBar.Maximum = 255
        Me.SensitivityBar.Name = "SensitivityBar"
        Me.SensitivityBar.Size = New System.Drawing.Size(123, 45)
        Me.SensitivityBar.TabIndex = 7
        Me.SensitivityBar.TickStyle = System.Windows.Forms.TickStyle.None
        Me.SensitivityBar.Value = 240
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(371, 56)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(72, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Color Sample:"
        '
        'colorSample
        '
        Me.colorSample.Location = New System.Drawing.Point(374, 72)
        Me.colorSample.Name = "colorSample"
        Me.colorSample.Size = New System.Drawing.Size(121, 33)
        Me.colorSample.TabIndex = 5
        Me.colorSample.TabStop = False
        '
        'newPic
        '
        Me.newPic.Location = New System.Drawing.Point(6, 156)
        Me.newPic.Name = "newPic"
        Me.newPic.Size = New System.Drawing.Size(360, 96)
        Me.newPic.TabIndex = 4
        Me.newPic.TabStop = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(5, 140)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(237, 13)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "New Picture Size (Hardware Limited): 150 x 24px"
        '
        'frmGenImages
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(532, 519)
        Me.Controls.Add(Me.Frame)
        Me.MaximizeBox = False
        Me.Name = "frmGenImages"
        Me.Text = "Image POV Encoder by FZ"
        CType(Me.OriginalPic, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Frame.ResumeLayout(False)
        Me.Frame.PerformLayout()
        CType(Me.SensitivityBar, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.colorSample, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.newPic, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents cmdOpen As Button
    Friend WithEvents OpenFile As OpenFileDialog
    Friend WithEvents OriginalPic As PictureBox
    Friend WithEvents Label1 As Label
    Friend WithEvents Frame As GroupBox
    Friend WithEvents Label2 As Label
    Friend WithEvents newPic As PictureBox
    Friend WithEvents Label3 As Label
    Friend WithEvents colorSample As PictureBox
    Friend WithEvents BackgroundWorker1 As System.ComponentModel.BackgroundWorker
    Friend WithEvents Label4 As Label
    Friend WithEvents SensitivityBar As TrackBar
    Friend WithEvents chkInvert As CheckBox
    Friend WithEvents txtCode As TextBox
    Friend WithEvents Label5 As Label
    Friend WithEvents txtVarName As TextBox
    Friend WithEvents Label6 As Label
End Class
