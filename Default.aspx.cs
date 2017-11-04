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

   
}