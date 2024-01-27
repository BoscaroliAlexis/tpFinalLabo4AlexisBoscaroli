Imports System.Data.SqlClient

Public Class claAdicionales
    Inherits claPadre

    Public Function devAdicionalesPorSocio(ByRef ARdataSet As DataSet, ByVal ARnroSocio As String) As Integer

        Dim intResultado As Integer

        Dim strQuery As String = "select a.descripcion, a.costo_mensual, ams.fecha_ult_modif" &
            " from Adicionales_Mensuales a, Adicionales_Mensuales_Socio ams" &
            " where ams.estado = 'ACT' and a.cod_adicional = ams.cod_adicional and ams.nro_socio = '" & ARnroSocio & "'"

        intResultado = Me.RecuperaDataSet(ARdataSet, strQuery, "adicionales")

        Return intResultado

    End Function

    Public Function devEstadoDeAdicionalesPorNroSocio(ByRef ARdataSet As DataSet, ByVal ARnroSocio As String) As Integer
        Dim intRetorno As Integer

        Dim strQuery As String = "Select am.cod_adicional, am.descripcion, am.costo_mensual," &
        " CASE WHEN ams.estado  = 'ACT' AND ams.nro_socio  = '" & ARnroSocio & "' THEN 'true'" &
        " WHEN ams.estado  = 'BAJ' AND ams.nro_socio  = '" & ARnroSocio & "' THEN 'false'" &
        " Else 'false'" &
        " End As chkAderido," &
        " CASE WHEN ams.estado  = 'ACT' AND ams.nro_socio  = '" & ARnroSocio & "' THEN 'ACT'" &
        " WHEN ams.estado  = 'BAJ' AND ams.nro_socio  = '" & ARnroSocio & "' THEN 'BAJ'" &
        " Else 'NUEVO'" &
        " End As estado" &
        " From Adicionales_Mensuales am" &
        " Left Join Adicionales_Mensuales_Socio ams" &
        " On am.cod_adicional  = ams.cod_adicional And ams.nro_socio  = '" & ARnroSocio & "' "


        intRetorno = Me.RecuperaDataSet(ARdataSet, strQuery, "adicional")

        Return intRetorno

    End Function



    Public Function InsertarNuevoRegistro(ARcodAdicional As String, ARnroSocio As String)

        Dim strQuery As String = "INSERT INTO adicionales_mensuales_socio (cod_adicional, nro_socio, estado, fecha_ult_modif) VALUES (" & ARcodAdicional & ", " & ARnroSocio & ", 'ACT', GETDATE())"

        Dim retorno = Ejecutar(strQuery)

        Return retorno

    End Function



    Public Function ActualizarEstado(ARcodAdicional As String, ARnroSocio As String, ARestado As String)


        Dim strQuery As String = "UPDATE adicionales_mensuales_socio SET estado = '" & ARestado & "' WHERE nro_socio = '" & ARnroSocio & "' AND cod_adicional = '" & ARcodAdicional & "'"
        Dim retorno = Ejecutar(strQuery)

        Return retorno

    End Function



    Public Function ExisteRegistro(ARnroSocio As String, ARcodAdicional As String) As Boolean
        Dim dtsRegistro As New DataSet
        Dim intResultado As Integer

        Dim strQuery As String = "SELECT COUNT(*) FROM adicionales_mensuales_socio WHERE nro_socio = " & ARnroSocio & " AND cod_adicional = " & ARcodAdicional & ""

        intResultado = Me.RecuperaDataSet(dtsRegistro, strQuery, "registro")

        If intResultado = 0 Then
            Return False
        Else
            Return True
        End If

    End Function
End Class
