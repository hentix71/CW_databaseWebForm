using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;
using System;

namespace WebForm.WebForm
{
    public class OracleErrorHelper
    {
        public static string GetFriendlyMessage(Exception ex)
        {
            if (ex is OracleException oraEx)
            {
                switch (oraEx.Number)
                {
                    case 1: return "Duplicate value — this record already exists.";
                    case 2291: return "Related record not found. Check your input.";
                    case 2292: return "Cannot delete — other records depend on this.";
                    case 1400: return "A required field is missing.";
                    case 12899: return "A value entered is too long.";
                    default: return $"Database error (ORA-{oraEx.Number:D5}).";
                }
            }
            return "An unexpected error occurred. Please try again.";
        }
    }
}