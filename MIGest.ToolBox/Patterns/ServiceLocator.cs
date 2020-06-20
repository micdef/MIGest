using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.ToolBox.Patterns
{
    public abstract class ServiceLocator
    {
        protected IServiceProvider Container { get; set; }

        public ServiceLocator()
        {
            IServiceCollection serviceCollection = new ServiceCollection();
            ConfigureServices(serviceCollection);
            Container = serviceCollection.BuildServiceProvider();
        }

        public abstract void ConfigureServices(IServiceCollection serviceCollection);
    }
}
