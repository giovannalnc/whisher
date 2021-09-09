namespace :whisher do
  desc 'Check the products prices'
  task check_notifications: :environment do
    Product.all.each do |product|
      MonitoringJob.perform_now(product)
    end
  end
end
