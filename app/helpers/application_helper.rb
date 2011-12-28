module ApplicationHelper
  def markdown(text)
      options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
      Redcarpet.new(text, *options).to_html.html_safe
  end

  def notice_block
    %Q(<section id="notice">#{notice}</section>).html_safe if notice
  end

  def alert_block
    %Q(<section id="alert">#{alert}</section>).html_safe if alert 
  end
end
