# frozen_string_literal: true

module Decidim
  module PersonalNumber
    # This is the engine that runs on the public interface of `PersonalNumber`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::PersonalNumber::Admin

      paths["db/migrate"] = nil

      routes do
        # Add admin engine routes here
        # resources :personal_number do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "personal_number#index"
      end

      initializer "decidim_personal_number.inject_abilities_to_user" do |_app|
        Decidim.configure do |config|
          config.admin_abilities += ["Decidim::PersonalNumber::Abilities::AdminAbility"]
        end
      end

      def load_seed
        nil
      end
    end
  end
end
