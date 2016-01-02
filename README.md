# Functional Requirements

Individual supplier can be accessed by specifying their supplier name as the path prefix.

* Given a supplier named Fresch Cafe
* When I visit http://example.com/fresch-cafe
* Then I expect to see all products defined for Fresch Cafe
* And I expect to see branding defined for Fresch Cafe

## Public Visitor

As a public, unauthenticated visitor to a supplier I can:

* Browse all products
* Browse products by product types
* Add a product to my cart
* View my cart
* Remove a product from my cart
* Increase the quantity of a product in my cart
* Log in, which does not clear the cart
* Maintain a separate shopping cart for each supplier I browse
* Purchase items in a shopping cart when I provide my email, billing address, shipping address, and credit card number.
* Create an account
* When I create an account, then I expect to receive a welcome email
* Login with my account and become an authenticated shopper

Unauthenticated users are NOT allowed to:

* View another user’s private data (such as current order, etc.)
* Checkout (until they log in)
* View the administrator screens or use administrator functionality
* Make themselves an administrator

### First-time User Experience

* I may proceed through the process of adding an item to my cart and checking out
* I may then create an account or simply enter my email, billing, shipping, and credit card info
* If I create an account, I will immediately resume the checkout process
* If I do not create an account
* My order confirmation email will include a unique, obscure link to view my order details
* The unique link will be displayed on the confirmation page for the order

## Authenticated Shopper

As an authenticated shopper I can:

* Maintain a separate shopping cart for each supplier I browse
* Make purchases on any supplier I am browsing
* Recieve an email confirmation of my order with basic order details and a link to the order detail page
* Manage my account information shared by all suppliers centrally on my account page
* Shipping addresses
* Billing addresses
* Credit cards associated with my account
* Basic account info like name and password
* View and manage my purchase history across all suppliers
* Create a new supplier, pending admin approval, via my account page
* Specify basic supplier info: name, URL identifier, and description
* Automatically become supplier admin

## Authenticated Supplier Staff

As an authenticated supplier staff, I can:

* Add products, edit products, and retire products in my supplier only

## Authenticated Supplier Administrator

As an authenticated supplier admin, by using a dedicated admin area, I can:

* Do everything a stocker for my supplier can do
* Update the details of my supplier such as the: name, URL identifier, and description
* Add or remove supplier stocker accounts
* Adding a stocker account automatically emails the account holder with a link to confirm their account and status
* Add or remove other admins for the supplier
* Create product listings including a name, description, price, and upload a photo
* Modify existing products’ name, description, price, and photo
* Create named product types for products (eg: "Hot Drinks", "Juices")
* Assign products to product types or remove them from product types. Products can belong to only one product type.
* Retire a product from being sold, which hides it from browsing by any non-administrator

As an Administrator, I can also view an order "dashboard" where I can:

* See a listing of all orders with:
  * the total number of orders by status
  * links for each individual order
  * filter orders to display by status type (for statuses "Order Received", "In Progress", "Ready For Collection", "Collected")
  * link to transition to a different status:
    * link to "cancel" individual orders which are currently "ordered" or "paid"
    * link to "mark as paid" orders which are "ordered"
    * link to "mark as completed" individual orders which are currently "paid"
* Access details of an individual order, including:
  * Order date and time
  * Purchaser full name and email address
  * For each product on the order:
    * Name linked to the product page
    * Quantity
    * Price
    * Line product subtotal
  * Total for the order
  * Status of the order

NOT allowed to:

* Modify any personal data aside from their own
* Be fewer than 1 admin for a supplier

## Authenticated Platform Administrator

As an authenticated Platform Administrator, I can:

* Approve or decline the creation of new suppliers
* Take a suppliers "offline" temporarily so that attempting to browse it redirects its root and displays a maintenance message
* Bring an offline supplier back online
* Override/assist suppliers admins in any functionality available to them via the admin portion of their supplier pages

## Authenticated Users (Non-Administrators)

Allowed To:

