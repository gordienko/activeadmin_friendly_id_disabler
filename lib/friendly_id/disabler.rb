# frozen_string_literal: true

module FriendlyId
  # The Disabler module manages the temporary disabling of FriendlyId functionality
  # by utilizing a thread-local variable. This module provides methods to check
  # the current state of FriendlyId (enabled/disabled) and to execute blocks with
  # FriendlyId disabled.
  module Disabler
    # A key used in `Thread.current` to store the state of FriendlyId (enabled/disabled).
    THREAD_LOCAL_KEY = :__friendly_id_enabler_disabled

    class << self
      # Checks if FriendlyId is currently disabled.
      #
      # @return [Boolean] returns true if FriendlyId is currently disabled in the thread.
      def disabled?
        !!Thread.current[THREAD_LOCAL_KEY]
      end

      # Temporarily disables FriendlyId for the duration of the given block.
      #
      # This method sets a thread-local flag that is checked by the `FriendlyId::Slugged#to_param`
      # method. It ensures that the disabling is scoped only to the current thread of execution.
      #
      # @yield the block of code during which FriendlyId should be disabled.
      def disable_friendly_id
        old_value = Thread.current[THREAD_LOCAL_KEY]
        Thread.current[THREAD_LOCAL_KEY] = true
        yield
      ensure
        Thread.current[THREAD_LOCAL_KEY] = old_value
      end
    end
  end

  # The Slugged module is an extension of FriendlyId''s functionality,
  # providing a way to customize how object URLs are generated with slugs.
  module Slugged
    # Overrides the default `to_param` method to conditionally return the record''s ID
    # when FriendlyId is disabled, otherwise leveraging the slug functionality.
    #
    # @return [String] the URL-safe parameter string representing the object.
    def to_param
      ::FriendlyId::Disabler.disabled? ? id&.to_s : super
    end
  end
end
