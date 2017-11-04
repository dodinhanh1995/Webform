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
       
    }

    public void LoadDropDownListCountry()
    {
        ddlCountry.DataSource = DataProvider.ExcuteQuery("SELECT * FROM Country");
        ddlCountry.DataValueField = "Id";
        ddlCountry.DataTextField = "Name";
        ddlCountry.DataBind();
    }
}