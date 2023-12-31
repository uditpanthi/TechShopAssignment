﻿using System.Data.SqlClient;
using TechShop.Exceptions;
using TechShopAssignment.Entity;
using TechShopAssignment.Utility;


namespace TechShopAssignment.DAO
{
    public class TechShopDao : ITechShopDao
    {
        public string connectionString;
        SqlCommand cmd = null;

        public TechShopDao()
        {
            connectionString = DBConn.GetConnectionString();
            cmd = new SqlCommand();
        }




        public List<Products> GetProducts()
        {
            List<Products> products = new List<Products>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sql = "SELECT * FROM Products";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Products tempProduct = new Products
                            (
                                Convert.ToInt32(reader["ProductID"]),
                                reader["ProductName"].ToString(),
                                reader["Description"].ToString(),
                                Convert.ToDecimal(reader["Price"])
                            );
                            products.Add(tempProduct);
                        }
                    }
                }
            }

            return products;
        }

        public void AddProduct(Products product)
        {
            try
            {
                if (GetProducts().Exists(p => p.ProductName.Equals(product.ProductName, StringComparison.OrdinalIgnoreCase)))
                {
                    throw new ProductNotFoundException("Product with the same name already exists.");
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "INSERT INTO Products (ProductName, Description, Price) VALUES (@ProductName, @Description, @Price)";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@ProductName", product.ProductName);
                        command.Parameters.AddWithValue("@Description", product.Description);
                        command.Parameters.AddWithValue("@Price", product.Price);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while adding the product: {ex.Message}");
            }
        }

        public void UpdateProduct(Products updatedProduct)
        {
            try
            {
                if (!GetProducts().Exists(p => p.ProductID == updatedProduct.ProductID))
                {
                    throw new ProductNotFoundException("Product does not exist.");
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "UPDATE Products SET ProductName = @ProductName, Description = @Description, Price = @Price WHERE ProductID = @ProductID";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@ProductID", updatedProduct.ProductID);
                        command.Parameters.AddWithValue("@ProductName", updatedProduct.ProductName);
                        command.Parameters.AddWithValue("@Description", updatedProduct.Description);
                        command.Parameters.AddWithValue("@Price", updatedProduct.Price);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (ProductNotFoundException)
            {
                Console.WriteLine("Product not found");
            }
        }

        public void RemoveProduct(int productID)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlCheckOrders = "SELECT COUNT(*) FROM Orders WHERE ProductID = @ProductID";
                    using (SqlCommand commandCheckOrders = new SqlCommand(sqlCheckOrders, connection))
                    {
                        commandCheckOrders.Parameters.AddWithValue("@ProductID", productID);
                        int orderCount = Convert.ToInt32(commandCheckOrders.ExecuteScalar());

                        if (orderCount > 0)
                        {
                            throw new ProductNotFoundException("Cannot remove product with existing orders.");
                        }
                    }
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "DELETE FROM Products WHERE ProductID = @ProductID";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@ProductID", productID);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (ProductNotFoundException ex)
            {
                Console.WriteLine("Product Not Found");
            }
        }








        public void AddCustomer(Customers customer)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) " +
                               "VALUES (@CustomerID, @FirstName, @LastName, @Email, @Phone, @Address)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerID", customer.CustomerID);
                    command.Parameters.AddWithValue("@FirstName", customer.FirstName);
                    command.Parameters.AddWithValue("@LastName", customer.LastName);
                    command.Parameters.AddWithValue("@Email", customer.Email);
                    command.Parameters.AddWithValue("@Phone", customer.Phone);
                    command.Parameters.AddWithValue("@Address", customer.Address);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void UpdateCustomerInfo(Customers customer)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "UPDATE Customers " +
                               "SET Email = @NewEmail, Phone = @NewPhone, Address = @NewAddress " +
                               "WHERE CustomerID = @CustomerID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerID", customer.CustomerID);
                    command.Parameters.AddWithValue("@NewEmail", customer.Email);
                    command.Parameters.AddWithValue("@NewPhone", customer.Phone);
                    command.Parameters.AddWithValue("@NewAddress", customer.Address);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void GetCustomerDetails(int customerID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM Customers WHERE CustomerID = @CustomerID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerID", customerID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Console.WriteLine($"Customer ID: {reader["CustomerID"]}");
                            Console.WriteLine($"First Name: {reader["FirstName"]}");
                            Console.WriteLine($"Last Name: {reader["LastName"]}");
                            Console.WriteLine($"Email: {reader["Email"]}");
                            Console.WriteLine($"Phone: {reader["Phone"]}");
                            Console.WriteLine($"Address: {reader["Address"]}");
                        }
                        else
                        {
                            Console.WriteLine("Customer not found.");
                        }
                    }
                }
            }

        }
    }
}
