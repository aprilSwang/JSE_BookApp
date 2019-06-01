<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="BookManagement_PERX.BookDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
           
    </script>
    <style>
        .star-rating{
            background-size: cover;
            width:20px;
            height:20px;
            cursor:pointer; 
            background-repeat:no-repeat;
            display:block;
            background-color:red;
        }
        .Filled{
            background-image: url('stars/full.png')
        }
        .empty{
            background-image:url('stars/empty.png');
        }
    </style>
           <%-- <div>
                <h2>Detail</h2>
            </div>--%>
            <br />
    <div id="empty" runat="server">No book selected. <a href="BookList.aspx">Go to book list.</a> </div>
    <div id="details" runat="server"> 
        <a href="BookList.aspx" style="color:cadetblue;font-size:medium;text-decoration:none;float:left;"><b>Back to list</b></a>
            <br /><br /><br /><br /><table>
                <tr>
                    <td>
                        <asp:Image ID="img" runat="server" style="width:200px; height:300px"/>
                    </td>
                    <td>&nbsp;</td>  
                    <td>&nbsp;</td>  
                    <td>&nbsp;</td>  
                    <td>&nbsp;</td>  
                    <td>&nbsp;</td>  
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;">
                        <span><b><asp:Label ID="NameLbl" runat="server" Font-Size="X-Large"></asp:Label></b>
                        </span><br />
                        <span><b>By <asp:Label ID="AuthorLbl" runat="server"></asp:Label></b>
                           <%-- <b style="float:right">Delete</b>--%>
                        </span>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ajaxToolkit:Rating ID="rateRating" runat="server"
                            StarCssClass="star-rating"
                            FilledStarCssClass="Filled"
                            EmptyStarCssClass ="empty"
                            WaitingStarCssClass="Filled"
                            MaxRating="5" readonly="true">

                        </ajaxToolkit:Rating>
                    </ContentTemplate>
                </asp:UpdatePanel>
                        <asp:Label ID="RateLbl" runat="server"></asp:Label>
                        <br />
                        <span> 
                            <b><asp:Label ID="YearLbl" runat="server"></asp:Label></b> | 
                            <b><asp:Label ID="GenreLbl" runat="server"></asp:Label></b>
                        </span>
                        <br />
                        
                        <br /><asp:Label ID="DescLbl" runat="server" Width="45%"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
