using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Models
{
    [Table("Users")]
    public class User
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("username")]
        public string Username { get; set; } = string.Empty;

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("surname")]
        public string Surname { get; set; } = string.Empty;

        [Column("birth_date")]
        public DateTime? BirthDate { get; set; }

        [Column("email")]
        public string Email { get; set; } = string.Empty;

        [Column("password")]
        public string Password { get; set; } = string.Empty;

        [Column("creation_date")]
        public DateTime CreationDate { get; set; } = DateTime.UtcNow;

        [Column("active")]
        public bool Active { get; set; } = true;

        [Column("money_spent")]
        public decimal MoneySpent { get; set; }

        [Column("publications_number")]
        public int PublicationsNumber { get; set; }

        [Column("role")]
        public string Role { get; set; } = "user";

        [JsonIgnore]
        public List<Publication> Publications { get; set; } = new();
    }
}
