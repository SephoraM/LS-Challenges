require 'date'

# Note: The solution that is provided is much better. The next time you tackle
# this problem, consider a different approach. Look at the solution again if you
# need to.
class Meetup
  WEEKDAYS = %i[sunday monday tuesday wednesday thursday friday saturday].freeze
  SCHEDULE = %i[first second third fourth last].freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    end_date = Date.new(@year, @month, -1).day
    days = []
    1.upto(end_date) do |day|
      days << day if WEEKDAYS[Date.new(@year, @month, day).wday] == weekday
    end

    planner = monthly_schedule(days)

    Date.new(@year, @month, planner[schedule])
  end

  private

  def monthly_schedule(days)
    days.each_with_object({}).with_index do |(day, plans), idx|
      plans[SCHEDULE[idx]] = day
      plans[:teenth] = day if (13..19).cover?(day)
      plans[:last] = day if day == days.last
    end
  end
end
