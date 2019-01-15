//AUTHOR: Kush Shah and Jeff Chien
//COURSE: ISYS 415-501
//FORM: Cart.aspx
//PURPOSE: The purpose of this form is to have the listbox load the quantity of product and its respective price
//INITIALIZE: When initialized, this form will retrieve information from the Order.aspx page that includes the product and quantity and concatenate it onto the listbox.
//INPUT: the information retrieved from the quantity textbox in the order page and the product that was queried.
//PROCESS: The process will be inputting this information into the database so that the customer may search for themselves and see the order inputted.
//OUTPUT: The order is outputted into the databse
//TERMINATE: There is no cleaning that needs to be done
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
    public partial class Cart1 : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();
            if (!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart() //Displays the cart and lists the items in the cart 
        {
            lstCart.Items.Clear();
            CartItem item;
            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
            }
        }


        protected void btnRemove_Click1(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    lblMessage.Text = "Please select the item you want to remove.";
                }
            }
        } //Removes the selection in the listbox

        protected void btnEmpty_Click1(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }
        } // Empty the listbox

        protected void btnCheckOut_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/CheckOut.aspx");
        } //Check out to purchase the pizza
    }
}
