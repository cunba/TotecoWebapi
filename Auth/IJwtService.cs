using System.Security.Claims;
using TotecoApi.Models;

namespace TotecoApi.Auth
{
    public interface IJwtService
    {
        public string GenerateToken(User user);
        public bool HasAccessToResource(int requestedUserID, ClaimsPrincipal user);


    }
}
