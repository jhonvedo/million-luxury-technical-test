using MillionDomain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace MillionDomain.Specifications
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
                AddCriteria(p => p.Address.ToLower().Contains(location.ToLower()));
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
                AddCriteria(p => p.Owner.Name.ToLower().Contains(ownerName.ToLower()));
            }

            if (!string.IsNullOrEmpty(internalCode))
            {
                AddCriteria(p => p.CodeInternal.ToLower().Contains(internalCode.ToLower()));
            }
        }


        public void AddPagination(int pageIndex=0, int pageSize=10)
        {
            this.ApplyPaging(pageIndex * pageSize, pageSize); 
        }

        public void AddOrderBy(Expression<Func<Property, object>> orderByExpression)
        {
            this.ApplyOrderBy(orderByExpression);
        }

        public void AddOrderByDescending(Expression<Func<Property, object>> orderByExpression)
        {
            this.ApplyOrderByDescending(orderByExpression);
        }
    }
}
