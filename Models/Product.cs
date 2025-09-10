using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace TotecoApi.Models
{
    [Table("Products")]
    public class Product
    {
        [Key]
        [Column("id")]
        public string Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("date")]
        public DateTime Date { get; set; }

        [Column("price")]
        public decimal Price { get; set; }

        [Column("score")]
        public double Score { get; set; }

        [Column("publication_id")]
        public string? PublicationId { get; set; }

        [JsonIgnore]
        public Publication? Publication { get; set; }
    }
}
