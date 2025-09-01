namespace TotecoApi.Models;

public class Product
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
    public decimal Price { get; set; }
    public double Rating { get; set; }

    public int TypeId { get; set; }
    public ProductType? Type { get; set; }

    public int? PublicationId { get; set; }
    public Publication? Publication { get; set; }
}
