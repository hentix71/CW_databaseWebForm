using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.WebForms
{
    public partial class ComplexWebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load initial data
                GridView1.DataBind();
            }
        }

        protected void TheatreSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind the GridView when theatre selection changes
            if (TheatreSelector.SelectedValue != "")
            {
                GridView1.DataBind();
            }
        }

        protected void Complex2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}