* do everything Unauthenticated Users can do except "log in"
* log out
* view their past orders with links to display each order
* on that order display page there are:
  * products with quantity ordered and line-item subtotals
  * links to each product description page
  * the current status of the order
  * order total price
  * date/time order was submitted
  * if completed or cancelled, display a timestamp when that action took place
  * if any product is retired from the menu:
    * they can still access the product page
    * they cannot add it to a new cart

NOT allowed to:

* view another user’s private data (such as current order, etc.)
* view the administrator screens or use administrator functionality
* make themselves an administrator


# Data Validity

There are several types of entities in the system, each with certain required data. Any attempt to create or modify a record with invalid attributes should return the user to the input form with a validation error indicating the problem along with suggestions how to fix it.

## Product

* ~~A product must have a name and price.~~
* ~~A product must belong to at least one product type.~~
* ~~The title cannot be empty strings.~~
* ~~The price must be a valid decimal numeric value and greater than zero.~~
* The photo is optional. ~~If not present, a stand-in photo is used.~~

## User

* ~~A user must have a plausibly valid email address that is unique across all users~~
* ~~A user must have a full name that is not blank~~

## Order

* An order must belong to a user
* An order must be for one or more products currently being sold

# Enhancements

## Is My Order Ready?

### Magic 8-ball

You can’t place a pickup order and expect it ready immediately. Predict the pickup time when an order is submitted:

* Each product in the store has a preparation time, defaulting to 4 minutes. Products can be edited to take longer.
* If an order has more than 4 products, add 6 minutes for every additional 4 products.
* Each already "paid" order in the system which is not "complete" delays the production start of this new order by 4 minutes.

### SAVINGS! SAVINGS! SAVINGS!

Administrators may put products or entire product types of products on sale. They can:
* Create a "sale" and connect it with individual products or entire product types
* Sales are created as a percentage off the normal price
* View a list of all active sales
* End a sale
On the order "dashboard" they can:
* View details of an individual order, including:
  * If purchased on sale, original price, sale percentage and adjusted price
  * Subtotal for the order
  * Discount for the order
  * Total for the order reflecting any discounts from applicable sales
As an Unauthenticated User:
* Sale prices are displayed in product listings alongside normal price and percentage savings

### What’s Good Here?

On any product I can, as an Unauthenticated User:
* See the posted reviews including:
  * title, body, and a star rating 0-5
  * the display name of the reviewer
* See an average of the ratings broken down to half-stars
On products I’ve purchased, as an Authenticated User I can:
* Add a rating including:
  * Star rating 0-5
  * Title
  * Body text
* Edit a review I’ve previously submitted until 15 minutes after I first submitted it

### The Machine Knows What You Like

Implement simple recommendations including:

* The ability to easily see your last order and add the same products to the current order
* After a product is added to and order, recommend three products other customers have ordered with this product. If there aren’t three other things that’ve been ordered, fill in with the most popular overall products
* Combinations of several products (ex: an espresso, latte, and bubble tea) with a small discount over ordering them individually

### Where Is It?

Implement full-text search for both the consumer and administrator:

#### Consumer

* Search for products in the whole site
* Search through "My Orders" for matches in the product name or description

##### Administrator

Search orders using a builder-style interface (like Google’s "Advanced Search") allowing them to specify any of these:

* Status (drop-down)
* Order total (drop-down for >, <, = and a text field for dollar-with-cents)
* Order date (drop-down for >, <, = and a text field for a date)
* Email address of purchaser

### Transaction Processor

Implement a "checkout" procedure using Stripe, Paypal or another service to handle credit card transactions in a "sandboxed" developer environment.

When the card is processed, update the order to "paid" and send a confirmation email to the user.

### Phone Confirmation

As a supplier I have a registered contact phone number. When an order is placed online the system calls me with an interaction like this:

* "Hi, this is BNG calling with an online order. Press 1 to accept, 3 to reject". They press "1"
* "The customer name is Jeff Fenton."
* "The customer will pickup the order at 5:45PM"
* "The order includes: an espresso, latte, and bubble tea. There are a total of 3 products."
* "Press 1 to confirm the order, 2 to repeat, or 3 to cancel."
* The result of the call updates the order in the database and sends an email to the customer.