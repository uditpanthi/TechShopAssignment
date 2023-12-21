using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechShopAssignment.Entity;

namespace TechShopAssignment.DAO
{
    public interface ITechShopDao
    {
        public List<Products> GetProducts();
        public void AddProduct(Products product);
        public void UpdateProduct(Products updatedProduct);
        public void RemoveProduct(int productID);


        public void AddCustomer(Customers customer);
        public void UpdateCustomerInfo(Customers customer);
        public void GetCustomerDetails(int customerID);
    }
}
