# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params, page)
      results = all
      filtering_params.each do |key, value|
        results = results.where("#{key}::text like ?", "%#{value}%") if value.present?
      end
      results.page(page)
    end
  end
end
