<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master.Master" CodeBehind="frmAdicionales.aspx.vb" Inherits="TPFinalLabo4_BoscaroliAlexis.frmAdicionales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-2">
        <div class="col-12 col-md-6">


            <div class="row">
                <div class="col">
                    <h4>Adicionales</h4>
                </div>
            </div>
            
            <div class="row">
                <div class="col">
                    <h5>
                        <asp:Label ID="lblApeyNomSocio" runat="server" Text=""></asp:Label></h5>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    Numero de Socio
                </div>
                <div class="col-6">
                    
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <asp:TextBox ID="txtNroSocio" AutoCompleteType="Disabled" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                </div>
                <div class="col-3">
                    <asp:Button ID="btBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" />
                </div>
                <div class="col-3">
                    <asp:Button ID="btActualizar" runat="server" CssClass="btn btn-primary" Text="Actualizar" Visible="False" />
                </div>
            </div>

            <div class="row mt-1">
                <div class="col">
                    <asp:GridView ID="gvAdicionalesSocios" CssClass="table table-sm" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Código">
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("cod_adicional") %>' Visible="false"></asp:Label>
                                    <%# Eval("cod_adicional") %>
                                </ItemTemplate>
                            </asp:TemplateField>                            <asp:BoundField DataField="descripcion" HeaderText="Descripción"/>
                            <asp:BoundField DataField="costo_mensual" HeaderText="Costo" DataFormatString="{0:$ #,##0.00}"/>
                            <asp:TemplateField HeaderText="Adh.">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkAdherido" runat="server" Checked='<%# Eval("chkAderido") %>' Enabled="true"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            

        </div>
    </div>

</asp:Content>

