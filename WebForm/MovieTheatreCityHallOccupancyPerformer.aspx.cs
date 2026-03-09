using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.WebForms
{
    public partial class ComplexWebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Only bind GridView if a movie is selected
                if (MovieSelector.SelectedValue != "")
                {
                    GridView1.DataBind();
                }
            }
        }

        protected void MovieSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind the GridView when movie selection changes
            if (MovieSelector.SelectedValue != "")
            {
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        /// <summary>
        /// Returns the CSS class for occupancy percentage styling
        /// Green for high (>70%), Orange for medium (40-70%), Red for low (<40%)
        /// </summary>
        public string GetOccupancyClass(object occupancyPercentageObj)
        {
            try
            {
                if (occupancyPercentageObj == null || occupancyPercentageObj == DBNull.Value)
                    return "occupancy-low";
                
                decimal occupancyPercentage = Convert.ToDecimal(occupancyPercentageObj);
                
                if (occupancyPercentage > 70)
                    return "occupancy-high";
                else if (occupancyPercentage >= 40)
                    return "occupancy-medium";
                else
                    return "occupancy-low";
            }
            catch
            {
                return "occupancy-low";
            }
        }
    }
}