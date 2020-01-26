# Online Store project

This is a really simple project to make sales control and inventory management.
*Obs: When I say '**SIMPLE**', believe on me :D.*
 
**Project Purpose**: Study Rails 6 and webpack integration (and hopefully construct a usefull application).

## NOTES
Project Structure:
<pre>
rails g scaffold Category description:string
rails g scaffold Subcategory description:string category:references
rails g scaffold Supplier name:string
rails g scaffold Seller name:string
rails g scaffold Product title:string description:string comission:decimal category:references subcategory:references
rails g scaffold Product_Entry payment_date:string forecast_receipt_date:date receipt_date:date amount:integer price:decimal observation:string product:references supplier:references
rails g scaffold Product_Exit amount:integer price:decimal observation:string comission:decimal product:references seller:references
rails g model Product_Balance amount:integer product_entry:references product_exit:references product:references
</pre>
