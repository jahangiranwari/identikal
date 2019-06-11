# Identikal

A no frills tiny gem that does one thing and only one thing. It compares two unencrypted PDF files and returns **true** if they are identical and **false** otherwise. PDF comparison is done in pure Ruby with the help of [HexaPDF](https://github.com/gettalong/hexapdf) and [PDF::Reader](https://github.com/yob/pdf-reader).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'identikal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install identikal

## Usage

### CLI
Comparing two PDFs from command line can be done by running the below command:

```bash
$ identikal file_a.pdf file_b.pdf
true
```

**Text Only**

If you would like to compare only the "text" content of the PDFs add the `-t` flag:

```bash
$ identikal -t file_a.pdf file_c.pdf
false
```

### Ruby Code
Besides the command line tool Identikal can also be used in a Ruby application. Identikal supports the following `compare_method`:

* `:all`  compare text along with formatting
* `:text` compare only text content

`:all` is the default comparison method.


**Text with formatting**
```ruby
require 'identikal'

base_path = File.expand_path(File.join(__dir__) + '/pdfs')
pdf_a = File.join(base_path, 'report_a.pdf')
pdf_b = File.join(base_path, 'report_b.pdf')

if Identikal.files_same?(pdf_a, pdf_b)
  # some action when files are identical
else
  # another action when files are different
end
```

**Text Only**
```ruby
require 'identikal'

base_path = File.expand_path(File.join(__dir__) + '/pdfs')
pdf_a = File.join(base_path, 'report_a.pdf')
pdf_b = File.join(base_path, 'report_b.pdf')

if Identikal.files_same?(pdf_a, pdf_b, compare_method: :text)
  # some action when files are identical
else
  # another action when files are different
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
