using AutoMapper;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionDomain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Services
{
    public class ImageService : IImageService
    {
        private readonly IImageStorageService _imageStorageService;
        private readonly IImageRepository _imageRepository;
  

        public ImageService(IImageStorageService imageStorageService, IImageRepository imageRepository)
        {           
            _imageStorageService = imageStorageService;
            _imageRepository = imageRepository;          
        }

        public async Task<ImageDto> AddPropertyImageAsync(int propertyId, byte[] image, string imageName)
        {
            var imageUrl = await _imageStorageService.SaveImageAsync(image, imageName);
            var savedImage = await _imageRepository.AddAsync(new PropertyImage()
            {
                Enabled = true,
                File = imageUrl,
                IdProperty = propertyId
            });

            return new ImageDto()
            {
                Enabled = savedImage.Enabled,
                File = savedImage.File,
                IdPropertyImage = savedImage.IdPropertyImage
            };

        }

        public async Task RemovePropertyImageAsync(int id)
        {
            var propertyImage = await _imageRepository.GetByIdAsync(id);
            if(propertyImage == null)
            {
                return;
            }

            if (!string.IsNullOrEmpty(propertyImage.File))
            {
                Uri blobUri = new Uri(propertyImage.File);
                var containerName = blobUri.Segments[1].TrimEnd('/');
                var blobName = string.Join("", blobUri.Segments[2..]);

                await _imageStorageService.DeleteImageAsync(containerName, blobName);
            }

            await _imageRepository.DeleteAsync(id);
        }
    }
}
