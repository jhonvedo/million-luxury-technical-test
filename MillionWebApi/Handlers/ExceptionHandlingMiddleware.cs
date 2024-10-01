using Newtonsoft.Json;
using System.Net;

namespace MillionWebApi.Handlers
{

    public class ServiceErrorResponse
    {
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public string Detailed { get; set; }
    }
    public class ExceptionHandlingMiddleware : IMiddleware
    {

        public ExceptionHandlingMiddleware()
        {
                
        }

        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {               
                await HandleExceptionAsync(context, ex);
            }
        }

        private Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var response = new ServiceErrorResponse
            {
                StatusCode = context.Response.StatusCode,
                Message = "An error occurred while processing your request.",
                Detailed = exception.Message
            };

            return context.Response.WriteAsync(JsonConvert.SerializeObject(response));
        }
    }
}
