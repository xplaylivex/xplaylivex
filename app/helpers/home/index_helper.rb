module Home
  module IndexHelper
    def self.view_parameters()
      {
        title: I18n.t('home-title', from: DateTime.now.beginning_of_week.strftime('%d/%m/%Y'), to: DateTime.now.end_of_week.strftime('%d/%m/%Y') ),
        text: I18n.t('home-text').html_safe,
        id: 'schedule',
        iframe: 'https://www.youtube.com/embed/J-J0zAUtDY4'
      }
    end
  end
end
