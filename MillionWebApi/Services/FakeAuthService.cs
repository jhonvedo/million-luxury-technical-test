
namespace MillionWebApi.Services
{
    public class FakeAuthService : IAuthService
    {
        public bool ValidateCredentials(string username, string password)
        {
            return true;
        }
    }
}
