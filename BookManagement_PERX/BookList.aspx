<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="BookManagement_PERX.BookList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <section>
        <div>
            <hgroup>
                <h3><b>Books</b></h3>
            </hgroup>
            <div id="notempty">
                <a href="BookInput.aspx" class="btn btn-outline-info" style="color:cadetblue;font-size:medium;text-decoration:none;float:left;"><b>Add more books</b></a>
                <div style="float:right">
                        <table>
                            <tr>
                                <td><asp:TextBox ID="SearchTxtb" runat="server" Width="500px"></asp:TextBox>
</td>
                                <td> &nbsp; &nbsp;</td>
                                <td>
                                     <asp:Button ID="BtnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="BtnSearch_Click" />
                   
                                </td>
                            </tr>
                        </table>
                    </div>
                <div>
                    
                    <br /><br /><br /><br />
                <asp:ListView ID="BookListView" runat="server" 
                DataKeyNames="BookId" GroupItemCount="6" OnPagePropertiesChanging="ChangePage">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned. <a href="BookInput.aspx">Add more book here.</a></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="BookDetails.aspx?ID=<%#Eval("BookId")%>">
                                        <img src="<%#Eval("Image")%>"
                                            width="150" height="200" style="border: solid" /></a>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px">
                                    <a href="BookDetails.aspx?ID=<%#Eval("BookId")%>">
                                        <span style="font-size:large;width:60px" >
                                            <b ><%#Eval("Name")%></b>
                                                
                                    
                                        </span>

                                    </a>
                                    <br />
                                    <span style="font-size:small"><b>
                                        <%#Eval("Author")%>
                                        </b>
                                  
                                    </span>
                                    <br />
                                    <span style="font-size:small">(rating: <%#Eval("Rating") %>)</span>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="BookListView" PageSize="24">

<Fields>

<asp:NumericPagerField ButtonCount="5" />

</Fields>

</asp:DataPager>
        </div>
                </div>
            </div>
    </section>
</asp:Content>
