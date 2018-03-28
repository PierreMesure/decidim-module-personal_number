# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :personal_number_feature, parent: :feature do
    name { Decidim::Features::Namer.new(participatory_space.organization.available_locales, :personal_number).i18n_name }
    manifest_name :personal_number
    participatory_space { create(:participatory_process, :with_steps) }
  end

  # Add engine factories here
end
