namespace MillionWebApi.Models
{
    public class ServiceErrorResponse
    {
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public string Detailed { get; set; }
    }
}
