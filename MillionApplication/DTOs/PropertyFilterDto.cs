using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.DTOs
{
    public class PropertyFilterDto
    {
        public string? OwnerName { get; set; }
        public string? InternalCode { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
        public string? Address { get; set; }
        public int? Year { get; set; }
        public int? OwnerId { get; set; }
    }
}
