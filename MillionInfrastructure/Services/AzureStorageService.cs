using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime;
using System.Text;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using Microsoft.Extensions.Configuration;
using MillionApplication.Interfaces;

namespace MillionInfrastructure.Services
{

    public class AzureStorageSettings
    {
        public string ConnectionString { get; set; }
        public string ContainerName { get; set; }
    }


    public class AzureStorageService : IImageStorageService
    {
        private readonly AzureStorageSettings _settings;
        private readonly BlobServiceClient _blobServiceClient;
        public AzureStorageService(AzureStorageSettings settings, BlobServiceClient blobServiceClient = null)
        {
            _settings = settings;
            _blobServiceClient = blobServiceClient == null ? new BlobServiceClient(settings.ConnectionString) : blobServiceClient;
        }

        public async Task<string> SaveImageAsync(byte[] imageData, string fileName)
        {
            var containerClient = _blobServiceClient.GetBlobContainerClient(_settings.ContainerName);
            await containerClient.CreateIfNotExistsAsync();
           
            var blobClient = containerClient.GetBlobClient(fileName);

            using (var stream = new MemoryStream(imageData))
            {
                await blobClient.UploadAsync(stream, true);                
            }

            return blobClient.Uri.ToString();
        }

        public async Task DeleteImageAsync(string fileName)
        {
            var containerClient = _blobServiceClient.GetBlobContainerClient(_settings.ContainerName);
            var blobClient = containerClient.GetBlobClient(fileName);
            await blobClient.DeleteIfExistsAsync();
        }

        public async Task DeleteImageAsync(string containerName,string fileName)
        {
            var containerClient = _blobServiceClient.GetBlobContainerClient(containerName);
            var blobClient = containerClient.GetBlobClient(fileName);
            await blobClient.DeleteIfExistsAsync();
        }
    }
}
