<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Challenge - Knockout.js</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <p>First Name: <span data-bind="text: firstName" /></p>
                <p>Last Name: <span data-bind="text: lastName" /> </p>
        </div>
        <hr />
        <div>
               <p>First Name: <asp:TextBox ID="txtUser" runat="server" data-bind="value: firstName, valueUpdate: 'keyup'" /></p>
                <p>Last Name: <asp:TextBox ID="txtPassword" runat="server" data-bind="value: lastName"/></p>
        </div>
        <hr />
        <p> Full Name: <span data-bind="text: fullName" /></p>
    </form>
    <script src="Scripts/knockout-3.4.2.js"></script>
    <script type="text/javascript">
        var vm = {
            //firstName: "Amy",
            //lastName: "Ambrose"
            firstName: ko.observable("Amy"),
            lastName: ko.observable("Ambrose")
        };

        vm.fullName = ko.dependentObservable(function () {
            return vm.firstName() + " " + vm.lastName()
        });

        vm.firstName.subscribe(function (val) {
            console.log("FirstName Updates as " + val);
        });
        ko.applyBindings(vm);
    </script>
</body>
</html>
