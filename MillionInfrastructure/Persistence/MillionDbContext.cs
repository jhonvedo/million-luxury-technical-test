using Microsoft.EntityFrameworkCore;
using MillionDomain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructure.Persistence
{
    public class MillionDbContext : DbContext
    {
        public MillionDbContext(DbContextOptions<MillionDbContext> options) : base(options)
        {
        }

        public DbSet<Property> Properties { get; set; }
        public DbSet<Owner> Owners { get; set; }
        public DbSet<PropertyImage> PropertyImages { get; set; }
        public DbSet<PropertyTrace> PropertyTraces { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Property>().HasKey(p => p.IdProperty);
            modelBuilder.Entity<Property>().Property(p => p.IdProperty).ValueGeneratedOnAdd();
            modelBuilder.Entity<Property>().Property(p => p.CodeInternal).HasMaxLength(255)  
            .IsUnicode()         
            .IsRequired();

            modelBuilder.Entity<Owner>().HasKey(p => p.IdOwner);
            modelBuilder.Entity<Owner>().Property(p => p.IdOwner).ValueGeneratedOnAdd();

            modelBuilder.Entity<PropertyImage>().HasKey(p => p.IdPropertyImage);
            modelBuilder.Entity<PropertyImage>().Property(p => p.IdPropertyImage).ValueGeneratedOnAdd();

            modelBuilder.Entity<PropertyTrace>().HasKey(p => p.IdPropertyTrace);
            modelBuilder.Entity<PropertyTrace>().Property(p => p.IdPropertyTrace).ValueGeneratedOnAdd();

            modelBuilder.Entity<Property>()
                .HasOne(p => p.Owner)
                .WithMany(o => o.Properties)
                .HasForeignKey(p => p.IdOwner);

            modelBuilder.Entity<PropertyImage>()
                .HasOne(p => p.Property)
                .WithMany(p => p.PropertyImages)
                .HasForeignKey(p => p.IdProperty);

            modelBuilder.Entity<PropertyTrace>()
                .HasOne(t => t.Property)
                .WithMany(p => p.PropertyTraces)
                .HasForeignKey(t => t.IdProperty);
        }
    }
}
