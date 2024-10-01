using MillionApplication.DTOs;

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
