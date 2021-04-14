module ApplicationHelper
  def body_class
    r = []
    r.push "b-#{params[:controller].gsub("/", "_")}"
    r.push "b-#{params[:controller].gsub("/", "_")}-#{params[:action]}"
    r.join(" ")
  end
end
