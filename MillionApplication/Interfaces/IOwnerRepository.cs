using MillionCore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Interfaces
{
    public interface IOwnerRepository
    {
        Task<Owner?> GetByIdAsync(int id);      
        Task AddAsync(Owner propertyImage);
        Task UpdateAsync(Owner propertyImage);
        Task DeleteAsync(int id);
    }
}
