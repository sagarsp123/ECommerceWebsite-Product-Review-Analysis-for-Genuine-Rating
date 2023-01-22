using System;
using System.Activities.Expressions;
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
    protected static DataTable dt_colr;
    protected static bool flag;
    protected static bool flag_colr;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            using (SqlCommand cmd_colr = new SqlCommand("select * from color_master", conn))
            {
                dt_colr = new DataTable();
                using (SqlDataAdapter da_colr=new SqlDataAdapter(cmd_colr))
                {
                    
                    da_colr.Fill(dt_colr);
                   
                }
                if (dt_colr.Rows.Count > 0)
                {
                    flag_colr = true;
                }
                
            }


            if (Request.QueryString["id"] != null)
            {
                using (SqlCommand cmd = new SqlCommand("select * from [dbo].[product_master] where catid=@id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    dt1 = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt1);
                    }
                    if (dt1.Rows.Count > 0)
                    {
                        flag = true;
                    }
                }
            }
            else
            {
                using (SqlCommand cmd = new SqlCommand("select product_id,name,cat_id,price,'Admin/'+image as image from [product_master] where cat_id=@cat_id", conn))
                {
                    dt1 = new DataTable();
                    int cat_id = Convert.ToInt32(Request.QueryString["cat_id"].ToString());
                    cmd.Parameters.AddWithValue("@cat_id", cat_id);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt1);
                    }
                    if (dt1.Rows.Count > 0)
                    {
                        flag = true;
                    }
                }
            }
        }

    }
    protected void btnfilter_Click(object sender, EventArgs e)
    {
      
        string a,b,c,d,i,f,g,h = "";
        if (chkArmani.Checked==true)
        {
             a = "1";
        }
        else
        {
            a= "";
        }
        if (chkLevis.Checked==true)
        {
            b = "2";
        }
        else 
        {
            b = "";
        }
         if (chkNike.Checked==true)
         {
             c = "4";
         }
         else
         {
             c = "";
         }
         if (chkLacoste.Checked == true)
         {
             d = "3";
         }
         else
         {
             d = "";
         }

         if (chkblack.Checked==true)
         {
             i = "1";
         }
         else
         {
             i = "";
         }
         if (chkred.Checked==true)
         {
             f = "2";
         }
         else
         {
             f = "";
         }
         if (chkblue.Checked==true)
         {
             g = "3";
         }
         else
         {
             g = "";
         }
         if (chkgold.Checked==true)
         {
             h = "4";
         }
         else
         {
             h = "";
         }


         using (SqlCommand cmd = new SqlCommand("select b.product_id,b.name,b.cat_id,b.brand_id,b.color_id,'Admin/'+b.image as image,product_master.price from product_master left join (select a.product_id,a.name,a.cat_id,a.brand_id,product_master.color_id,a.price,a.image from product_master left join (select * from product_master where brand_id=@armani or brand_id=@levies or brand_id=@lacoste or brand_id=@nike)as a on a.product_id=product_master.product_id where product_master.color_id=@black or product_master.color_id=@red or product_master.color_id=@blue or product_master.color_id=@gold) as b on b.product_id=product_master.product_id where product_master.price between @price1 and @price2 and b.cat_id=@cat_id", conn))
        
        {
             cmd.Parameters.AddWithValue("@armani", a);
             cmd.Parameters.AddWithValue("@levies", b);
             cmd.Parameters.AddWithValue("@lacoste", d);
             cmd.Parameters.AddWithValue("@nike", c);
             cmd.Parameters.AddWithValue("@black", i);
             cmd.Parameters.AddWithValue("@red", f);
             cmd.Parameters.AddWithValue("@blue", g);
             cmd.Parameters.AddWithValue("@gold", h);
             cmd.Parameters.AddWithValue("@price1", txtamt1.Text);
             cmd.Parameters.AddWithValue("@price2", txtamt2.Text);
             cmd.Parameters.AddWithValue("@cat_id", Convert.ToInt32(Request.QueryString["cat_id"].ToString()));
             using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
             {
                 dt1= new DataTable();
                 adp.Fill(dt1);
                 if (dt1.Rows.Count>0)
                 {
                    
                     flag = true;
                 }
                 else
                 {
                     Response.Write("<script>alert('No Data')</script>");
                 }

         }
             clear();
         }

}

    public void clear()
    {
        chkArmani.Checked = false;
        chkLacoste.Checked = false;
        chkLevis.Checked = false;
        chkNike.Checked = false;
        chkblack.Checked = false;
        chkblue.Checked = false;
        chkgold.Checked = false;
        chkred.Checked = false;
      
    }
}