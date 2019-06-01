namespace BookManagement_PERX.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BookManagement : DbContext
    {
        public BookManagement()
            : base("name=BookManagement")
        {
        }

        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>()
                .Property(e => e.Rating)
                .HasPrecision(2, 1);

            modelBuilder.Entity<Genre>()
                .Property(e => e.Genre1)
                .IsUnicode(false);

            modelBuilder.Entity<Genre>()
                .HasMany(e => e.Books)
                .WithRequired(e => e.Genre)
                .WillCascadeOnDelete(false);
        }
    }
}
