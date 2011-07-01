class AdminMailer < ActionMailer::Base

  default :from => "Casa +o- <info@casamasomenos.net>"
  HOST = Rails.env.production? ? "casamasomenos.net" : "localhost:3000"
  RECIPIENTS = '"lapanaderia" <info@despachodepan.com>, "Esperanza Moreno Cruz" <espeeee@gmail.com>, "dani" <danigb@gmail.com>'
  default_url_options[:host] = HOST



  def comment_email(comment)
    @comment = comment
    date = Time.now.strftime("%d/%m/%Y")
     mail(:to => RECIPIENTS, :subject => "#{date} Casamasomenos.net :: #{comment.resource.title} comentado ")
  end

end
