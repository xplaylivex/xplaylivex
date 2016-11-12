module ApplicationHelper
  def header_parameters
    {
      route_index: root_url,
      logo: '',
      menu_header: [
        { link: root_url, text: I18n.t('navbar.index'), active: true },
        { link: root_url + '#proposition', text: I18n.t('navbar.proposition'), active: false },
        { link: games_url, text: I18n.t('navbar.games'), active: false },
        { link: '#gallery', text: I18n.t('navbar.links'), active: false },
        { link: '#impFeature', text: I18n.t('navbar.about'), active: false }
      ],
      btn_header: [
        { link: new_user_session_url, text: I18n.t('navbar.signin') },
        user_signed_in? ? { link: destroy_user_session_url, text: I18n.t('navbar.signout') } : { link: new_user_registration_url, text: I18n.t('navbar.signup') },
        { link: '#footer', text: I18n.t('navbar.subscribe') }
      ]
    }
  end

  def footer_parameters
    {
      with_newsletter: true,
      title: I18n.t('footer.name'),
      description: I18n.t('footer.description'),
      placeholder: I18n.t('footer.placeholder'),
      button_label: I18n.t('footer.button_label')
    }
  end
end
