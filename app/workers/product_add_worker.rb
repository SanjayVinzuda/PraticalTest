class ProductAddWorker
  include Sidekiq::Worker
  # sidekiq_options retry: false
  sidekiq_options queue: "high"

  require 'csv'

  def perform(path)
      begin
        CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|  
          Product.create! row.to_hash.merge(user: user)
        end
      rescue
        return false
      end
  end
end
