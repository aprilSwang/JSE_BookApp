using BookManagement_PERX.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookManagement_PERX
{
    public partial class BookList : System.Web.UI.Page
    {
        List<Book> books;
        List<Genre> genres;
        protected void Page_Load(object sender, EventArgs e)
        {
            books = new List<Book>();
            genres = new List<Genre>();

            PopulateData();
        }

        void PopulateData()
        {   
            using (BookManagement context = new BookManagement())
            {
                books = context.Books.Where(b => b.IsActive.Equals("Y")).ToList();
                genres = context.Genres.ToList();
            }
            if(string.IsNullOrWhiteSpace(searchwords))
            {
                BookListView.DataSource = books;
                BookListView.DataBind();
            }
            else
            {
                List<Book> searchBook = books.Where(b => b.Name.ToLower().Contains(searchwords) ||
                b.Author.ToLower().Contains(searchwords)).ToList();

                BookListView.DataSource = searchBook;
                BookListView.DataBind();
            }
        }

        static string searchwords = "";
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            searchwords = SearchTxtb.Text;
            //List<Book> searchBooks = new List<Book>();
            //if (string.IsNullOrWhiteSpace(searchwords))
            //{
            //    PopulateData();
            //}
            //else
            //{
            //    searchBooks = books.Where(b => b.Name.ToLower().Contains(searchwords) ||
            //    b.Author.ToLower().Contains(searchwords)).ToList();

            //    BookListView.DataSource = searchBooks;
            //    BookListView.DataBind();
            //}
            PopulateData();
        }
        protected void ChangePage(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            PopulateData();
        }
    }
}