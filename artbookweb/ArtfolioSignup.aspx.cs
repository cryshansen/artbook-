using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace ArtfolioBook
{
    public partial class ArtfolioSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_Click(object sender, EventArgs e)
        {
            string Image = "profImg.jpg";
            //Here the image is not saved to a directory but the location of the image is saved in the database.
            if (spassword.Text == spasswordCheck.Text)
            {
                string birthdate = sMonth.Text + "/" + sDay.Text + "/" + sYear.Text;
                int UserId = NaitBook.NaitBookController.AddUser(sUname.Text, System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(spassword.Text, "sha1"), sFUname.Text, sLUname.Text, semail.Text, ssex.SelectedValue, birthdate, Image);

                if (UserId != 0)
                {
                    if (IsValidUser(sUname.Text, System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(spassword.Text, "sha1")))
                    {
                        System.Web.Security.FormsAuthentication.RedirectFromLoginPage(sUname.Text, RememberMe.Checked);
                    }
                }
            }
        }
        private bool IsValidUser(string UserLogonId, string UserPassword)
        {
            return NaitBook.NaitBookController.ValidateUser(UserLogonId, UserPassword);
        }
        private DataSet GetNumbers(DataSet NumbersDS, int start, int finish)
        {
            DataTable noTable = NumbersDS.Tables.Add();
            //-- Add columns to the data table

            noTable.Columns.Add("ID", typeof(int));
            noTable.Columns.Add("Value", typeof(string));


            //-- Add rows to the data table
            for (int i = start; i < finish; i++)
            {
                noTable.Rows.Add(i, i.ToString());
            }
            return NumbersDS;
        }
        private DataSet GetMonths(DataSet MonthDS)
        {
            DataTable Months = MonthDS.Tables.Add();
            //-- Add columns to the data table

            Months.Columns.Add("ID", typeof(int));
            Months.Columns.Add("Months", typeof(string));
            //-- Add rows to the data table
            Months.Rows.Add(1, "January");
            Months.Rows.Add(2, "February");
            Months.Rows.Add(3, "March");
            Months.Rows.Add(4, "April");
            Months.Rows.Add(5, "May");
            Months.Rows.Add(6, "June");
            Months.Rows.Add(7, "July");
            Months.Rows.Add(8, "August");
            Months.Rows.Add(9, "September");
            Months.Rows.Add(10, "October");
            Months.Rows.Add(11, "November");
            Months.Rows.Add(12, "December");
            return MonthDS;
        }
    }
}
