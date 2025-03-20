# frozen_string_literal: true

# The FriendlyIdDisabler module is designed to be used in ActiveAdmin controllers
# to temporarily disable FriendlyId's functionality during specific actions.
# This is especially useful when dealing with ActiveAdmin, which may not require
# the friendly slugs that FriendlyId generates.
#
# To use this module, include it in the ActiveAdmin controller context where you
# want to disable FriendlyId.

module ActiveAdmin
  # This module disables FriendlyId for the duration of the specified action.
  module FriendlyIdDisabler
    extend ActiveSupport::Concern

    included do
      # Prepend an around_action filter to disable FriendlyId when the action is run.
      prepend_around_action :disable_friendly_id
    end

    # Temporarily disables FriendlyId functionality within the given block.
    #
    # @param action [Proc] the block of code (typically a controller action) during which
    #   FriendlyId should be disabled.
    #
    # @note This method leverages a thread-local variable to manage the disabled state,
    #   ensuring that the disabling is scoped to the current thread only.
    def disable_friendly_id(&action)
      ::FriendlyId::Disabler.disable_friendly_id(&action)
    end
  end
end
