using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.WebForms
{
    public partial class ComplexWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initially show all users' booking records
                GridView1.DataSourceID = "AllUsersTicket";
                GridView1.DataBind();
            }
        }

        protected void UserSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
            // When a user is selected, switch to filtered view
            if (UserSelector.SelectedValue != "")
            {
                GridView1.DataSourceID = "UserTicket";
                GridView1.DataBind();
            }
            else
            {
                // If selection is cleared, show all users
                GridView1.DataSourceID = "AllUsersTicket";
                GridView1.DataBind();
            }
        }
    }
}