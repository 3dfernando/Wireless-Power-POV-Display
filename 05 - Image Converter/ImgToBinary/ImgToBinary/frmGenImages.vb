Public Class frmGenImages

    Public BitmapOpened As Bitmap
    Public NewBitmap As Bitmap
    Public FinalSize As New Size(150, 24)
    Public PickingColor As Boolean = False

    Public Function ColorDistance(C1 As Color, C2 As Color) As Double
        'Returns the distance, in units, between C1 and C2
        Dim D As Double
        Try
            D = Math.Sqrt((Int(C1.R) - Int(C2.R)) ^ 2 + (Int(C1.G) - Int(C2.G)) ^ 2 + (Int(C1.B) - Int(C2.B)) ^ 2)

        Catch ex As Exception
            Dim A As Integer = 0
        End Try

        Return D
    End Function

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles cmdOpen.Click
        OpenFile.ShowDialog()

        Try
            BitmapOpened = New Bitmap(OpenFile.FileName)
            OriginalPic.Image = New Bitmap(BitmapOpened, OriginalPic.Size)

            'newPic.Image = New Bitmap(BmpToBW(BitmapOpened), newPic.Size)
            colorSample.BackColor = BitmapOpened.GetPixel(0, 0)
            UpdatePictureSample()
            PickingColor = False
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Public Sub UpdatePictureSample()
        'Causes the sample to update
        NewBitmap = BmpToBW(BitmapOpened, colorSample.BackColor, SensitivityBar.Maximum - SensitivityBar.Value, chkInvert.Checked)
        newPic.Image = New Bitmap(NewBitmap, newPic.Size)
        GenerateCode()
    End Sub


    Public Function BmpToBW(oldBmp As Bitmap, baseColor As Color, MaxDist As Integer, Invert As Boolean) As Bitmap
        'This function changes a given bmp to a black-white image, resized.
        Dim newBMP As New Bitmap(oldBmp, FinalSize)
        Dim ColorDiff As Double
        Dim White As Boolean
        For X As Integer = 0 To FinalSize.Width - 1
            For Y As Integer = 0 To FinalSize.Height - 1
                ColorDiff = ColorDistance(newBMP.GetPixel(X, Y), baseColor)

                If ColorDiff > MaxDist Then
                    White = Invert
                Else
                    White = Not Invert
                End If

                If White Then
                    newBMP.SetPixel(X, Y, Color.White)
                Else
                    newBMP.SetPixel(X, Y, Color.Black)
                End If
            Next
        Next

        Return newBMP
    End Function

    Private Sub chkInvert_CheckedChanged(sender As Object, e As EventArgs) Handles chkInvert.CheckedChanged, SensitivityBar.Scroll, txtVarName.TextChanged
        UpdatePictureSample()
    End Sub

    Private Sub OriginalPic_MouseDown(sender As Object, e As MouseEventArgs) Handles OriginalPic.MouseDown
        PickingColor = True
        Me.Cursor = Cursors.Cross
    End Sub

    Private Sub OriginalPic_MouseUp(sender As Object, e As MouseEventArgs) Handles OriginalPic.MouseUp
        PickingColor = False
        Me.Cursor = Cursors.Default
    End Sub

    Private Sub OriginalPic_MouseMove(sender As Object, e As MouseEventArgs) Handles OriginalPic.MouseMove
        If PickingColor Then
            Dim DX As Integer = e.X
            Dim DY As Integer = e.Y

            If DX >= OriginalPic.Width Then DX = OriginalPic.Width - 1
            If DY >= OriginalPic.Height Then DY = OriginalPic.Height - 1
            If DX < 0 Then DX = 0
            If DY < 0 Then DY = 0

            Dim B As Bitmap = CType(OriginalPic.Image, Bitmap)
            Dim C As Color = B.GetPixel(DX, DY)

            colorSample.BackColor = C

            UpdatePictureSample()
        End If


    End Sub

    Public Sub GenerateCode()
        'Generates the code for a MikroC program in a PIC16F877A 

        'Text strings needed afterwards 
        'const char A[]={0x00, 0x11, 0x22};
        Dim TxtDeclare As String = "const char "
        Dim TxtArray As String = "[]={"
        Dim TxtLineEnd As String = "};"

        'Needs to split the image into 4 arrays of bytes, read from right-to-left (that's the way it's spinning)
        'Each array of bytes uses only 6 bits (the least significant ones)
        'The values are stored in hexadecimal (i.e. 0x3F is 6 bright pixels) for each pixel column section

        If Not NewBitmap.Size = FinalSize Then Exit Sub

        Dim W As Integer = FinalSize.Width - 1
        Dim H As Integer = FinalSize.Height - 1
        Dim I As Integer
        Dim ByteArrayA() As Byte
        ReDim ByteArrayA(W)
        Dim ByteArrayB() As Byte
        ReDim ByteArrayB(W)
        Dim ByteArrayC() As Byte
        ReDim ByteArrayC(W)
        Dim ByteArrayD() As Byte
        ReDim ByteArrayD(W)

        For I = 0 To W
            ByteArrayA(I) = CByte((NewBitmap.GetPixel(W - I, H).R = 255) * -1 +
                                (NewBitmap.GetPixel(W - I, H - 1).R = 255) * -2 +
                                (NewBitmap.GetPixel(W - I, H - 2).R = 255) * -4 +
                                (NewBitmap.GetPixel(W - I, H - 3).R = 255) * -8 +
                                (NewBitmap.GetPixel(W - I, H - 4).R = 255) * -16 +
                                (NewBitmap.GetPixel(W - I, H - 5).R = 255) * -32)

            ByteArrayB(I) = CByte((NewBitmap.GetPixel(W - I, H - 6).R = 255) * -1 +
                               (NewBitmap.GetPixel(W - I, H - 7).R = 255) * -2 +
                               (NewBitmap.GetPixel(W - I, H - 8).R = 255) * -4 +
                               (NewBitmap.GetPixel(W - I, H - 9).R = 255) * -8 +
                               (NewBitmap.GetPixel(W - I, H - 10).R = 255) * -16 +
                               (NewBitmap.GetPixel(W - I, H - 11).R = 255) * -32)

            ByteArrayC(I) = CByte((NewBitmap.GetPixel(W - I, H - 12).R = 255) * -1 +
                               (NewBitmap.GetPixel(W - I, H - 13).R = 255) * -2 +
                               (NewBitmap.GetPixel(W - I, H - 14).R = 255) * -4 +
                               (NewBitmap.GetPixel(W - I, H - 15).R = 255) * -8 +
                               (NewBitmap.GetPixel(W - I, H - 16).R = 255) * -16 +
                               (NewBitmap.GetPixel(W - I, H - 17).R = 255) * -32)

            ByteArrayD(I) = CByte((NewBitmap.GetPixel(W - I, H - 18).R = 255) * -1 +
                               (NewBitmap.GetPixel(W - I, H - 19).R = 255) * -2 +
                               (NewBitmap.GetPixel(W - I, H - 20).R = 255) * -4 +
                               (NewBitmap.GetPixel(W - I, H - 21).R = 255) * -8 +
                               (NewBitmap.GetPixel(W - I, H - 22).R = 255) * -16 +
                               (NewBitmap.GetPixel(W - I, H - 23).R = 255) * -32)
        Next

        'Now writes the strings
        Dim StringA As String = ""
        Dim StringB As String = ""
        Dim StringC As String = ""
        Dim StringD As String = ""
        Dim HX As String

        For I = 0 To W
            HX = Hex(ByteArrayA(I))
            If Len(HX) <= 1 Then HX = "0" & HX
            StringA = StringA & "0x" & HX & ","

            HX = Hex(ByteArrayB(I))
            If Len(HX) <= 1 Then HX = "0" & HX
            StringB = StringB & "0x" & HX & ","

            HX = Hex(ByteArrayC(I))
            If Len(HX) <= 1 Then HX = "0" & HX
            StringC = StringC & "0x" & HX & ","

            HX = Hex(ByteArrayD(I))
            If Len(HX) <= 1 Then HX = "0" & HX
            StringD = StringD & "0x" & HX & ","
        Next
        'Removes the comma
        StringA = Strings.Left(StringA, Len(StringA) - 1)
        StringB = Strings.Left(StringB, Len(StringB) - 1)
        StringC = Strings.Left(StringC, Len(StringC) - 1)
        StringD = Strings.Left(StringD, Len(StringD) - 1)

        'Composes the text for C code
        StringA = TxtDeclare & txtVarName.Text & "A" & TxtArray & StringA & TxtLineEnd
        StringB = TxtDeclare & txtVarName.Text & "B" & TxtArray & StringB & TxtLineEnd
        StringC = TxtDeclare & txtVarName.Text & "C" & TxtArray & StringC & TxtLineEnd
        StringD = TxtDeclare & txtVarName.Text & "D" & TxtArray & StringD & TxtLineEnd

        txtCode.Text = ""
        txtCode.Text = StringD & vbCrLf & StringC & vbCrLf & StringB & vbCrLf & StringA

    End Sub

End Class
