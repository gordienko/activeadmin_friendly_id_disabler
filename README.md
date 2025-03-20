# ActiveAdmin FriendlyId Disabler

`activeadmin_friendly_id_disabler` is a Ruby gem designed to selectively disable the `FriendlyId` behavior for ActiveAdmin environments.
This allows applications to use standard IDs in URLs instead of slugs, which can help avoid potential conflicts and improve compatibility with certain frameworks.

## Features

- Temporarily disables `FriendlyId` functionality in ActiveAdmin controllers.
- Automatically reverts to standard ID usage within the specified context.
- Integrated using thread-local variables to ensure thread safety.

## Installation

1. **Add the gem to your Gemfile:**

   ```ruby
   gem 'activeadmin_friendly_id_disabler'

   ```

2. **Bundle Install:**

   Run the following command to install the gem:

   ```shell
   bundle install

   ```

3. **Create an initializer:**

   You need to configure your Rails application to use this module in ActiveAdmin controllers by creating an initializer. Create a file `config/initializers/activeadmin_friendly_id_disabler.rb`:

   ```ruby
   Rails.application.config.to_prepare do
     ActiveAdmin::BaseController.include(ActiveAdmin::FriendlyIdDisabler)
   end

   ```

   This code ensures that the `FriendlyId` is disabled for ActiveAdmin actions after the application initializes.

## Usage

Once you have installed the gem and set up the initializer, `FriendlyId` will be disabled in the context of ActiveAdmin controllers. This means any URLs generated will use the standard record IDs instead of slugs, preventing issues where slugs may not be necessary or desirable.

## Example

Here's a simple example of a `to_param` override within your models:

```ruby
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end

```

## Configuration

By default, the gem will automatically disable `FriendlyId` only for the duration of an action within ActiveAdmin controllers. If you need more granular control or need to disable `FriendlyId` in other parts of your application, consider implementing additional custom logic.

## Background and Acknowledgments

This gem was inspired by discussions around the need to selectively disable FriendlyId, as highlighted in [this GitHub issue](https://github.com/norman/friendly_id/issues/691). Special thanks to [Fabio Napoleoni](https://github.com/fabn) for contributing ideas that helped shape this solution.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/gordienko/activeadmin_friendly_id_disabler](https://github.com/gordienko/activeadmin_friendly_id_disabler).

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).