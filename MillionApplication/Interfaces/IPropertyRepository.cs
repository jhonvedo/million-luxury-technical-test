using MillionCore.Entities;
using MillionCore.Specifications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Interfaces
{
    public interface IPropertyRepository
    {
        Task<Property?> GetByIdAsync(int id);
        Task<IEnumerable<Property>> GetAllAsync(PropertyFilterSpecification filter);
        Task<Property> AddAsync(Property property);
        Task<Property> UpdateAsync(Property property);
        Task DeleteAsync(int id);
    }
}
