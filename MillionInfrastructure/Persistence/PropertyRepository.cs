using Microsoft.EntityFrameworkCore;
using MillionApplication.Interfaces;
using MillionDomain.Entities;
using MillionDomain.Specifications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructure.Persistence
{
    public class PropertyRepository : IPropertyRepository
    {
        private readonly MillionDbContext _dbContext;

        public PropertyRepository(MillionDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Property?> GetByIdAsync(int id)
        {
            return await _dbContext.Properties
                .Include(p => p.PropertyImages)
                .Include(p => p.Owner)
                .Include(p => p.PropertyTraces)
                .FirstOrDefaultAsync(p => p.IdProperty == id);
        }

        public async Task<IEnumerable<Property>> ListAsync()
        {
            return await _dbContext.Properties.ToListAsync();
        }

        public async Task<Property> AddAsync(Property property)
        {
            await _dbContext.Properties.AddAsync(property);
            await _dbContext.SaveChangesAsync();
            return property;
        }

        public async Task<Property> UpdateAsync(Property property)
        {           
            var existingProperty = await _dbContext.Properties.FindAsync(property.IdProperty);
            if (existingProperty == null)
            {
                throw new InvalidOperationException($"Property with Id {property.IdProperty} not found.");
            }

            _dbContext.Entry(existingProperty).State = EntityState.Detached;
            _dbContext.Properties.Update(property);
            await _dbContext.SaveChangesAsync();

            return property;
        }

        public async Task DeleteAsync(int id)
        {
            var property = await _dbContext.Properties.FindAsync(id);
            if (property != null)
            {
                _dbContext.Properties.Remove(property);
                await _dbContext.SaveChangesAsync();
            }
        }

        public async Task<IEnumerable<Property>> GetAllAsync(PropertyFilterSpecification filter)
        {
            var query = _dbContext.Properties.AsQueryable();

            if (filter.Criteria.Count > 0)
            {
                foreach (var criteria in filter.Criteria)
                {
                    query = query.Where(criteria);
                }
            }

            if (filter.IsPagingEnabled)
            {
                query = query.Skip(filter.Skip).Take(filter.Take);
            }    
            
            if(filter.OrderBy != null)
            {
                query = query.OrderBy(filter.OrderBy);
            }

            if (filter.OrderByDescending != null)
            {
                query = query.OrderByDescending(filter.OrderByDescending);
            }

            return await query.ToListAsync();
        }
    }
}
