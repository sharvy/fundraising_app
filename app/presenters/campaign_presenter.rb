class CampaignPresenter
  TRUNCATE_DEFAULTS = { title: 40, description: 200 }.freeze
  delegate_missing_to :@campaign

  def initialize(campaign)
    @campaign = campaign
  end

  def short_title
    campaign.title.truncate(TRUNCATE_DEFAULTS[:title])
  end

  def short_description
    campaign.description.truncate(TRUNCATE_DEFAULTS[:description])
  end

  def goal_description
    "<strong>BDT #{donation_collected}</strong> raised of <strong>BDT #{campaign.goal}</strong>".html_safe
  end

  def percentage_completed
    (donation_collected / goal) * 100
  end

  def donation_collected
    @donation_collected ||= rand(100)
  end

  private

  attr_reader :campaign
end
