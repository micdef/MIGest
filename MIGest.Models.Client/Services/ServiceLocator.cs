using Microsoft.Extensions.DependencyInjection;
using MIGest.Repositories;
using MIGest.ToolBox.Patterns;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Data;
using System.Security.Policy;

namespace MIGest.Models.Client.Services
{
    public class ServiceLocator : ToolBox.Patterns.ServiceLocator
    {
        private static ServiceLocator _instance;

        public static ServiceLocator Instance
        {
            get { return _instance ?? new ServiceLocator(); }
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IAuthenticateService<User>, AuthenticateService>();
            serviceCollection.AddScoped<IUserService<User>, UserService>();
        }

        public IAuthenticateService<User> AuthenticateService
        {
            get { return Container.GetService<IAuthenticateService<User>>(); }
        }

        public IUserService<User> UserService
        {
            get { return Container.GetService<IUserService<User>>(); }
        }
    }
}
