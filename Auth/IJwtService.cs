using System.Security.Claims;
using TotecoApi.Models;
using TotecoWebapi.Models;

namespace TotecoWebapi.Auth
{
    public interface IJwtService
    {
        public string GenerateToken(User user);
        public bool HasAccessToResource(int requestedUserID, ClaimsPrincipal user);


    }
}
