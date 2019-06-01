using BookManagement_PERX.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookManagement_PERX
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            empty.Visible = false;details.Visible = false;
            int id = Convert.ToInt32(Request.QueryString["ID"]);

            Book book = new Book();
            Genre genre = new Genre();
            using (BookManagement context = new BookManagement())
            {
                book = context.Books.Where(b => b.BookId.Equals(id)).FirstOrDefault();
            }

            if (book == null)
            {
                empty.Visible = true;
            }
            else
            {
                using (BookManagement context = new BookManagement())
                {
                    genre = context.Genres.Where(g => g.GenreId.Equals(book.GenreId)).FirstOrDefault();

                }
                details.Visible = true;
                NameLbl.Text = book.Name;
                img.ImageUrl = book.Image;
                YearLbl.Text = book.PublishedYear == null ? "Unknown" : book.PublishedYear;
                DescLbl.Text = book.Description;
                AuthorLbl.Text = book.Author;
                rateRating.CurrentRating = Convert.ToInt32(book.Rating);
                RateLbl.Text = book.Rating.ToString();
                GenreLbl.Text = genre.Genre1;
            }
        }
    }
}