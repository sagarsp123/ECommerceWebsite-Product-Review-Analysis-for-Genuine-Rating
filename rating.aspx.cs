using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["uid"] == null)
        {
            Response.Redirect("userlogin.aspx");
        }
        conn=new SqlConnection(cs);
        string product_id = Request.QueryString["id"].ToString();
        int rating = Convert.ToInt32(Request.QueryString["rate"].ToString());
      //using (SqlCommand cmd = new SqlCommand("select * from rating_master where uid=@uid and product_id=@product_id", conn))
      //  {
      //      using (SqlDataAdapter da=new SqlDataAdapter(cmd))
      //      {
      //          cmd.Parameters.AddWithValue("@uid", Session["uid"].ToString());
      //          cmd.Parameters.AddWithValue("@product_id", Request.QueryString["product_id"].ToString());

      //          DataTable dt =new DataTable();
      //          da.Fill(dt);
                //if (dt.Rows.Count>0)
                //{
                //    using (SqlCommand cmd1 = new SqlCommand("update rating_master set rate=@rate where uid=@uid and product_id=@product_id", conn))
                //    {
                //        cmd1.Parameters.AddWithValue("@uid",Session["uid"].ToString());
                //        cmd1.Parameters.AddWithValue("@product_id", Request.QueryString["product_id"].ToString());
                //        cmd1.Parameters.AddWithValue("@rate", rating);
                //        conn.Open();
                //        cmd1.ExecuteNonQuery();
                    
                //        Response.Write("<script language='javascript'>window.alert('Rate Successfull..');window.location='single_product.aspx';</script>");
                //        conn.Close();
                //    }
                    
                //}
                //else
                //{
                    using (SqlCommand cmd2 = new SqlCommand("insert into rating_master(uid,product_id,rate) Values(@uid,@product_id,@rate)", conn))
                    {
                        cmd2.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                        cmd2.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                        cmd2.Parameters.AddWithValue("@rate", rating);
                        conn.Open();
                        cmd2.ExecuteNonQuery();
                        Response.Write("<script language='javascript'>window.alert('Rate Successfull..');window.location='Home.aspx';</script>");
                        conn.Close();
                    }
                }
            }
    //    }
    //}
    //}
