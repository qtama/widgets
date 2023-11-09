# Preview all emails at http://localhost:3000/rails/mailers/test_mailer
class FinanceMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/test_mailer/test
  def high_priced_widget
    manufacturer = FactoryBot.build(:manufacturer, name: 'Cyberdyne Systems')
    widget = FactoryBot.build(:widget, name: 'Stembolt', price_cents: 810_00, manufacturer:)
    FinanceMailer.high_priced_widget(widget)
  end
end
