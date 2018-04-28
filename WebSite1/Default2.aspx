<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Understanding ObservableArray of Knockout</title>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jQuery.tmpl.js"></script>
    <script src="Scripts/knockout-3.4.2.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>

        <div>
            <p>Product Name: <input type="text" data-bind="value: productName" /></p>
            <p>Price: <input type="text" data-bind="value: price" /></p>
            <button data-bind="click: addProduct">Add Product</button>
        </div>
            <label>Total (<span data-bind="text: products().length"></span> )Products</label>
            <ul data-bind="template: { name: 'productsTemplate', foreach: products }"></ul>
            <script type="text/html" id="productsTemplate">
                <li><label>Product ${$data.pname} - ${$data.price}</label></li>
                    <button data-bind="click: remove">Remove</button>
            </script>


        </div>
    </form>
    <script type="text/javascript">
        function Product(pname, price) {
            return {
                pname: ko.observable(pname),
                price: ko.observable(price)
             };
        }

        var vm = {
            productName: ko.observable("New Product"),
            price: ko.observable(0),
            products: ko.observableArray([new Product("Laptop", 45000), new Product("Camera", 28000)]),
            addProduct: function () {
                vm.products.push(new Product(this.productName(), this.price()));

            }
        };

        ko.applyBindings(vm);

    </script>
</body>
</html>
