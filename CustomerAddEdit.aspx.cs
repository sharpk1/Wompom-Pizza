//AUTHOR: Kush Shah
//COURSE: ISYS 415-501
//FORM: CustomerAddEdit.aspx
//PURPOSE: The purpose of this form is to add and edit customers that already exist
//INITIALIZE: The initializing would retrieve customers from the database
//INPUT: The input is the new information or information that will modify the customers
//PROCESS: The process will include the searching of the customer that will query into the database so it may receive the information about that customer
//OUTPUT: The textboxes and customer gridview serve as outputs 
//TERMINATE: There is no termination involved
//HONOR CODE: “On my honor, as an Aggie, I have neither given
// nor received unauthorized aid on this academic
// work.”
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WompomPizza
{
    public partial class CustomerAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvCustomerDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                dvCustomerDetails.DataBind();
        }

        protected void dvCustomerDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else
                dvCustomerDetails.DataBind();
        }

        protected void dvCustomerDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                dvCustomerDetails.DataBind();
        }

        protected void dvCustomerDetails_PreRender(object sender, EventArgs e)
        {
            dvCustomerDetails.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private string DatabaseErrorMessage(string msg)
        {
            return $"A database error has occurred. Message: {msg}";
        }

        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated this product. Please try again.";
        }
    }
}