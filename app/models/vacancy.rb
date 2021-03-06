# frozen_string_literal: true

class Vacancy < ApplicationRecord
  has_many :body_attributes, dependent: :destroy,
                             class_name: 'Vacancy::Attribute'
  has_many :requests, class_name: 'Vacancy::Request'
  belongs_to :specialty, class_name: 'Vacancy::Specialty'
  belongs_to :user

  validates :name, presence: true, length: { minimum: 10, maximum: 30 }
  validates :description, presence: true,
                          length: { minimum: 50, maximum: 2000 }
  validates :country, presence: true
  validates :city, presence: true, length: { minimum: 3, maximum: 25 }

  def country_name
    cntr = ISO3166::Country[country]
    cntr.translations[I18n.locale.to_s] || cntr.name unless cntr.nil?
  end

  def self.search_vacancies(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
