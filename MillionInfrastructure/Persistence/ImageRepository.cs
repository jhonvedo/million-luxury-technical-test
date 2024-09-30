using Microsoft.EntityFrameworkCore;
using MillionApplication.Interfaces;
using MillionCore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructure.Persistence
{
    public class ImageRepository : IImageRepository
    {
        private readonly MillionDbContext _dbContext;

        public ImageRepository(MillionDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<PropertyImage> AddAsync(PropertyImage propertyImage)
        {
            await _dbContext.PropertyImages.AddAsync(propertyImage);
            await _dbContext.SaveChangesAsync();
            return propertyImage;
        }

        public async Task DeleteAsync(int id)
        {
            var propertyImage = await _dbContext.PropertyImages.FindAsync(id);
            if (propertyImage != null)
            {
                _dbContext.PropertyImages.Remove(propertyImage);
                await _dbContext.SaveChangesAsync();
            }

        }

        public async Task<PropertyImage?> GetByIdAsync(int id)
        {
            return await _dbContext.PropertyImages.FirstOrDefaultAsync(o => o.IdPropertyImage == id);
        }
    }
}
