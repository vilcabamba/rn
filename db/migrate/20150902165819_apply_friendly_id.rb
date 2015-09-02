class ApplyFriendlyId < ActiveRecord::Migration
  def up
    Expositor.find_each(&:save)
  end
  def down
    say "doing nothing.."
  end
end
