namespace BookManagement_PERX.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Book
    {
        public int BookId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(100)]
        public string Author { get; set; }

        [StringLength(10)]
        public string PublishedYear { get; set; }

        public decimal? Rating { get; set; }

        public string Description { get; set; }

        [StringLength(500)]
        public string Image { get; set; }

        public int? Stock { get; set; }

        [StringLength(1)]
        public string IsActive { get; set; }

        public int GenreId { get; set; }

        public virtual Genre Genre { get; set; }
    }
}
