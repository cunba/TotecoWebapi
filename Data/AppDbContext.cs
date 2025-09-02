using Microsoft.EntityFrameworkCore;
using Models;

namespace Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<User> Users => Set<User>();
    public DbSet<Product> Products => Set<Product>();
    public DbSet<Publication> Publications => Set<Publication>();
    public DbSet<Establishment> Establishments => Set<Establishment>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Publication>()
            .HasOne(p => p.Establishment)
            .WithMany(e => e.Publications)
            .HasForeignKey(p => p.EstablishmentId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<Publication>()
            .HasMany(pub => pub.Products)
            .WithOne(p => p.Publication)
            .HasForeignKey(p => p.PublicationId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
