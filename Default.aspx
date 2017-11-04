<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                    <asp:Button ID="btnCreateNew" CssClass="btn btn-default" runat="server" Text="Create New" OnClick="btnCreateNew_Click" ValidationGroup="createNew" />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" />
                </div>
            </div>
        </div>
    </form>


</body>
</html>
