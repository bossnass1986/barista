class OrderNotifier < ApplicationMailer

  default :from => 'any_from_address@example.com'

  def new_record_notification(record)
    @record = record
    mail to: 'paul.mcguane@me.com', subject: "Success! You did it."
  end
end
