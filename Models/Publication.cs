using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace TotecoApi.Models
{
    [Table("Publications")]
    public class Publication
    {
        [Key]
        [Column("id")]
        public string Id { get; set; }

        [Column("date")]
        public DateTime Date { get; set; }

        [Column("total_price")]
        public decimal TotalPrice { get; set; }

        [Column("total_score")]
        public decimal TotalScore { get; set; }

        [Column("photo")]
        public string? Photo { get; set; }

        [Column("user_id")]
        public string UserId { get; set; }
        [JsonIgnore]
        public User? User { get; set; }

        [Column("establishment_id")]
        public string EstablishmentId { get; set; }
        public Establishment? Establishment { get; set; }

        public List<Product> Products { get; set; } = new();
    }
}
