# == Schema Information
#
# Table name: expositores
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tipo_personeria :integer          default("0")
#  country         :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address         :string
#  company         :string
#  web_site        :string
#  photo           :string
#  details         :text
#  interest        :text
#  alcance         :string
#  section_id      :integer
#  name            :string           not null
#

require 'test_helper'

class ExpositorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
