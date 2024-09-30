using MillionApplication.DTOs;
using MillionCore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Interfaces
{
    public interface IPropertyService
    {
        Task<PropertyDto> GetPropertyByIdAsync(int id);
        Task<IEnumerable<PropertyDto>> GetAllPropertiesAsync(PropertyFilterDto filters);
        Task<PropertyDto> CreatePropertyAsync(PropertyDto propertyDto);
        Task<PropertyDto> UpdatePropertyAsync(PropertyDto propertyDto);
        Task<PropertyDto> ChangePropertyPriceAsync(int id, decimal newPrice);
       

    }
}
