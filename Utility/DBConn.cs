using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechShopAssignment.Utility
{
    internal class DBConn
    {
        static IConfiguration _iconfiguration;

        static DBConn()
        {
            GetAppSetting();
        }
        private static void GetAppSetting()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("AppSetting.json");
            _iconfiguration = builder.Build();
        }
        public static string GetConnectionString()
        {
            return _iconfiguration.GetConnectionString("DefaultConnection");
        }
    }
}
