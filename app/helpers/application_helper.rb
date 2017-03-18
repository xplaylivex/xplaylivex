module ApplicationHelper
  def header_parameters
    btn_header = []

    if user_signed_in?
      btn_header = [
        { link: destroy_user_session_url, text: I18n.t('navbar.signout'), method: :delete },
        { link: '#footer', text: I18n.t('navbar.subscribe') }
      ]

      if current_user.role == User::ADMIN_TYPE
        btn_header << { link: '#', text: I18n.t('navbar.admin') }
      end
    else
      btn_header = [
        { link: new_user_session_url, text: I18n.t('navbar.signin') },
        { link: new_user_registration_url, text: I18n.t('navbar.signup') },
        { link: '#footer', text: I18n.t('navbar.subscribe') }
      ]
    end

    {
      route_index: root_url,
      logo: '',
      menu_header: [
        { link: root_url, text: I18n.t('navbar.index'), active: true },
        { link: videos_url, text: I18n.t('navbar.videos'), active: false },
        { link: games_url, text: I18n.t('navbar.games'), active: false },
        { link: links_url, text: I18n.t('navbar.links'), active: false },
        { link: '#impFeature', text: I18n.t('navbar.about'), active: false }
      ],
      btn_header: btn_header
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
