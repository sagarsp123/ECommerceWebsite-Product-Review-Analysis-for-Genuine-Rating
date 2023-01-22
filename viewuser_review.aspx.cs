using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewuser_review : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            conn = new SqlConnection(cs);
            using (SqlCommand cmd1 = new SqlCommand("select * from product_master", conn))
            {
                using (SqlDataAdapter sda1 = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        ddproduct.DataSource = dt1;
                        ddproduct.DataValueField = "product_id";
                        ddproduct.DataTextField = "name";
                        ddproduct.DataBind();
                    }
                }
            }
            ddproduct.Items.Insert(0, new ListItem("--Select Product--", "0"));
        }
        Chart1.Visible = false;
    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        int positive, neutral, negative;
        using (SqlCommand cmd = new SqlCommand("getreview", conn))
        {

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@product_id", ddproduct.SelectedValue);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["possitive"].ToString() == "")
                    {
                        positive = 0;
                    }
                    else
                    {
                        positive = Convert.ToInt32(dt.Rows[0]["possitive"].ToString());
                    }
                    if (dt.Rows[0]["neutral"].ToString() == "")
                    {
                        neutral = 0;
                    }
                    else
                    {
                        neutral = Convert.ToInt32(dt.Rows[0]["neutral"].ToString());
                    }

                    if (dt.Rows[0]["negative"].ToString() == "")
                    {
                        negative = 0;
                    }
                    else
                    {
                        negative = Convert.ToInt32(dt.Rows[0]["negative"].ToString());
                    }


                    //int[] x = {positive,neutral,negative};
                    //string[] y = {"Positive","Neutral","Negative"};
                    int[] x = { positive, negative };
                    string[] y = { "Positive", "Negative" };

                    Chart1.Series["Series1"].Points.DataBindXY(y, x);
                    Chart1.DataBind();
                    Chart1.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('No Data Found')</script>");
                }
            }

        }
    }
}