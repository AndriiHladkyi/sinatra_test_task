class Message < ActiveRecord::Base
  validates_presence_of :title

  HOUR = 3600

  def hours_ago?
    (Time.now - created_at).to_i > HOUR * hours
  end

  def visits_empty?
    visits.zero?
  end

  def delete_message?
    hours_ago? || visits_empty?
  end
end
