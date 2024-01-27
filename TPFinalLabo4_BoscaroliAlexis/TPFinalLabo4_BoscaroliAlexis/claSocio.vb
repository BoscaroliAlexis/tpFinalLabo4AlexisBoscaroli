Public Class claSocio
    Inherits claPadre

    Public Function devSocioPorNroInt(ByRef ARdataSet As DataSet, ByVal ARnro_int As Integer) As Integer

        Dim intResultado As Integer

        Dim strQuery As String = "SELECT * FROM socio WHERE nro_socio_int =" & ARnro_int & ""

        intResultado = Me.RecuperaDataSet(ARdataSet, strQuery, "socio")

        Return intResultado

    End Function

    Public Function devSocioPorNroSocio(ByRef ARdataSet As DataSet, ByVal ARnroSocio As String) As Integer
        Dim intResultado As Integer

        Dim strQuery As String = "SELECT * , rtrim(apellido) + ' ' + rtrim(nombre) AS apynom FROM socio WHERE nro_socio ='" & ARnroSocio & "'"

        intResultado = Me.RecuperaDataSet(ARdataSet, strQuery, "socio")

        Return intResultado

    End Function

    Public Function devGrupoFamiliar(ByRef ARdataSet As DataSet, ByVal ARnumSocioTitular As String, ByVal ARnumSocio As String) As Integer

        Dim intResultado As Integer

        Dim strQuery As String = "SELECT *, rtrim(apellido) + ' ' + rtrim(nombre) AS apynom FROM socio WHERE nro_socio_titular = '" & ARnumSocioTitular & "' AND nro_socio <> '" & ARnumSocio & "'"

        intResultado = Me.RecuperaDataSet(ARdataSet, strQuery, "grupo")

        Return intResultado

    End Function

    Public Function devSocioPorApellido(ByRef ARdataSet As DataSet, ByVal ARapellido As String) As Integer
        Dim intResultado As Integer

        Dim strQuery As String = "SELECT *, rtrim(apellido) + ' ' + rtrim(nombre) AS apynom FROM socio WHERE apellido LIKE '" & ARapellido & "%' ORDER BY apynom"

        intResultado = Me.RecuperaDataSet(ARdataSet, strQuery, "socios")

        Return intResultado

    End Function

End Class