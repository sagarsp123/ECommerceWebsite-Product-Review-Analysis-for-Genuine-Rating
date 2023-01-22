using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    protected static DataTable dt;
    protected static DataTable dt1;
    protected static bool flag;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["uid"]== null)
            {
               Response.Redirect("userlogin.aspx");
            }
            else
            {
                using (SqlCommand cmd1 = new SqlCommand("select cd.cart_id,cd.uid,cd.product_id,cd.quantity,cd.price,pm.product_id,pm.name,'Admin/'+pm.image as image,(cd.quantity*cd.price) as Total_amount from cart_details cd inner join product_master pm on cd.product_id=pm.product_id where cd.uid=@cd", conn))
                {
                    cmd1.Parameters.AddWithValue("@cd", Convert.ToInt32(Session["uid"].ToString()));
                    dt1 = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
                    {
                        sda.Fill(dt1);
                    }
                    if (dt1.Rows.Count > 0)
                    {
                        flag = true;
                    }
                    //string b = dt1.Rows[0]["name"].ToString();

                }
            }
        }
    }
    protected void btnbuy_Click(object sender, EventArgs e)
    {

        using (SqlCommand cmd = new SqlCommand("select uid,product_id,quantity,price,(quantity*price) as total_amount from cart_details where uid=@uid", conn))
        {
            using (SqlDataAdapter sda=new SqlDataAdapter(cmd))
            {
                cmd.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                DataTable dt=new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count>0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        int productid = Convert.ToInt32(dt.Rows[i]["product_id"].ToString());
                        int quantity = Convert.ToInt32(dt.Rows[i]["quantity"].ToString());
                        double total_amount = Convert.ToDouble(dt.Rows[0]["total_amount"]);

                        using (SqlCommand cmd1 = new SqlCommand("select * from Transaction_master where uid=@uid and product_id=@product_id", conn))
                        {
                            using (SqlDataAdapter sda1 = new SqlDataAdapter(cmd1))
                            {
                                cmd1.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                                cmd1.Parameters.AddWithValue("@product_id", productid);
                                DataTable dt1 = new DataTable();
                                sda1.Fill(dt1);
                                if (dt1.Rows.Count > 0)
                                {
                                    using (SqlCommand cmd2 = new SqlCommand("update Transaction_master set quantity=@quantity,total_amount=@total_amount where uid=@uid and product_id=@product_id", conn))
                                    {
                                       
                                            cmd2.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                                            cmd2.Parameters.AddWithValue("@product_id", productid);
                                            cmd2.Parameters.AddWithValue("@quantity", quantity);
                                            cmd2.Parameters.AddWithValue("@total_amount", total_amount);
                                            conn.Open();
                                            cmd2.ExecuteNonQuery();
                                          
                                            conn.Close();

                                       
                                    }
                                }
                                else
                                {
                                    using (SqlCommand cmd3 = new SqlCommand("insert into Transaction_master(uid,product_id,quantity,total_amount) values(@uid,@product_id,@quantity,@total_amount)", conn))
                                    {
                                       
                                            cmd3.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                                            cmd3.Parameters.AddWithValue("@product_id", productid);
                                            cmd3.Parameters.AddWithValue("@quantity", quantity);
                                            cmd3.Parameters.AddWithValue("@total_amount", total_amount);
                                            conn.Open();
                                            cmd3.ExecuteNonQuery();
                                            //    Response.Write("<script>alert('Your Order Placed Successfully...')</script>");
                                            conn.Close();

                                       

                                    }
                                }

                            }
                        }
                    }

                  
                    Response.Write("<script language='javascript'>window.alert('Your Order Placed Successfully...');window.location='Home.aspx';</script>");
                    using (SqlCommand cmd4 = new SqlCommand("Delete from cart_details where uid=@uid", conn))
                    {
                       
                            cmd4.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                            conn.Open();
                            cmd4.ExecuteNonQuery();
                            conn.Close();
                       
                    }
                }
            }
        }

      
    }
}