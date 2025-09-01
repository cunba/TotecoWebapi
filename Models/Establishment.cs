namespace TotecoApi.Models;

public class Establishment
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public string Address { get; set; } = "";
    public bool IsOpen { get; set; }
    public double Rating { get; set; }

    public List<Publication> Publications { get; set; } = new();
}
