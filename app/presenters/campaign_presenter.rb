# frozen_string_literal: true

class CampaignPresenter < SimpleDelegator
  TRUNCATE_DEFAULTS = { title: 40, description: 200 }.freeze

  def short_title(length: TRUNCATE_DEFAULTS[:title])
    title.truncate(length, separator: ' ')
  end

  def short_description(length: TRUNCATE_DEFAULTS[:description])
    description.truncate(length, separator: ' ')
  end

  def goal_description
    "<strong>BDT #{donation_collected}</strong> raised of <strong>BDT #{goal}</strong>".html_safe
  end

  def progress
    (donation_collected / goal) * 100
  end

  # TODO: Fix this, remove random number and get it from campaign model
  def donation_collected
    @donation_collected ||= rand(100)
  end

  private

  attr_reader :campaign
end
