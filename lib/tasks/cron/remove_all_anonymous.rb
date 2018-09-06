# we remove all the anonymous users
class Tasks::Cron::RemoveAllAnonymous

  def initialize
    puts "Task initialized."
    User.where(role: :anonymous).destroy_all
  end

  def perform

    puts "Task performed."
  end

  private

end
