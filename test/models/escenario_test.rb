# == Schema Information
#
# Table name: escenarios
#
#  id         :integer          not null, primary key
#  uid        :string           not null
#  periodo    :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EscenarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
