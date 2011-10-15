guard-docbook-status
===========

The docbook-status guard will watch your DocBook documents and check
their status when they change. It is meant to work with the
'docbook_status'  utility, see https://github.com/rvolz/docbook_status

Usage
--------

See the [Guard documentation](https://github.com/guard/guard#readme) for general instructions.

To start with this add-on, create your Guardfile with:

    guard init docbook-status

Then change the resulting Guardfile, if necessary. The standard Guardfile looks like this:

    guard 'docbook-status', :cli => '--remarks myproject.xml' do
       watch(/.+\.xml$/i)
    end

To adapt the Guardfile to your requirements:

* change the _cli_ option. It can contain all options that you would normally use to start docbook_status.
* change the _watch_ statement. The regular expression currently looks for changes in all XML files. A change there would trigger the processing by docbook_status.

Install
-------

Since you are reading this, it is assumed that you have [docbook_status](https://github.com/rvolz/docbook_status) already installed. Since this is a Guard add-on, you'll need also [Guard](https://github.com/guard/guard) to be installed. 

Then install this add-on with

    gem install guard-docbook-status

or add it to your Gemfile

    gem 'guard-docbook-status'


Author
------

Original author: Rainer Volz

License
-------

(The MIT License) 

Copyright (c) 2011 Rainer Volz

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
