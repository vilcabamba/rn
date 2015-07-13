# == Schema Information
#
# Table name: butacas
#
#  id             :integer          not null, primary key
#  uid            :string           not null
#  detail         :string
#  price_cents    :integer          default("0"), not null
#  price_currency :string           default("USD"), not null
#  status         :integer          default("0")
#  escenario_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ButacaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
