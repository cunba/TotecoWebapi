using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace TotecoApi.Models
{
    [Table("Establishments")]
    public class Establishment
    {
        [Key]
        [Column("id")]
        public string Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("creation_date")]
        public DateTime CreationDate { get; set; } = DateTime.UtcNow;

        [Column("location")]
        public string? Location { get; set; }

        [Column("is_open")]
        public bool IsOpen { get; set; }

        [Column("score")]
        public decimal Score { get; set; }

        [JsonIgnore]
        public List<Publication> Publications { get; set; } = new();
    }
}
