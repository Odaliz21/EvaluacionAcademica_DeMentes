<%@ Page Title="Mantenimiento de Asignatura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAsignatura.aspx.cs" Inherits="CapaPresentacion1.frmAsignatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card">
            <div class="card-header text-center bg-primary text-white">
                <h2>Mantenimiento de la Tabla Asignatura</h2>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="txtCodAsignatura">Código de Asignatura</label>
                    <asp:TextBox runat="server" ID="txtCodAsignatura" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtNomb_asignatura">Nombre de la Asignatura</label>
                    <asp:TextBox runat="server" ID="txtNomb_asignatura" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtCreditos">Créditos</label>
                    <asp:TextBox runat="server" ID="txtCreditos" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group ">
                    <asp:Button Text="Agregar" runat="server" ID="btnAgregar" CssClass="btn btn-primary m-1" OnClick="btnAgregar_Click" />
                    <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn btn-danger m-1" OnClick="btnEliminar_Click" />
                    <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn btn-success m-1" OnClick="btnActualizar_Click" />
                </div>

                <div class="form-group">
                    <label for="txtNombreBuscar">Buscar por Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombreBuscar" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-warning m-1" />
                    <asp:Button runat="server" ID="BtnVer_todo" Text="Ver toda la lista" OnClick="BtnVer_todo_Click" CssClass="btn btn-info m-1" />
                </div>

                <div class="table-responsive">
                    <asp:GridView runat="server" ID="gvAsignatura" CssClass="table table-striped" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvAsignatura_SelectedIndexChanged"></asp:GridView>
                </div>

                <div class="alert alert-info mt-3" role="alert">
                    <asp:Label Text="" runat="server" ID="lblMensaje"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



