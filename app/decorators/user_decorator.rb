class UserDecorator < ApplicationDecorator
  delegate_all

  def self.collection_decorator_class
    UsersDecorator
  end

  def has_invitations_left?
    true
  end

  def decrement_invitation_limit!
    return true
  end

  def worked_today
    time = source.present_as_time source.worked_today
    h.content_tag :h4, "#{time}", class: 'todays-act'
  end

  def worked_today_progress_bar
    h.content_tag :div, :class => 'progress' do
      bar_class = source.worked_today > 8 * 60 ? "bar-warning" : "bar-success"
      h.content_tag :div, "", :class => "bar percent#{source.worked_today_percent} #{bar_class}"
    end
  end

  def gravatar_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest source.email.downcase}?s=30"
  end

  def gravatar_url_larger
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest source.email.downcase}?s=60"
  end
end
