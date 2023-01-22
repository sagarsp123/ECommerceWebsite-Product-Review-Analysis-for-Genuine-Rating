<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="View_product_review.aspx.cs" Inherits="_Default" EnableEventValidation="false"%>


<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/nice-select.css" rel="stylesheet" />
    <link href="css/external_css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--     <section class="cart_area section_padding">--%>
    <center>
    <div class="container">
     
      
         <asp:Label ID="lblproduct" runat="server" Text="Select Product"></asp:Label>
             <div class="form-select col-6 div_addprod" id="default-select">
                  
								<asp:DropDownList ID="ddproduct" runat="server"  AutoPostBack="False">
								    
								</asp:DropDownList>

							</div>

<asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click"></asp:Button>
      
        <div class="form-select col-6 div_addprod chart" >
             <asp:Chart ID="Chart1" runat="server" Width="1000px">
                        <Series>
                <asp:Series Name="Series1" ChartArea="ChartArea1"></asp:Series>
                           
            </Series>
                       <ChartAreas>
                           <asp:ChartArea Name="ChartArea1" ></asp:ChartArea>

                       </ChartAreas>
                   </asp:Chart>
                 

                    
               
        </div>
     
       </div>
       
     
       </center>

</asp:Content>

