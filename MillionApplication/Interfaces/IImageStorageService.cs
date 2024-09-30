using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Interfaces
{
    public interface IImageStorageService
    {
        Task<string> SaveImageAsync(byte[] image, string fileName);
        Task DeleteImageAsync(string fileName);
        Task DeleteImageAsync(string containerName, string fileName);
    }
}
