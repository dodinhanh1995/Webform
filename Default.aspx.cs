using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropDownListCountry();
            LoadData();
        }
    }

    protected void btnCreateNew_Click(object sender, EventArgs e)
    {
        DateTime birthday;
        if (!DateTime.TryParse(txtBirthday.Text, out birthday))
        {
            Response.Write("<script>alert('Datetime is not valid')</script>");
            return;
        }

        if ((int)DataProvider.ExcuteScalar("SELECT COUNT(*) FROM Customer WHERE Id = '" + txtID.Text.Trim() + "'") > 0)
        {
            Response.Write("<script>alert('The id was existing')</script>");
            return;
        }

        string query = "INSERT INTO Customer VALUES('"
            + txtID.Text + "', N'"
            + txtName.Text + "', '"
            + birthday + "', N'"
            + txtCompanyName.Text + "', '"
            + txtPhoneNumber.Text + "', N'"
            + ddlCountry.SelectedValue + "')";

        if (DataProvider.ExcuteNonQuery(query))
        {
            LoadData();
            txtName.Text = txtID.Text = txtBirthday.Text = txtCompanyName.Text = txtPhoneNumber.Text = string.Empty;
            ddlCountry.SelectedIndex = -1;
            return;
        }

       Response.Write("<script>alert('ERROR: Could not create new customer information')</script>");
    }

    public void LoadDropDownListCountry()
    {
        ddlCountry.DataSource = DataProvider.ExcuteQuery("SELECT * FROM Country");
        ddlCountry.DataValueField = "Id";
        ddlCountry.DataTextField = "Name";
        ddlCountry.DataBind();
    }

    public void LoadData()
    {
        gvCustomer.DataSource = DataProvider.ExcuteQuery("SELECT c.*, ct.Name as CountryName " +
                                                        "FROM Customer as c " + 
                                                        "INNER JOIN Country as ct " +
                                                        "ON c.CountryId = ct.Id");
        gvCustomer.DataBind();
    }

    protected void gvCustomer_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = gvCustomer.DataKeys[e.RowIndex].Value.ToString();
        string name = ((TextBox)gvCustomer.Rows[e.RowIndex].FindControl("txtEditName")).Text;
        string birthday = ((TextBox)gvCustomer.Rows[e.RowIndex].FindControl("txtEditBirthday")).Text;
        string companyName = ((TextBox)gvCustomer.Rows[e.RowIndex].FindControl("txtEditCompanyName")).Text;
        string phoneNumber = ((TextBox)gvCustomer.Rows[e.RowIndex].FindControl("txtEditPhoneNumber")).Text;
        string countryId = ((DropDownList)gvCustomer.Rows[e.RowIndex].FindControl("ddlEditCountry")).SelectedValue;

        string query = "UPDATE Customer SET Name = N'"
            + name + "', Birthday = '"
            + birthday + "', CompanyName = N'"
            + companyName + "', PhoneNumber = '"
            + phoneNumber + "', CountryId = N'"
            + countryId + "'"
            + " WHERE Id = '" + id + "'";

        if (DataProvider.ExcuteNonQuery(query))
        {
            gvCustomer.EditIndex = -1;
            LoadData();
            return;
        }

        Response.Write("<script>alert('ERROR: Could not create new customer information')</script>");
    }

    protected void gvCustomer_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCustomer.EditIndex = e.NewEditIndex;
        LoadData();
    }
    protected void gvCustomer_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCustomer.EditIndex = -1;
        LoadData();
    }

    protected void cbDeleteAll_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }
}