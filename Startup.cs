using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WompomPizza.Startup))]
namespace WompomPizza
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
