namespace :bloodbath do
  desc "It will remove all anonymous user from the system"
  task remove_all_anonymous: :environment do
    Tasks::Bloodbath::RemoveAllAnonymous.new.perform
  end
end
