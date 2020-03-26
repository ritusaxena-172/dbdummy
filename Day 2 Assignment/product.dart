
class Product_dart{
    String Product_name= 'Washing Machine';
    int Product_price=35000;
    int Discount_on_product=10;
    double Actual_price;

    void Product_details()
    {
        Actual_price = ((1-Discount_on_product/100) * Product_price);
        print(Product_name);
        print(Product_price);
        print(Discount_on_product);
        print(Actual_price);

    }
}
