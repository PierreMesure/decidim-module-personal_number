# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module PersonalNumber
    # This is the engine that runs on the public interface of personal_number.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::PersonalNumber

      routes do
        # Add engine routes here
        # resources :personal_number
        # root to: "personal_number#index"
      end

      initializer "decidim_personal_number.assets" do |app|
        app.config.assets.precompile += %w[decidim_personal_number_manifest.js decidim_personal_number_manifest.css]
      end

      initializer "decidim_personal_number.inject_abilities_to_user" do |_app|
        Decidim.configure do |config|
          config.abilities += ["Decidim::PersonalNumber::Abilities::CurrentUserAbility"]
        end
      end
    end
  end
end
