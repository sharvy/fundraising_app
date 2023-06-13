require 'test_helper'
require 'minitest/mock'

class CampaignPresenterTest < ActiveSupport::TestCase
  def setup
    campaign = Campaign.new(
      title: ('This is a big title. ' * 10),
      description: ('This is a 100 lines long paragraph. ' * 100),
      goal: 100
    )
    @presenter = campaign.decorate
  end

  test 'short_title truncates the campaign title' do
    assert_equal 'This is a big title. This is a big...', @presenter.short_title
  end

  test 'short_description truncates the campaign description' do
    assert_equal 'This is a 100 lines long...', @presenter.short_description(length: 30)
  end

  # TODO: Fix this when donation_collected is properly implemented
  test 'goal_description returns the formatted goal' do
    mock = Minitest::Mock.new
    presenter = CampaignPresenter.new(mock)

    presenter.expect(:donation_collected, 50) do
      presenter.expect(:goal, 100) do
        expected = '<strong>BDT 50</strong> raised of <strong>BDT 100</strong>'
        assert_equal expected, presenter.goal_description
      end
    end
  end
end
