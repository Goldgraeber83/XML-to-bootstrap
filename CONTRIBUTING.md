# Contributing to XML-to-Bootstrap

Please use the [issue tracker](https://github.com/acch/XML-to-bootstrap/issues) to ask questions, report bugs and request features.

## Contributing new content and updates

- Fork the [code](https://github.com/acch/XML-to-bootstrap) to your own Git repository
- Make changes in your forked repository
- When you are happy with your updates, submit a [pull request](https://github.com/acch/XML-to-bootstrap/pulls) describing the changes
- IMPORTANT: Make sure that your forked repository is in sync with the base repository before sending a pull request
- The updates will be reviewed and merged in

Adhere to the excellent [Code Guide](http://codeguide.co/).

Wrap all JavaScript into [IIFE](http://benalman.com/news/2010/11/immediately-invoked-function-expression/), and use the [Module Pattern](http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html) when necessary.

## Understanding the code structure

The main stylesheet `main.xsl` imports all other stylesheets. It contains a template to match the root element ('/') which calls all other named templates. More specifically, it calls the *home* template to generate the home page (defined in `home.xsl`), the category templates to generate these pages if they are enabled (*articles*, *projects* and *galleries*, defined in `articles.xsl`, `projects.xsl` and `galleries.xsl`), as well as the *options* template (defined in `options.xsl`) to generate a JSON file holding options used in JavaScript code, and the *sitemap* template (defined in `sitemap.xsl`) to generate a comprehensive page sitemap.

Each of the category templates works in the following way: the **named** template *articles*, *projects* or *galleries* (plural) generates the required number of HTML pages for the category. To do so, it calls the named template *html.page* once or multiple times, passing the desired content as parameter. The *html.page* template (defined in `html.xsl`) produces the required HTML code for the respective page, and then calls 'apply-templates' on the specified content to give control back to the category templates. The templates **matching** *articles*, *projects* or *galleries* elements (plural - defined in `overview.xsl`) or *article*, *project* or *gallery* elements (singular - defined in `detail.xsl`) then produce and format the actual content for the pages. They do so by using components defined in `components.xsl`. Specifically note the difference between the named templates and the templates matching the *articles*, *projects* and *galleries* elements.

Furthermore, `common.xsl` contains global constants and helper functions used in other templates, and `elements.xsl` contains templates generating optional page elements which are used on some pages (such as navigation elements or icons).

## Page structure

For a better understanding of the page structure, there are schematic diagrams of the page (markup) structure available in the `docs/` directory. These drawings provide a high-level overview of the most important page elements. The grid and other minor layout components are omitted for the sake of clarity.

## Copyright and license

By contributing, you agree to license your contribution under the [MIT License](LICENSE).
