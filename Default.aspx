<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="content.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="form-createnew">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-2">ID</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtID" runat="server" ValidationGroup="createNew"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ControlToValidate="txtID" Display="Dynamic" Font-Bold="true" ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter id." ValidationGroup="createNew"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-2">Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ValidationGroup="createNew"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ControlToValidate="txtName" Display="Dynamic" Font-Bold="true" ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter name." ValidationGroup="createNew"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-2">Birthday</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtBirthday" runat="server" CssClass="form-control" ValidationGroup="createNew"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ControlToValidate="txtBirthday" Display="Dynamic" Font-Bold="true" ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter birthday." ValidationGroup="createNew"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ControlToValidate="txtBirthday" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid birthday" Font-Bold="True" ForeColor="Red" ValidationExpression="^([012]\d|30|31)/(([1-9])|([0]\d|10|11|12))/((19|20)\d{2})$" Display="Dynamic" ValidationGroup="createNew"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-2">Company Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" ValidationGroup="createNew"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ControlToValidate="txtCompanyName" Display="Dynamic" Font-Bold="true" ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter company name." ValidationGroup="createNew"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-2">Phone Number</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" ValidationGroup="createNew"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ControlToValidate="txtPhoneNumber" Display="Dynamic" Font-Bold="true" ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter phone number." ValidationGroup="createNew"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ControlToValidate="txtPhoneNumber" ID="RegularExpressionValidatorPhoneNumber" runat="server" ErrorMessage="Please enter valid phone number" Font-Bold="True" ForeColor="Red" ValidationExpression="^(0|\+84)\d{9,12}$" Display="Dynamic" ValidationGroup="createNew"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-2">Country</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="ddlCountry" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="col-sm-12">
                <div class="text-center">
                    <asp:LinkButton ID="btnCreateNew" CssClass="btn btn-default" OnClick="btnCreateNew_Click" ValidationGroup="createNew" runat="server"><i class="fa fa-plus"></i> Create New</asp:LinkButton>
                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" OnClick="btnCreateNew_Click" runat="server"><i class="fa fa-trash"></i> Delete</asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <br />
            <asp:GridView ID="gvCustomer" AutoGenerateColumns="False" runat="server" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None" Width="100%" OnRowCancelingEdit="gvCustomer_RowCancelingEdit" OnRowEditing="gvCustomer_RowEditing" OnRowUpdating="gvCustomer_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-sm" CommandName="Update" Text="Cập nhật"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-danger btn-sm" CommandName="Cancel" Text="Hủy bỏ"></asp:LinkButton>
                        </EditItemTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbDeleteAll" runat="server" OnCheckedChanged="cbDeleteAll_CheckedChanged" AutoPostBack="True" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbDeleteId" runat="server" />
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit">
                                <i class="fa fa-edit"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <EditItemTemplate>
                            <asp:Label ForeColor="White" ID="Label2" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="form-control" ID="txtEditName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Brithday">
                        <EditItemTemplate>
                            <asp:TextBox  CssClass="form-control"  ID="txtEditBirthday" runat="server" Text='<%# String.Format("{0:dd/MM/yyyy}", Eval("Birthday")) %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# String.Format("{0:dd/MM/yyyy}", Eval("Birthday")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company Name">
                        <EditItemTemplate>
                            <asp:TextBox  CssClass="form-control" ID="txtEditCompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone Number">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="form-control"  ID="txtEditPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <EditItemTemplate>
                            <asp:DropDownList  CssClass="form-control" ID="ddlEditCountry" runat="server" DataSourceID="SqlDataSourceCountry" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Eval("CountryId") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:MyTestConnectionString %>" SelectCommand="SELECT * FROM [Country]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("CountryName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </form>


</body>
</html>
