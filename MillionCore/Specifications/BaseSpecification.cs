using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MillionDomain.Specifications
{
    public abstract class BaseSpecification<T>
    {
       
        public List<Expression<Func<T, bool>>> Criteria { get; } = new List<Expression<Func<T, bool>>>();

        public Expression<Func<T, object>>? OrderBy { get; private set; }

       
        public Expression<Func<T, object>>? OrderByDescending { get; private set; }

     
        public int Take { get; private set; }
        public int Skip { get; private set; }
        public bool IsPagingEnabled { get; private set; }

    
        protected void AddCriteria(Expression<Func<T, bool>> criterion)
        {
            Criteria.Add(criterion);
        }
     
        protected void ApplyOrderBy(Expression<Func<T, object>> orderByExpression)
        {
            OrderBy = orderByExpression;
            OrderByDescending = null;
        }

        protected void ApplyOrderByDescending(Expression<Func<T, object>> orderByDescExpression)
        {
            OrderByDescending = orderByDescExpression;
            OrderBy = null;
        }
       
        protected void ApplyPaging(int skip, int take)
        {
            Skip = skip;
            Take = take;
            IsPagingEnabled = true;
        }
    }
}
