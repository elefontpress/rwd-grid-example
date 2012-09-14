# Bearded Responsive Grid Example

This is a simple demo page using the responsive grid I developed for the Pittsburgh Children's Museum website, and we've since been using variations of on our client sites at Bearded. It's a 12-column grid that uses percentages for everything. The calculations I used are calculated to never be more granular than an eighth of a percent to avoid rounding issues.

Here are the major points:

## Infinitely Nest-able

You can nest grids to your heart's content. Put a 6 column layout in side a 4-column layout. To do this I decided to forgo the split-the-gutters approach, and wen with right margin gutters instead. That means we need to know what the last column is so we can remove the gutter. I made some handy mix-ins to help with this.

## Compassy and SASSy

The grid is for use with SASS and the Compass framework in specific. All the useable parts are mix-ins, of which there are two categories: grid settings and last settings. Grid settings apply column-based widths. Last settings calculate a pattern for which columns get the last setting (and thus no right margin).

When determining what to use, remember that the width of an area is calculated in the number of columns (out of a possible 12) that make up that width. So an area that you want to be 50% of the possible width it could be (ie. 6 columns wide) should get @include column(6).

On the other hand, last settings are trying to determine which column will get the last class (and thus no right margin). If you want to do a two-column layout, you'd use @include last-col2.

So if you want a 4 column grid, you'll want to combine @include column(3) (3 x 4 = 12) with @include last-col4. Cool? Cool.

Enjoy!