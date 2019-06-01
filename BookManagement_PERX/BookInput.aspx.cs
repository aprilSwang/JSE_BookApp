using BookManagement_PERX.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookManagement_PERX
{
    public partial class BookInput : System.Web.UI.Page
    {
        List<Book> books;
        List<Genre> genres;
        protected void Page_Load(object sender, EventArgs e)
        {
            books = new List<Book>();
            genres = new List<Genre>();
            using (BookManagement context = new BookManagement())
            {
                books = context.Books.Where(b => b.IsActive.Equals("Y")).ToList();
                genres = context.Genres.ToList();
            }
            if (!IsPostBack)
            {
                GenreDDL.DataSource = genres;
                GenreDDL.DataBind();
            }
        }

        protected void YearRV_Init(object sender, EventArgs e)
        {
            ((RangeValidator)sender).MaximumValue = DateTime.Now.Year.ToString();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            string name = NameTxtb.Text;
            string author = AuthorTxtb.Text;

            Book bo = new Book();
            List<Book> boks = books.Where(b => b.Name.ToLower().Equals(name.ToLower())).ToList();
            bo = boks.Where(b => b.Author.ToLower().Equals(author.ToLower())).FirstOrDefault();
            //bo =  books.Where(b => b.Name.ToLower().Equals(name.ToLower()) && b.Author.ToLower().Equals(author)).FirstOrDefault();
            if (bo != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The book with same name and author exists.')", true);
            }

            else
            {
                string imgPath = null;
                string imgName = name.Replace(" ", "");
                int genre = Convert.ToInt32(GenreDDL.SelectedItem.Value);
                decimal? rating = decimal.Parse(rateRating.CurrentRating.ToString());
                string desc = DescTxtb.Text;
                string year = YearTxtb.Text;
                if (ImgUpload.HasFile)
                {
                    imgPath = "Images/" + imgName + System.IO.Path.GetExtension(ImgUpload.FileName);
                }

                using (TransactionScope ts = new TransactionScope())
                {
                    using (BookManagement context = new BookManagement())
                    {
                        Book b = new Book()
                        {
                            Name = name,
                            Author = author,
                            Rating = rating,
                            GenreId = genre,
                            Image = imgPath,
                            Description = desc,
                            PublishedYear = year,
                            IsActive = "Y"
                        };
                        context.Books.Add(b);
                        context.SaveChanges();
                    }
                    ts.Complete();
                }
                if (ImgUpload.HasFile)
                {
                    ImgUpload.SaveAs(Server.MapPath("~/Images/") + imgName + System.IO.Path.GetExtension(ImgUpload.FileName));
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('New book successfully added'); window.location='" + Request.ApplicationPath + "BookList.aspx';", true);

            }
        }
    }
}