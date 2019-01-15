//AUTHOR: Kush Shah and Jeff Chien
//COURSE: ISYS 415-501
//FORM: Order.aspx.cs
//PURPOSE: The purpose of this is to record the order and send it to the shopping cart for confirmation
//INITIALIZE: the dropdown list is loaded with the options for pizza and the quantity is to be recorded
//INPUT: inputted the pizza information into the Dropdown list and quantity 
//PROCESS: the process is that the data that gets retrieved is essentially recorded 
//OUTPUT: Outputted order is sent to the shopping cart in a list box that is concatenated
//TERMINATE: There is no cleaning to be done after this process.
//HONOR CODE: “On my honor, as an Aggie, I have neither given
// nor received unauthorized aid on this academic
// work.”
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WompomPizza
{
    public partial class Order : System.Web.UI.Page
    {
        private Product selectedProduct; //creates instance of a class

        protected void Page_Load(object sender, EventArgs e)
        {
            //bind dropdown on first load; get and show product data on every load   
            if (!IsPostBack) ddlProduct.DataBind();
            selectedProduct = this.GetSelectedProduct();
            lblName.Text = selectedProduct.ProductID;
            lblDescription.Text = selectedProduct.Description;
            //lblLongDescription.Text = selectedProduct.LongDescription;
            lblUnitPrice.Text = selectedProduct.CurrentPrice.ToString("c") + " each"; ;
            ProductImage.ImageUrl = "Images/Products/" + selectedProduct.ProductImage;
        }

        private Product GetSelectedProduct()
        {
            //get row from AccessDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter =
                "ProductID = '" + ddlProduct.SelectedValue + "'";
            DataRowView row = (DataRowView)productsTable[0];

            //create a new product object and load with data from row
            Product p = new Product();
            p.ProductID = row["ProductID"].ToString();
            //p.Name = row["Name"].ToString();
            p.Description = row["Description"].ToString();
            //p.LongDescription = row["LongDescription"].ToString();
            // p.CurrentPrice = (decimal)row["CurrentPrice"];
            //  p.CurrentPrice = (int)row["CurrentPrice"];
            p.CurrentPrice = (decimal)row["CurrentPrice"];

            p.ProductImage = row["ProductImage"].ToString();
            return p;
        }



        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get cart from session and selected item from cart
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                //if item isn’t in cart, add it; otherwise, increase its quantity
                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("Cart.aspx"); //
            }
        }
    }
}