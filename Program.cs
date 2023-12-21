
using TechShopAssignment.DAO;
using TechShopAssignment.Entity;


class Program
{
    static void Main()
    {
        // Usage example
        TechShopDao techShopDao = new TechShopDao();

        // Adding a product
        Products newProduct = new Products
        (
            1,
            "New Product",
            "A new product for testing",
            19.99m
        ) ;
        techShopDao.AddProduct(newProduct);

        // Updating a product
        Products updatedProduct = new Products
        (
            1, // Replace with an existing product ID
            "Updated Product",
            "An updated product for testing",
            29.99m
        );
        techShopDao.UpdateProduct(updatedProduct);

        // Removing a product
        int productIdToRemove = 2; // Replace with an existing product ID
        techShopDao.RemoveProduct(productIdToRemove);

        // Displaying the list of products
        List<Products> productList = techShopDao.GetProducts();
        Console.WriteLine("List of Products:");
        foreach (Products product in productList)
        {
            Console.WriteLine($"ID: {product.ProductID}, Name: {product.ProductName}, Description: {product.Description}, Price: {product.Price:C}");
        }
    }
}