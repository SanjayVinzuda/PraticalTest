class Product < ApplicationRecord
  require 'csv'

  belongs_to :user
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true

  def self.import(file, user)
    begin
      CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|  
      Product.create! row.to_hash.merge(user: user)
      end
    rescue
      return false
    end
  end
end
