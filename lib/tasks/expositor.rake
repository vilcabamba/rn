namespace :expositor do
  desc "Recreate image versions for expositor"
  task recreate_images: :environment do
    Expositor.find_each do |expositor|
      expositor.photo.recreate_versions! if expositor.photo?
    end
  end
end
