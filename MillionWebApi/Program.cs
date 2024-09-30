using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using MillionApplication.Interfaces;
using MillionApplication.Mapping;
using MillionApplication.Services;
using MillionInfrastructure.Persistence;
using MillionInfrastructure.Services;
using MillionWebApi.Handlers;
using MillionWebApi.Services;
using MillionWebApi.Utils;
using System;
using System.Text;

var builder = WebApplication.CreateBuilder(args);


builder.Services.Configure<TokenSettings>(builder.Configuration.GetSection("TokenSettings"));

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        var tokenSettings = builder.Configuration.GetSection("TokenSettings").Get<TokenSettings>();
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = tokenSettings.Issuer,
            ValidAudience = tokenSettings.Audience,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenSettings.Secret))
        };
    });

builder.Services.AddAuthorization();

// Add services to the container.
builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.Configure<AzureStorageSettings>(builder.Configuration.GetSection("AzureStorageSettings"));

builder.Services.AddAutoMapper(typeof(MillionMappingProfile));

builder.Services.AddDbContext<MillionDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"))
);

builder.Services.AddSingleton<ITokenService,TokenService>(serviceProvider =>
{
    var settings = serviceProvider.GetRequiredService<IOptions<TokenSettings>>().Value;
    return new TokenService(settings);
});

builder.Services.AddTransient<IAuthService, FakeAuthService>();
builder.Services.AddScoped<IPropertyRepository, PropertyRepository>();
builder.Services.AddScoped<IImageRepository, ImageRepository>();
builder.Services.AddScoped<IOwnerRepository, OwnerRepository>();
builder.Services.AddScoped<IImageService, ImageService>();


builder.Services.AddScoped<IImageStorageService, AzureStorageService>(serviceProvider =>
{    
    var settings = serviceProvider.GetRequiredService<IOptions<AzureStorageSettings>>().Value;
    return new AzureStorageService(settings);
});
builder.Services.AddScoped<IPropertyService, PropertyService>();

builder.Services.AddScoped<ExceptionHandlingMiddleware>();



var app = builder.Build();

app.UseMiddleware<ExceptionHandlingMiddleware>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
