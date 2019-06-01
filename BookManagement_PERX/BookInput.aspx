<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookInput.aspx.cs" Inherits="BookManagement_PERX.BookInput" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .star-rating{
            background-size: cover;
            width:30px;
            height:30px;
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
    .auto-style1 {
        margin-bottom: 13;
    }
    </style>
    <h1>New Book</h1>
    <table style="margin-left:auto;margin-right:auto">
        <tr>
            <td>
                <asp:Label ID="NameLbl" runat="server" Text="Name:"></asp:Label><br />
                <asp:TextBox ID="NameTxtb" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="NameRFV" runat="server" ErrorMessage="*Enter book name" ForeColor="Red" ControlToValidate="NameTxtb"></asp:RequiredFieldValidator>
            </td>

            <td>
                <asp:Label ID="AuthorLbl" runat="server" Text="By:"></asp:Label><br />
                <asp:TextBox ID="AuthorTxtb" runat="server"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="AuthorRFV" runat="server" ErrorMessage="*Enter author" ForeColor="Red" ControlToValidate="AuthorTxtb"></asp:RequiredFieldValidator>
           
            </td>
        </tr>

        <tr>
            <td> 
                <asp:Label ID="GenreLbl" runat="server" Text="Genre:"></asp:Label><br />
                <asp:DropDownList ID="GenreDDL" runat="server" DataTextField="Genre1" DataValueField="GenreId" AutoPostBack="true"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="YearLbl" runat="server" Text="Published Year:"></asp:Label><br />
                <asp:TextBox ID="YearTxtb" runat="server"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="YearRE" runat="server" ControlToValidate="YearTxtb" ErrorMessage="Please Enter Only Numbers" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                <asp:RangeValidator ID="YearRV" runat="server" ErrorMessage="*Invalid Year" ForeColor="Red" OnInit="YearRV_Init" ControlToValidate="YearTxtb"></asp:RangeValidator>
            
            
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="RateLbl" runat="server" Text="Rating:"></asp:Label><br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ajaxToolkit:Rating ID="rateRating" runat="server"
                            StarCssClass="star-rating"
                            FilledStarCssClass="Filled"
                            EmptyStarCssClass ="empty"
                            WaitingStarCssClass="Filled"
                            MaxRating="5"  >

                        </ajaxToolkit:Rating>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="ImgLbl" runat="server" Text="Image:"></asp:Label><br />
                <asp:FileUpload ID="ImgUpload" class="form-control-file" runat="server" accept=".png,.jpg,.jpeg"/>
                    <asp:RequiredFieldValidator ID="ImgRFV" runat="server" ErrorMessage="*Upload image" ForeColor="Red" ControlToValidate="ImgUpload"></asp:RequiredFieldValidator>
            
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Label ID="DescLbl" runat="server" Text="Description:"></asp:Label><br />
              
                <asp:TextBox ID="DescTxtb" runat="server" TextMode="MultiLine" Columns="3" Rows="8" MaxLength="300" Width="408px" CssClass="auto-style1"></asp:TextBox>
                    </td>
        </tr>
        <tr>
            <td style="float:right">
                <asp:Button ID="BtnAdd" class="btn btn-success" runat="server" Text="Add" OnClick="BtnAdd_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
