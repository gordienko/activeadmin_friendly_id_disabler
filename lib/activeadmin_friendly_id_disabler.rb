# frozen_string_literal: true

require 'active_support'
require 'active_support/concern'
require_relative 'activeadmin_friendly_id_disabler/version'
require 'activeadmin/friendly_id_disabler'
require 'friendly_id/disabler'

module ActiveadminFriendlyIdDisabler
  class Error < StandardError; end
end
