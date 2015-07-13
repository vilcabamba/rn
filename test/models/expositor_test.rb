# == Schema Information
#
# Table name: expositors
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tipo_personeria :integer          default("0")
#  country         :string
#  city            :string
#  dni             :string           not null
#  phone           :string
#  mobile          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ExpositorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
