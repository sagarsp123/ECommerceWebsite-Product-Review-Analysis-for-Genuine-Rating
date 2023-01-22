<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart_details.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
      <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-12">
                  <div class="breadcrumb_iner">
                      <div class="breadcrumb_iner_item">
                          <p>Home/Shop/Single product/Cart list</p>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- breadcrumb start-->

 
  <!--================Cart Area =================-->
  <section class="cart_area section_padding">
    <div class="container">
      
                      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Product id</th>
                    <th scope="col">Product Image</th>
                    <th scope="col">Product Name</th>
                  <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
              </tr>
            </thead>
  <% if (flag == true)
           {
               foreach (System.Data.DataRow row in dt1.Rows)
               {%>
            <tbody>
              <tr>
                   <td>
                  <div class="media">
                  
                    <div class="media-body">
                     <%=row["product_id"] %>
                    </div>
                  </div>
                </td>
                   <td>
                  <div class="media">
                    <div class="d-flex">
                      <img src="<%=row["image"]%>" alt="" />
                    </div>
                    <div class="media-body">
                    
                    </div>
                  </div>
                </td>
                <td>
                  <div class="media">
                  
                    <div class="media-body">
                      <p><%=row["name"]%></p>
                    </div>
                  </div>
                </td>
                <td>
                  <h5><%=row["price"]%></h5>
                </td>
                <td>
                  <div class="product_count">
                       <h5><%=row["quantity"]%></h5>
                 
                    <%--<span class="input-number-decrement"> <i class="ti-minus"></i></span>
                    <input class="input-number" type="text" value="1" min="0" max="10">
                    <span class="input-number-increment"> <i class="ti-plus"></i></span>--%>
                  </div>
                </td>
                <td>
                  <h5><%=row["Total_amount"]%></h5>
                </td>
              </tr>
            
            </tbody>
              <%}
               
           } %>
              <%
     else
     {%>
         
     Response.Write("<script>alert('No Data Found')</script>");
     <%} %>
          </table>
          <div class="checkout_btn_inner float-right">
           
           <%-- <a class="btn_1 checkout_btn_1" href="#">Buy</a>--%>
             <asp:Button ID="btnbuy" runat="server" Text="Buy" class="btn_1 checkout_btn_1" OnClick="btnbuy_Click"/>
          </div>
        </div>
      </div>
               
   

        </div>
  </section>
  <!--================End Cart Area =================-->
</asp:Content>

