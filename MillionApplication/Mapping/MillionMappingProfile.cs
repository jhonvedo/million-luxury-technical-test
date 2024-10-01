using AutoMapper;
using MillionApplication.DTOs;
using MillionDomain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Mapping
{
    public class MillionMappingProfile : Profile
    {
        public MillionMappingProfile()
        {
            CreateMap<Property, PropertyDto>()
           .ForMember(dest => dest.Images, opt => opt.MapFrom(src => src.PropertyImages)) 
           .ForMember(dest => dest.Traces, opt => opt.MapFrom(src => src.PropertyTraces)) 
           .ForMember(dest => dest.Owner, opt => opt.MapFrom(src => src.Owner));

          
            CreateMap<PropertyDto, Property>()
                .ForMember(dest => dest.PropertyImages, opt => opt.MapFrom(src => src.Images)) 
                .ForMember(dest => dest.PropertyTraces, opt => opt.MapFrom(src => src.Traces)) 
                .ForMember(dest => dest.Owner, opt => opt.MapFrom(src => src.Owner)); 


            CreateMap<Owner, OwnerDto>().ReverseMap();
            CreateMap<PropertyImage, ImageDto>().ReverseMap();
            CreateMap<PropertyTrace, PropertyTraceDto>().ReverseMap();
        }
    }
}
