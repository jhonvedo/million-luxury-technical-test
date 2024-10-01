using MillionDomain.Entities;
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
        Task<Owner> AddAsync(Owner propertyImage);
        Task<Owner> UpdateAsync(Owner propertyImage);
        Task DeleteAsync(int id);
    }
}
