# frozen_string_literal: true

require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  def setup
    @campaign = Campaign.new(title: 'Test title', description: 'Test description', goal: 1000)
  end

  test 'should be valid' do
    assert @campaign.valid?
  end

  test 'title should be present' do
    @campaign.title = ''
    assert_not @campaign.valid?
    assert_includes @campaign.errors[:title], "can't be blank"
  end

  test 'description should be present' do
    @campaign.description = ''
    assert_not @campaign.valid?
    assert_includes @campaign.errors[:description], "can't be blank"
  end

  test 'goal should be present' do
    @campaign.goal = nil
    assert_not @campaign.valid?
    assert_includes @campaign.errors[:goal], "can't be blank"
  end

  test 'goal should be a positive value' do
    @campaign.goal = -100
    assert_not @campaign.valid?
    assert_includes @campaign.errors[:goal], 'must be greater than 0'
  end
end
