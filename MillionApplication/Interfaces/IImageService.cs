using MillionApplication.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Interfaces
{
    public interface IImageService
    {
        Task<ImageDto> AddPropertyImageAsync(int id, byte[] image, string imageName);
        Task RemovePropertyImageAsync(int id);
    }
}
