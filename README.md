# Online Store project

This is a really simple project that make to sales control and inventory management.
*Obs: When I say '**SIMPLE**', believe on me :D.*
 
**Project Purpose**: Study Rails 6, webpack and the integration 
with the Elegant Admin Lite template from wrappixel (and hopefully construct a usefull application).

Attention: You need install yarn to go through this step by step. 

## Setting up bootstrap with webpack

1 - Run the commands:
<pre>
rails webpacker:install
yarn add bootstrap jquery popper.js
</pre>

2 - Go to `config/webpack/environment.js` and paste the code below:

<pre>
const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}));
module.exports = environment;
</pre>

4 - Create `application.scss` file inside `app/javascript/stylesheets` and import bootstrap:
<pre>
// app/javascript/stylesheets/application.scss

@import "~bootstrap/scss/bootstrap";
</pre>

5 - Add `<%= stylesheet_pack_tag 'application', 'data-turbolinks-track': 'reload' %>` 
inside head tag in `application.html.erb` file.  

6 - Go to `application.js` and paste the code below after `require` statements:
<pre>
import "bootstrap";
// Why this is necessary? Shouldn't stylesheet_pack_tag do this work? I really don't know!
import "../stylesheets/application";

document.addEventListener('turbolinks:load', () => {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
});
</pre>

Bootstrap should work!

## Setting up fontawesome with webpack

1 - Run:
<pre>
yarn add --dev @fortawesome/fontawesome-free
</pre>

2 - Go to `app/javascript/packs/application.js` and import fontawesome:
<pre>
import "@fortawesome/fontawesome-free/js/all";
</pre>

## Setting up Elegant Admin template in project 
https://www.wrappixel.com/templates/elegant-admin-lite/

1 - Download the template source. Copy `elegant-admin-lite-master/html/dist/scss` files in template source
to `app/javascript/stylesheets/template`. 

2 - Open `app/javascript/stylesheets/template/style.scss` and remove fontawesome and themify sources. 
Then move your bootstrap import from `app/javascript/stylesheets/application.scss` to `style.scss`.
The code inside `style.scss` should be something like this:
<pre>
@import 'variable';
@import 'colors/default-dark';

// Bootstrap need to be imported after the files above
@import "~bootstrap/scss/bootstrap";

//This is the core files
@import 'core/core';
@import 'widgets/widgets';
@import 'responsive';
</pre>

3 - Import the `style.scss` in `app/javascript/stylesheets/application.scss`:
<pre>
// Bootstrap should be imported inside style.scss!!!!
@import "template/style";
</pre> 

4 - If you run `rails s` there is probably a bug with fonts. This is because template import some fonts,
that will not be used in this specific aplication. So I decided remove it from project.
Open `app/javascript/stylesheets/template/core/other-common.scss` and search for `icons path`, `@font-face` or something like this.
Then remove all font-face declarations. 

Obs: If you want to use this fonts, import then in somewhere in your project
and correct the path to then.


##Scaffolds

- `rails g scaffold category description:string`