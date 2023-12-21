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
    }
}
