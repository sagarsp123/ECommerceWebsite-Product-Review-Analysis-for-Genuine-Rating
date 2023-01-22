using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnregistration_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd1 = new SqlCommand("select * from user_master where emailid=@emailid and mobile_no=@mobile_no", conn))
        {
            using (SqlDataAdapter sda1=new SqlDataAdapter(cmd1))
            {
                cmd1.Parameters.AddWithValue("@emailid", txtemail.Text);
                cmd1.Parameters.AddWithValue("@mobile_no", txtcontact.Text);
                DataTable dt=new DataTable();
                sda1.Fill(dt);
                if (dt.Rows.Count>0)
                {
                    Response.Write("<Script>alert('User Already Exists..')</Script>");
                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("insert into user_master(name,emailid,mobile_no,password,address) values(@name,@emailid,@mobile_no,@password,@address)", conn))
                    {

                        cmd.Parameters.AddWithValue("@name",txtname.Text);
                        cmd.Parameters.AddWithValue("@emailid",txtemail.Text);
                        cmd.Parameters.AddWithValue("@mobile_no",txtcontact.Text);
                        cmd.Parameters.AddWithValue("@password",txtpassword.Text);
                        cmd.Parameters.AddWithValue("@address",txtaddress.Text);
                     
                        conn.Open();
                       int result= cmd.ExecuteNonQuery();
                        if (result==1)
                        {
                            Response.Redirect("userlogin.aspx");
                        }
                        else
                        {
                            Response.Redirect("registration.aspx");
                        }
                        conn.Close();

                        
                    }
                }

            }
        }


       
    }
}