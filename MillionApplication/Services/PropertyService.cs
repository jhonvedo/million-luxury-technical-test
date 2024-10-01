using AutoMapper;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionDomain.Entities;
using MillionDomain.Specifications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;


namespace MillionApplication.Services
{
    public class PropertyService : IPropertyService
    {
        private readonly IPropertyRepository _propertyRepository;
        private readonly IMapper _mapper;

        public PropertyService(IPropertyRepository propertyRepository, IMapper mapper)
        {
            _propertyRepository = propertyRepository;   
            _mapper = mapper;
        }

        public async Task<PropertyDto> GetPropertyByIdAsync(int id)
        {
            var property = await _propertyRepository.GetByIdAsync(id);

            if (property == null)
                return null;

            return _mapper.Map<PropertyDto>(property);          
        }

        public async Task<IEnumerable<PropertyDto>> GetAllPropertiesAsync(PropertyFilterDto filters)
        {
            var spec = new PropertyFilterSpecification(
                location: filters.Address,
                minPrice: filters.MinPrice,
                maxPrice: filters.MaxPrice,                
                ownerName: filters.OwnerName,
                yearBuilt: filters.Year,
                internalCode: filters.InternalCode);

            var properties = await _propertyRepository.GetAllAsync(spec);
            return _mapper.Map<List<PropertyDto>>(properties);           
        }

        public async Task<PropertyDto> CreatePropertyAsync(PropertyDto propertyDto)
        {

            var spec = new PropertyFilterSpecification(internalCode: propertyDto.CodeInternal);   
            var propertiesWithInternalCode = await _propertyRepository.GetAllAsync(spec);
            if (propertiesWithInternalCode != null)
            {
                throw new Exception("Internal code already exists");
            }

            var property = _mapper.Map<Property>(propertyDto);            

            var savedProperty = await _propertyRepository.AddAsync(property);
            return await GetPropertyByIdAsync(savedProperty.IdProperty);

        }

        public async Task<PropertyDto> UpdatePropertyAsync(PropertyDto propertyDto)
        {
            var property = await _propertyRepository.GetByIdAsync(propertyDto.IdProperty);

            if (property != null)
            {
                property.Name = propertyDto.Name;
                property.Address = propertyDto.Address;
                property.CodeInternal = propertyDto.CodeInternal;
                property.Year = propertyDto.Year;
                property.IdOwner = propertyDto.IdOwner;

                await _propertyRepository.UpdateAsync(property);

                return await GetPropertyByIdAsync(propertyDto.IdProperty);
            }

            return null;
        }     

        public async Task<PropertyDto> ChangePropertyPriceAsync(int id, decimal newPrice)
        {
            var property = await _propertyRepository.GetByIdAsync(id);
            if (property != null)
            {               
                property.Price = newPrice;  
                await _propertyRepository.UpdateAsync(property);

                return await GetPropertyByIdAsync(id);
            }

            return null;
        } 
    }
}
