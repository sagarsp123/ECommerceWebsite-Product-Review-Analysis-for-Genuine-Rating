using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using VaderSharp;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    protected static DataTable dt;
    protected static DataTable dtprod;
    protected static bool flag, flagr;
    protected static int uid;
    protected static int product_id;
    protected static DataTable rate_count;
   
    protected static int count_5, count_4, count_3, count_2, count_1,rev_count;
    protected static DataTable dt_ovarallrating, dt_r;
    protected static double Avg_rate;
        
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlCommand cmd_rtcount = new SqlCommand("select Count(product_id) as count_ from rating_master where rate=5 and product_id=@product_id union All select Count(product_id)  from rating_master where rate=4 and product_id=@product_id union All select Count(product_id) from rating_master where rate=3 and product_id=@product_id union All select Count(product_id) from rating_master where rate=2 and product_id=@product_id union All select Count(product_id) from rating_master where rate=1 and product_id=@product_id", conn))
            {
                rate_count=new DataTable();
                cmd_rtcount.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                using (SqlDataAdapter da_rtcount = new SqlDataAdapter(cmd_rtcount))
                {
                    da_rtcount.Fill(rate_count);
                    if (rate_count.Rows.Count>0)
                    {
                      
                        count_5 = Convert.ToInt32(rate_count.Rows[0]["count_"].ToString());
                        count_4 = Convert.ToInt32(rate_count.Rows[1]["count_"].ToString());
                        count_3 = Convert.ToInt32(rate_count.Rows[2]["count_"].ToString());
                        count_2 = Convert.ToInt32(rate_count.Rows[3]["count_"].ToString());
                        count_1 = Convert.ToInt32(rate_count.Rows[4]["count_"].ToString());
                    }

                }
            }

            using (SqlCommand cmd_avgrt = new SqlCommand("select Count(product_id) as product_count,Avg(rate) as rate_avg,product_id from rating_master where product_id=@product_id group by product_id", conn))
            {
                dt_ovarallrating = new DataTable();
                cmd_avgrt.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                using (SqlDataAdapter da_avgrt = new SqlDataAdapter(cmd_avgrt))
                {
                    da_avgrt.Fill(dt_ovarallrating);
                    if (dt_ovarallrating.Rows.Count > 0)
                    {

                        Avg_rate = Convert.ToDouble(dt_ovarallrating.Rows[0]["rate_avg"].ToString());
                        rev_count = Convert.ToInt32(dt_ovarallrating.Rows[0]["product_count"].ToString());
                    }

                }
            }

            using (SqlCommand cmd_r = new SqlCommand("select rm.rev_id,rm.uid,rm.product_id,rm.review,pm.product_id,pm.name,um.uid,um.name as username from review_master rm inner join product_master pm on rm.product_id=pm.product_id inner join user_master um on rm.uid=um.uid  where rm.product_id=@product_id", conn))
            {
                dt_r=new DataTable();
                using (SqlDataAdapter da_r = new SqlDataAdapter(cmd_r))
                {
                    cmd_r.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                    da_r.Fill(dt_r);
                    if (dt_r.Rows.Count > 0)
                    {

                        flagr = true;
                    }

                }
                
            }


            if (Request.QueryString["id"] != null)
            {
                using (SqlCommand cmd1 = new SqlCommand("select product_id,name,price,'Admin/'+image as image from [product_master] where product_id=@product_id", conn))
                {
                    cmd1.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                    dtprod = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
                    {
                        sda.Fill(dtprod);
                    }
                    if (dtprod.Rows.Count > 0)
                    {
                        flag = true;
                    }
                    string b = dtprod.Rows[0]["name"].ToString();
                    product_id = Convert.ToInt32(dtprod.Rows[0]["product_id"].ToString());

                }
            }



        }
    }
    protected void btnaddtocart_Click(object sender, EventArgs e)
    {

        if (Session["uid"] == null)
        {
     
            Response.Write("<script language='javascript'>window.alert('Login First..');window.location='userlogin.aspx';</script>");
           
        }
        else
        {

            using (SqlCommand cmd1 = new SqlCommand("select * from cart_details where uid=@uid and product_id=@product_id", conn))
            {
                using (SqlDataAdapter sda1=new SqlDataAdapter(cmd1))
                {
                    DataTable dt1=new DataTable();
                    cmd1.Parameters.AddWithValue("@uid",Session["uid"].ToString());
                    cmd1.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());

                    sda1.Fill(dt1);
                    if (dt1.Rows.Count>0)
                    {
                        using (SqlCommand cmd2 = new SqlCommand("update cart_details set quantity=@quantity,price=@price where uid=@uid and product_id=@product_id", conn))
                        {
                            cmd2.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                            cmd2.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                            cmd2.Parameters.AddWithValue("@quantity", txtquantity.Text);
                            cmd2.Parameters.AddWithValue("@price", dtprod.Rows[0]["price"].ToString());
                            conn.Open();
                            int row = cmd2.ExecuteNonQuery();
                            if (row == 1)
                            {
                                string display = "Added To Cart ";
                                ClientScript.RegisterStartupScript(this.GetType(), "Add successfull", "alert('" + display + "');", true);
                               
                            }
                            else
                            {
                                Response.Write("<script>alert('Not Add To Cart')</script>");
                            }
                            conn.Close();

                        }
                    }
                    else
                    {
                        using (SqlCommand cmd = new SqlCommand("insert into cart_details(uid,product_id,quantity,price) values(@uid,@product_id,@quantity,@price)", conn))
                        {
                            cmd.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                            cmd.Parameters.AddWithValue("@product_id", Request.QueryString["id"].ToString());
                            cmd.Parameters.AddWithValue("@quantity", txtquantity.Text);
                            cmd.Parameters.AddWithValue("@price", dtprod.Rows[0]["price"].ToString());
                            conn.Open();
                            int row = cmd.ExecuteNonQuery();
                            if (row == 1)
                            {
                                string display = "Added To Cart ";
                                ClientScript.RegisterStartupScript(this.GetType(), "Add successfull", "alert('" + display + "');", true);
                             
                            }
                            else
                            {
                                Response.Write("<script>alert('Not Add To Cart')</script>");
                            }
                            conn.Close();


                        }
                    }
                  
                }
            }


        }

      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {

            Response.Write("<script language='javascript'>window.alert('Login First..');window.location='userlogin.aspx';</script>");

        }
        else
        {
            String sentiment_result = "";
            SentimentIntensityAnalyzer analyzer = new SentimentIntensityAnalyzer();

            var results = analyzer.PolarityScores(txtreview.Text);
            double positive = results.Positive;
            double negative = results.Negative;
            double neutral = results.Neutral;

            if ((positive > negative) && (positive > neutral))
            {
                sentiment_result = "Positive";
            }
            else if ((negative > positive) && (negative > neutral))
            {
                sentiment_result = "Negative";
            }
            else
            {
                sentiment_result = "Neutral";
            }

            //using (SqlCommand cmd1 = new SqlCommand("select * from review_master where uid=@uid and product_id=@product_id", conn))
            //{

            //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
            //    {
            //        cmd1.Parameters.AddWithValue("@uid", Session["uid"].ToString());
            //        cmd1.Parameters.AddWithValue("@product_id",product_id);
            //        DataTable dt = new DataTable();
            //        sda.Fill(dt);
                    //if (dt.Rows.Count > 0)
                    //{
                    //    using (SqlCommand cmd2 = new SqlCommand("update review_master set review=@review,product_id=@product_id,sentiment_result=@sentiment_result where uid=@uid", conn))
                    //    {
                    //        cmd2.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                    //        cmd2.Parameters.AddWithValue("@product_id", product_id);
                    //        cmd2.Parameters.AddWithValue("@review", txtreview.Text);
                    //        cmd2.Parameters.AddWithValue("@sentiment_result", sentiment_result);
                    //        conn.Open();
                    //        cmd2.ExecuteNonQuery();
                    //        Response.Write("<script language='javascript'>window.alert('Review Added...');window.location='Home.aspx';</script>");
                    //        conn.Close();
                    //    }
                    //}
                    using (SqlCommand cmd = new SqlCommand("insert into review_master(uid,product_id,review,sentiment_result) values(@uid,@product_id,@review,@sentiment_result)", conn))
                    {
                        cmd.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                        cmd.Parameters.AddWithValue("@product_id", product_id);
                        cmd.Parameters.AddWithValue("@review", txtreview.Text);
                        cmd.Parameters.AddWithValue("@sentiment_result", sentiment_result);
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        Response.Write("<script language='javascript'>window.alert('Review Added...');window.location='Home.aspx';</script>");
                        conn.Close();
                    }


                }
            }
       
            
        }


   // }

//}