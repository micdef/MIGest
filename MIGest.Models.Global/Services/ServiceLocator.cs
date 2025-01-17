﻿using Microsoft.Extensions.DependencyInjection;
using MIGest.ToolBox.Patterns;
using MIGest.ToolBox.ADO;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using ToolBox;
using MIGest.Repositories;
using MIGest.Models.Global.Data.User;

namespace MIGest.Models.Global.Services
{
    public class ServiceLocator : ToolBox.Patterns.ServiceLocator
    {
        private static ServiceLocator _instance;

        public static ServiceLocator Instance
        {
            get { return _instance ?? new ServiceLocator(); }
        }

        private ServiceLocator() {}

        public override void ConfigureServices(Microsoft.Extensions.DependencyInjection.IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<DbProviderFactory, SqlClientFactory>((sp) => SqlClientFactory.Instance);
            serviceCollection.AddSingleton<IConnectionInfo, ConnectionInfo>((sp) => new ConnectionInfo(ConfigurationManager.ConnectionStrings["LocalNetwork"].ConnectionString));
            serviceCollection.AddSingleton<IConnection, Connection>();
            serviceCollection.AddScoped<IAuthenticateService<User, UserRight>, AuthenticateService>();
            serviceCollection.AddScoped<IUserService<User>, UserService>();
        }

        public IConnection Connection
        {
            get { return Container.GetService<IConnection>(); }
        }

        public IAuthenticateService<User, UserRight> AuthenticateService
        {
            get { return Container.GetService<IAuthenticateService<User, UserRight>>(); }
        }

        public IUserService<User> UserService
        {
            get { return Container.GetService<IUserService<User>>(); }
        }
    }
}
