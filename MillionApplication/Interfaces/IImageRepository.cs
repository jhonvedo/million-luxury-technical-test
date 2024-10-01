using MillionDomain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Interfaces
{
    public interface IImageRepository
    {
        Task<PropertyImage?> GetByIdAsync(int id);
        Task<PropertyImage> AddAsync(PropertyImage propertyImage);
        Task DeleteAsync(int id);
    }
}
