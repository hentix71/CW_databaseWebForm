using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearErrorMessage();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            try
            {
                if (e.Exception != null)
                {
                    // Get the inner exception to handle Oracle errors
                    Exception innerEx = e.Exception;
                    while (innerEx.InnerException != null)
                    {
                        innerEx = innerEx.InnerException;
                    }

                    // Get friendly error message
                    string friendlyMessage = GetFriendlyMessage(innerEx);
                    
                    // Display error message
                    DisplayErrorMessage(friendlyMessage);
                    
                    // Suppress the exception to prevent breaking the page
                    e.ExceptionHandled = true;
                    
                    // Refresh the grid to show current data
                    GridView1.DataBind();
                }
                else
                {
                    // Clear error message on successful insert
                    ClearErrorMessage();
                    
                    // Refresh the grid to show new user
                    GridView1.DataBind();
                    
                    // Reset the form for next entry
                    FormView1.ChangeMode(FormViewMode.Insert);
                    FormView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                DisplayErrorMessage("An unexpected error occurred. Please try again.");
                e.ExceptionHandled = true;
            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            try
            {
                if (e.Exception != null)
                {
                    // Get the inner exception to handle Oracle errors
                    Exception innerEx = e.Exception;
                    while (innerEx.InnerException != null)
                    {
                        innerEx = innerEx.InnerException;
                    }

                    // Get friendly error message
                    string friendlyMessage = GetFriendlyMessage(innerEx);
                    
                    // Display error message
                    DisplayErrorMessage(friendlyMessage);
                    
                    // Suppress the exception
                    e.ExceptionHandled = true;
                    
                    // Refresh the grid
                    GridView1.DataBind();
                }
                else
                {
                    ClearErrorMessage();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                DisplayErrorMessage("An unexpected error occurred during update. Please try again.");
                e.ExceptionHandled = true;
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            try
            {
                if (e.Exception != null)
                {
                    // Get the inner exception to handle Oracle errors
                    Exception innerEx = e.Exception;
                    while (innerEx.InnerException != null)
                    {
                        innerEx = innerEx.InnerException;
                    }

                    // Get friendly error message
                    string friendlyMessage = GetFriendlyMessage(innerEx);
                    
                    // Display error message
                    DisplayErrorMessage(friendlyMessage);
                    
                    // Suppress the exception
                    e.ExceptionHandled = true;
                    
                    // Refresh the grid
                    GridView1.DataBind();
                }
                else
                {
                    ClearErrorMessage();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                DisplayErrorMessage("An unexpected error occurred during delete. Please try again.");
                e.ExceptionHandled = true;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                // Clear error message when user initiates new action
                if (e.CommandName == "Edit" || e.CommandName == "Delete")
                {
                    ClearErrorMessage();
                }
            }
            catch (Exception ex)
            {
                DisplayErrorMessage("An unexpected error occurred. Please try again.");
            }
        }

        /// <summary>
        /// Gets a friendly error message from an Oracle exception
        /// </summary>
        private string GetFriendlyMessage(Exception ex)
        {
            try
            {
                if (ex == null)
                    return "⚠️ An unexpected error occurred. Please try again.";

                string message = ex.Message ?? string.Empty;
                
                // Check if it's an Oracle exception
                if (ex.GetType().Name == "OracleException")
                {
                    // Oracle errors follow pattern: ORA-XXXXX
                    if (message.Contains("ORA-00001") || message.Contains("unique constraint"))
                    {
                        return "⚠️ Duplicate value — this record already exists. Please use a different ID.";
                    }
                    else if (message.Contains("ORA-02291"))
                    {
                        return "⚠️ Related record not found. Check your input values.";
                    }
                    else if (message.Contains("ORA-02292"))
                    {
                        return "⚠️ Cannot delete — other records depend on this user.";
                    }
                    else if (message.Contains("ORA-01400"))
                    {
                        return "⚠️ A required field is missing. Please fill in all fields.";
                    }
                    else if (message.Contains("ORA-12899"))
                    {
                        return "⚠️ A value entered is too long. Please check your input.";
                    }
                    else if (message.Contains("ORA-"))
                    {
                        return "⚠️ Database error occurred. Please try again or contact support.";
                    }
                }
                
                // Handle other database exceptions
                if (message.Contains("duplicate") || message.Contains("unique"))
                {
                    return "⚠️ Duplicate value — this record already exists. Please use a different ID.";
                }
                
                return "⚠️ An unexpected database error occurred. Please try again.";
            }
            catch
            {
                return "⚠️ An unexpected error occurred. Please try again.";
            }
        }

        /// <summary>
        /// Displays an error message in the error label
        /// </summary>
        private void DisplayErrorMessage(string message)
        {
            if (ErrorLabel != null)
            {
                ErrorLabel.Text = message;
                ErrorLabel.Visible = true;
            }
        }

        /// <summary>
        /// Clears the error message from the error label
        /// </summary>
        private void ClearErrorMessage()
        {
            if (ErrorLabel != null)
            {
                ErrorLabel.Text = string.Empty;
                ErrorLabel.Visible = false;
            }
        }
    }
}