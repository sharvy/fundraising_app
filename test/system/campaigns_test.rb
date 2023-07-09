# frozen_string_literal: true

require 'application_system_test_case'

class CampaignsTest < ApplicationSystemTestCase
  setup do
    @campaign = campaigns(:one)
  end

  test 'visiting the index' do
    visit campaigns_url
    assert_selector 'h1', text: @campaign.title
  end

  test 'should create campaign' do
    visit campaigns_url
    click_on 'New campaign'

    fill_in 'Description', with: @campaign.description
    fill_in 'Goal', with: @campaign.goal
    fill_in 'Title', with: @campaign.title
    click_on 'Submit'

    assert_text 'Campaign was successfully created'
  end

  test 'should update Campaign' do
    visit campaign_url(@campaign)
    click_on 'Edit', match: :first

    fill_in 'Description', with: @campaign.description
    fill_in 'Goal', with: @campaign.goal
    fill_in 'Title', with: @campaign.title
    click_on 'Submit'

    assert_text 'Campaign was successfully updated'
  end

  test 'should destroy Campaign' do
    visit campaign_url(@campaign)
    click_on 'Destroy', match: :first

    assert_text 'Campaign was successfully destroyed'
  end
end
