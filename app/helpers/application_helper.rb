# frozen_string_literal: true

module ApplicationHelper
  def notification_status
    current_user.friendship_request.count
  end
end
