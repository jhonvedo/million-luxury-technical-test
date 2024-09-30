using MillionCore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace MillionCore.Specifications
{
    public class PropertyFilterSpecification : BaseSpecification<Property>
    {
        public PropertyFilterSpecification(
            string? location = null,
            decimal? minPrice = null,
            decimal? maxPrice = null,
            int? yearBuilt = null,
            string? ownerName = null,
             string? internalCode = null)
        {
          
            if (!string.IsNullOrEmpty(location))
            {
                AddCriteria(p => p.Address.Contains(location));
            }
          
            if (minPrice.HasValue)
            {
                AddCriteria(p => p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                AddCriteria(p => p.Price <= maxPrice.Value);
            }
          
            if (yearBuilt.HasValue)
            {
                AddCriteria(p => p.Year == yearBuilt.Value);
            }
          
            if (!string.IsNullOrEmpty(ownerName))
            {
                AddCriteria(p => p.Owner.Name.Contains(ownerName));
            }

            if (!string.IsNullOrEmpty(internalCode))
            {
                AddCriteria(p => p.CodeInternal.Contains(internalCode));
            }
        }
    }
}
