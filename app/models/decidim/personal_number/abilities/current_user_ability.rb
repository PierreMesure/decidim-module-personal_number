# frozen_string_literal: true

module Decidim
  module PersonalNumber
    module Abilities
      # Defines the abilities related to personal_number for a logged in user.
      # Intended to be used with `cancancan`.
      class CurrentUserAbility
        include CanCan::Ability

        attr_reader :user, :context

        def initialize(user, context)
          return unless user

          @user = user
          @context = context

          # can :manage, SomeResource if authorized?(:some_action)
        end

        private

        def authorized?(action)
          return unless feature

          ActionAuthorizer.new(user, feature, action).authorize.ok?
        end

        def current_settings
          context.fetch(:current_settings, nil)
        end

        def feature_settings
          context.fetch(:feature_settings, nil)
        end

        def feature
          feature = context.fetch(:current_feature, nil)
          return nil unless feature && feature.manifest.name == :personal_number

          feature
        end
      end
    end
  end
end
