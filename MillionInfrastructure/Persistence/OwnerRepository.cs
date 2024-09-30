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
    public class OwnerRepository : IOwnerRepository
    {
        private readonly MillionDbContext _dbContext;

        public OwnerRepository(MillionDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Owner?> GetByIdAsync(int id)
        {
            return await _dbContext.Owners
                .Include(o => o.Properties)
                .FirstOrDefaultAsync(o => o.IdOwner == id);
        }

        public async Task<IEnumerable<Owner>> ListAsync()
        {
            return await _dbContext.Owners
                .Include(o => o.Properties)
                .ToListAsync();
        }

        public async Task AddAsync(Owner owner)
        {
            await _dbContext.Owners.AddAsync(owner);
            await _dbContext.SaveChangesAsync();
        }

        public async Task UpdateAsync(Owner owner)
        {
            _dbContext.Owners.Update(owner);
            await _dbContext.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var owner = await _dbContext.Owners.FindAsync(id);
            if (owner != null)
            {
                _dbContext.Owners.Remove(owner);
                await _dbContext.SaveChangesAsync();
            }
        }
    }
}
