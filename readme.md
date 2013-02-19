# Bearded Responsive Grid Example

This is a simple demo page using the responsive grid I developed for the Pittsburgh Children's Museum website. Since then, we've continued using variations of it on our client sites at Bearded. It's a 12-column grid that uses percentages for everything. The values I used for gutter and column widths are calculated to never be more granular than an eighth of a percent, to avoid rounding issues.

Here are the major points:

## Infinitely Nest-able

You can nest grids to your heart's content. Put a 6 column layout in side a 4-column layout. To do this I decided to forgo the split-the-gutters approach, and went with right margin gutters instead. That means we need to know what the last column is so we can remove the gutter on it. I made some handy mixins to help with this (more details below).

## Compass-y and Sass-y

The grid is for use with Sass, and the Compass framework in specific. All the useable parts are mixins, of which there are two categories: column settings and last settings. Column settings apply column-based widths. Last settings calculate a pattern for which columns get the last setting (and thus no right margin).

### Column Settings

When determining what to use, remember that the width of an area is calculated in the number of columns (out of a possible 12) that make up that width. So an area that you want to be 50% of the possible width it could be (ie. 6 columns wide) should get @include column(6).

### Last Settings

On the other hand, last settings are trying to determine which column will get the last class (and thus no right margin). If you want to do a two-column layout, you'd use @include last-col2.

### Example

So if you want a 4 column grid, you'll want to combine @include column(3) (3 x 4 = 12) with @include last-col4. Cool? Cool.

## Browser Support

The grid relies heavily on the nth-child pseudo-class, [which isn't supported in IE7 or 8 "When Can I Use CSS3 Selectors"](http://caniuse.com/#feat=css-sel3). For the Children's Museum site we added classes with Javascript. But since then we've realized that it's generally more efficient to add classes into our markup, and then make sure the grid CSS uses those selectors as a fall-back to nth-child. 

Having an nth-child-based grid is great during the wireframing and design process because of all the speed and flexibility it provides in achieving layouts. With a finished site design, though, there often won't be that many layouts to account for, so this seems like a fairly sane approach to get IE working.

## 12 or 16?

The grid file also has variables for a 16-column layout commented out. Feel free to exchange those for the 12-column variables. The advantage of 12-column is, of course, that you you can easily achieve equal-width 3 or 4 column layouts. With a 16-column grid you lose the equal width 3-column option, but your grid is a little more granular. With a little more work, a well-implemented 16-column grid can lead to some really cool asymmetrical layouts.

Enjoy!

======

# Bearded Grid Gem

If you're using Ruby on Rails or want to use the Bearded Grid on your own project, we've created a [Ruby Gem](https://rubygems.org/gems/bearded_grid)!

Rails folks, you'll probably want to add the gem to your Gemfile.

If you're using Compass without Rails, you'll first want to install the gem:
`gem install bearded_grid`

And then in your config.rb file, add this line:
`require 'bearded_grid'`

Of course, you'll need to re-compile your project, and then you should be able to access the grid styles.

## Pro-tip(s):

You may want to configure your containers' max-widths. You can do so by doing the following:

    .my-container {
      @include container;
    }

By default, your container will get a max-width of 81.25em (1300px). If you want to customize this, simply do:

    .my-container {
      @include container(68.75em);
    }

Container will accept both `em` and `px` values, but will not convert from one to the other. If you're not yet using em-based media queries, please consider doing so! You can get more info on why it's a good idea here: [The EMs have it: Proportional Media Queries FTW!](http://blog.cloudfour.com/the-ems-have-it-proportional-media-queries-ftw/)